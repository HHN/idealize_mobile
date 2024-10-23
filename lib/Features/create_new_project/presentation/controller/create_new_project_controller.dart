import 'dart:io';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/routes.dart';
import 'package:idealize_new_version/Core/Data/Models/custom_x_file_model.dart';
import 'package:idealize_new_version/Core/Data/Models/link_model.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';
import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Core/Utils/image_upload_utils.dart';
import 'package:idealize_new_version/Features/home/presentation/controller/home_controller.dart';
import 'package:idealize_new_version/Features/my_projects/presentation/controller/my_projects_controller.dart';
import 'package:idealize_new_version/app_repo.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/create_new_project_repo.dart';

class CreateNewProjectController extends GetxController {
  late CreateNewProjectRepository repo;
  Project? updateProjectModel;

  int _page = 1;
  bool _lastPage = false;
  final RxBool loadingTags = false.obs;
  final _searchedProjects = <Project>[].obs;
  final _scrollController = ScrollController();
  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final RxBool loading = false.obs;
  final pageController = PageController();

  String routeFrom = "";

  String _title = "";
  String _description = "";
  String get title => _title;
  String get description => _description;

  RxInt currentStep = 1.obs;
  RxBool isDraft = false.obs;
  RxList<Tag> selectedTags = RxList<Tag>.empty();
  RxList<Tag> selectedCourses = RxList<Tag>.empty();
  RxList<User> selectedUsers = RxList<User>.empty();
  RxList<LinkModel> links = RxList<LinkModel>.empty();
  Rx<XFile?> pickedThumbnail = Rx<XFile?>(null);

  List<CustomXFile> files = [];
  List<CustomXFile> mediaFiles = [];

  List<ProjectFile> attachments = [];

  CreateNewProjectController({
    required this.repo,
  });

  List<Project> get searchedProjects => _searchedProjects;
  ScrollController get scrollController => _scrollController;

  Future<void> init() async {
    _scrollController.addListener(_scrollListener);
    await _fetchAllDraftProjects();
  }

  void updateTitle(String title) {
    _title = title;
    update();
  }

  void updateDescription(String description) {
    _description = description;
    update();
  }

  // void updateProjectStatus(ProjectStatus projectStatus) {
  //   _model.projectStatus = projectStatus;
  //   update();
  // }

  void onAddLink(LinkModel model) {
    if (links.length >= 5) {
      AppRepo().showSnackbar(
          label: 'Warning', text: 'You cannot add more than 5 links.');
      return;
    }

    links.add(model);
  }

  void deleteProject(Project project) async {
    loading.value = true;
    update();
    await repo.deleteProject(project.id);
    loading.value = false;
    update();
    refreshContent();
  }

  Future<void> deleteProjectMaterial(String attachmentId) async {
    AppRepo().showLoading();
    loading.value = true;
    update();
    final result = await repo.deleteMaterials(attachmentId);
    loading.value = false;
    update();

    if (result) {
      attachments.removeWhere((element) => element.id == attachmentId);
      await updateProjectAfterDeletingFiles();
    }

    AppRepo().hideLoading();
    update();
  }

  Future<void> createNewProject({bool saveAsDraftCondition = false}) async {
    loading.value = true;
    AppRepo().showLoading();
    update();
    attachments.clear();

    // Upload the attachments
    for (final media
        in mediaFiles.where((element) => !element.isUploadedMedia)) {
      final uploadFile = await repo.uploadFile(
        media.path,
        media.mediaType,
      );

      if (uploadFile != null) {
        attachments.add(uploadFile);
      }
    }

    for (final file in files.where((element) => !element.isUploadedMedia)) {
      final uploadFile = await repo.uploadFile(
        file.path,
        file.mediaType,
      );

      if (uploadFile != null) {
        attachments.add(uploadFile);
      }
    }

    ProjectFile? uploadedThumbnail;
    if (pickedThumbnail.value != null) {
      uploadedThumbnail = await repo.uploadFile(
        pickedThumbnail.value!.path,
        (pickedThumbnail.value!.mimeType ?? 'image/jpeg').toMediaType(),
      );
    }

    // Create Project
    await repo.createNew(
      title: title,
      description: description,
      isDraft: isDraft.value,
      members: selectedUsers.map((user) => user.id).toList(),
      courses: selectedCourses.map((course) => course.id).toList(),
      tags: selectedTags.map((tag) => tag.id).toList(),
      attachments: attachments.map((attachedFile) => attachedFile.id).toList(),
      links: links.toList(),
      thumbnail: uploadedThumbnail?.id,
    );

    AppRepo().hideLoading();

    if (isDraft.value) {
      loading.value = false;
      refreshContent();
    } else {
      final homeViewModel = Get.find<HomeController>();
      await homeViewModel.refreshContent();
    }

    loading.value = false;
    if (!saveAsDraftCondition) {
      Get.toNamed(AppRoutes().createNewProjectCompleted);
      clearInputs();
      manualDispose();
    } else {
      manualDispose();
      Get.back();
    }

    update();
  }

  Future<void> updateProject({bool isDraft = true}) async {
    loading.value = true;
    AppRepo().showLoading();
    update();

    for (final media in mediaFiles) {
      final uploadFile = await repo.uploadFile(
        media.path,
        media.mediaType,
      );

      if (uploadFile != null) {
        attachments.add(uploadFile);
      }
    }

    for (final file in files) {
      final uploadFile = await repo.uploadFile(
        file.path,
        file.mediaType,
      );

      if (uploadFile != null) {
        attachments.add(uploadFile);
      }
    }

    ProjectFile? uploadedThumbnail;
    if (pickedThumbnail.value != null) {
      uploadedThumbnail = await repo.uploadFile(
        pickedThumbnail.value!.path,
        (pickedThumbnail.value!.mimeType ?? 'image/jpeg').toMediaType(),
      );
    } else {
      uploadedThumbnail = updateProjectModel?.thumbnail;
    }

    // Update Project
    final result = await repo.edit(
      projectId: updateProjectModel!.id,
      title: title,
      description: description,
      isDraft: isDraft,
      members: (updateProjectModel?.owner?.id == AppRepo().user!.id)
          ? selectedUsers.map((user) => user.id).toList()
          : null,
      courses: selectedCourses.map((course) => course.id).toList(),
      tags: selectedTags.map((tag) => tag.id).toList(),
      attachments: attachments.map((attachedFile) => attachedFile.id).toList(),
      links: links.toList(),
      thumbnail: uploadedThumbnail?.id,
    );
    loading.value = false;

    if (!result) {
      AppRepo().hideLoading();
      return;
    }

    update();

    if (isDraft) {
      refreshContent();
    } else {
      if (routeFrom == 'my-projects') {
        final myProjectVM = Get.find<MyProjectsController>();
        myProjectVM.refreshContent();
      }

      final homeViewModel = Get.find<HomeController>();
      await homeViewModel.refreshContent();
      refreshContent();
    }

    AppRepo().hideLoading();

    Get.back();

    clearInputs();
    manualDispose();
  }

  Future<void> updateProjectAfterDeletingFiles() async {
    await repo.edit(
      projectId: updateProjectModel!.id,
      attachments: attachments.map((attachedFile) => attachedFile.id).toList(),
    );
    refreshContent();
  }

  void createNewProjectStep2() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
    currentStep.value = 2;
  }

  void createNewProjectStep3() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
    currentStep.value = 3;
  }

  void createNewProjectAsDraft() async {
    isDraft.value = true;
    await createNewProject(
      saveAsDraftCondition: true,
    );
  }

  void _resetPage() {
    _page = 1;
    _lastPage = false;
  }

  Future<void> refreshContent() async {
    if (routeFrom == 'my-projects') {
      final myProjectVM = Get.find<MyProjectsController>();
      myProjectVM.refreshContent();

      final homeViewModel = Get.find<HomeController>();
      await homeViewModel.refreshContent();
    } else {
      _resetPage();
      await _fetchAllDraftProjects();
    }
  }

  void clearInputs() {
    isDraft.value = false;
    titleCtrl.text = '';
    descriptionCtrl.text = '';
    selectedTags.clear();
    selectedCourses.clear();
    selectedUsers.clear();
    currentStep.value = 0;
  }

  void addTag(Tag value) {
    if (!(selectedTags.indexWhere((element) => element.id == value.id) > -1)) {
      selectedTags.add(value);
      loadingTags.toggle();
    }
  }

  void removeTag(Tag value) {
    selectedTags.removeWhere((tag) => tag.id == value.id);
    loadingTags.toggle();
  }

  Future<void> _fetchAllDraftProjects() async {
    if (loading.value || _lastPage) return;
    loading.value = true;

    try {
      final response = await repo.fetchAll(
        page: _page,
        isDraft: true,
        myProjects: true,
      );

      final draftProjects =
          response.where((project) => project.isDraft == true).toList();

      if (_page == 1) {
        _searchedProjects.clear();
      }

      if (draftProjects.isEmpty) {
        _lastPage = true;
      } else {
        _searchedProjects.addAll(draftProjects);
        _page++;
      }
    } catch (e) {
      // handle error
    } finally {
      loading.value = false;
    }

    update();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchAllDraftProjects();
    }
  }

  void routeToProject(Project project) {
    Get.toNamed(AppConfig().routes.createNewProjectScreen,
        arguments: project, parameters: {'route-from': 'add-project'});
  }

  void removeProject(String savedProjectId, String projectId) async {
    _addProjectToUpdatingList(projectId);
    update();

    await repo.unsavedProject(savedProjectId);

    _removeProjectFromUpdatingList(projectId);

    update();
  }

  void _addProjectToUpdatingList(String projectId) =>
      AppRepo().updatingProjectsList.add(projectId);

  void _removeProjectFromUpdatingList(String projectId) => AppRepo()
      .updatingProjectsList
      .removeWhere((element) => element == projectId);

  Future<void> pickGeneralFile() async {
    // TODO please check dupplicated files before adding to the list
    if (files.length >= 5) {
      Get.snackbar('File Picker', 'You have reached the maximum files!');
      return;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'ppt', 'pptx'],
    );

    if (result != null) {
      for (var file in result.files) {
        final fileExtension = file.extension?.toLowerCase() ?? 'unknown';

        // Check if the file size is below the limit (10 MB in this example)
        // and the file is a PDF, DOC, or PPT file
        if (['pdf', 'doc', 'ppt', 'pptx'].contains(fileExtension) &&
            file.size <= 10 * 1024 * 1024) {
          files.add(
            CustomXFile(
              uploadedId: '',
              name: file.name,
              path: file.path ?? '',
              mediaType: 'application/${file.extension}'.toMediaType(),
            ),
          );
        } else {
          Get.snackbar('File Picker',
              'The file ${file.name} is too large or not a supported format');
        }
      }
      update();
    } else {
      Get.snackbar('File Picker', 'No file was selected');
    }
  }

  Future<void> pickMediaFile() async {
    if (mediaFiles.length >= 5) {
      Get.snackbar('Media Picker', 'You have reached the maximum medias!');
      return;
    }

    final result = await FilePicker.platform.pickFiles(
      type: FileType.media,
      allowMultiple: true,
    );

    if (result != null) {
      if (result.files.length >= 5) {
        Get.snackbar('Media Picker', 'You have reached the maximum medias!');
        return;
      }

      for (var pickedFile in result.files) {
        final file = File(pickedFile.path!);
        final fileSize = await file.length();
        final fileExtension = path.extension(file.path).toLowerCase();

        // Check if the file is already in the mediaFiles list
        if (mediaFiles.any((mediaFile) => mediaFile.path == pickedFile.path)) {
          Get.snackbar(
              'Media Picker', 'The file ${pickedFile.name} is already added');
          continue;
        }

        // Check if the file size is below the limit (150 MB for videos and 100 MB for images in this example)

        if (['mp4', 'mov', 'avi', 'mkv'].contains(pickedFile.extension)) {
          mediaFiles.add(
            CustomXFile(
              uploadedId: '',
              name: pickedFile.name,
              path: pickedFile.path ?? '',
              mediaType: 'video/${pickedFile.extension}'.toMediaType(),
            ),
          );
          update();
        } else {
          if ((['.jpg', '.png', '.gif', '.jpeg', '.webp']
                      .contains(fileExtension) &&
                  fileSize <= 100 * 1024 * 1024) ||
              fileSize <= 150 * 1024 * 1024) {
            // Compress the image if it's a JPEG, PNG or WEBP file
            if (['.jpg', '.png', '.jpeg', '.webp'].contains(fileExtension)) {
              try {
                XFile compressedImage = await compressImage(XFile(file.path));

                mediaFiles.add(
                  CustomXFile(
                    uploadedId: '',
                    name: compressedImage.name,
                    path: compressedImage.path,
                    mediaType: 'image/${pickedFile.extension}'.toMediaType(),
                  ),
                );
                update();
              } catch (e) {
                Get.snackbar('Media Picker', e.toString());
              }
            } else {
       
              AppRepo().showSnackbar(
                label: 'Error',
                text: 'The file ${pickedFile.name} is not a supported format',
              );
            }
          } else {
            Get.snackbar(
                'Media Picker', 'The file ${pickedFile.name} is too large');
          }
        }
      }
    } else {
      Get.snackbar('Media Picker', 'No media file was selected');
    }
  }

  Future<void> pickThumbnail() async {
    XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      try {
        XFile compressedImage = await compressImage(pickedImage);

        pickedThumbnail.value = compressedImage;
      } catch (e) {
        AppRepo().showSnackbar(
          label: 'Error',
          text: e.toString(),
        );
      }
    }
  }

  initUpdateData() {
    titleCtrl.text = updateProjectModel?.title ?? '';
    descriptionCtrl.text = updateProjectModel?.description ?? '';

    _title = titleCtrl.text;
    _description = descriptionCtrl.text;

    isDraft.value = updateProjectModel?.isDraft ?? false;
    selectedTags.clear();
    selectedTags.addAll(updateProjectModel?.tags ?? []);
    selectedCourses.clear();
    selectedCourses.addAll(updateProjectModel?.courses ?? []);
    attachments.clear();
    attachments.addAll(updateProjectModel?.attachments ?? []);
    selectedUsers.clear();
    links.clear();
    links.addAll(updateProjectModel?.links ?? []);
    selectedUsers.addAll(updateProjectModel?.projectUsers.map(
          (e) => User(
            id: e.id,
            email: e.email,
            createdAt: DateTime.now(),
            firstname: e.firstName,
            surname: e.lastName,
            status: true,
            updatedAt: DateTime.now(),
          ),
        ) ??
        []);

    isDraft.refresh();
    update();
  }

  void manualDispose() {
    updateProjectModel = null;

    titleCtrl.text = '';
    descriptionCtrl.text = '';
    isDraft.value = false;
    selectedTags.clear();
    selectedCourses.clear();
    selectedUsers.clear();
    mediaFiles.clear();
    files.clear();
    attachments.clear();
    pickedThumbnail.value = null;
    links.clear();

    currentStep.value = 1;
    pageController.jumpToPage(0);

    isDraft.refresh();
  }

  void back() {
    if (currentStep.value == 3 || currentStep.value == 2) {
      currentStep.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
      return;
    }

    manualDispose();
    Get.back();
  }

  void onLinkDeleted(LinkModel model) {
    links.removeWhere((elem) => elem.link == model.link);
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }
}