import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/image_loader_widget.dart';
import 'package:idealize_new_version/Core/Components/loading_widget.dart';
import 'package:idealize_new_version/Core/Components/tabbar_widget.dart';
import 'package:idealize_new_version/Core/Constants/colors.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/custom_x_file_model.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';
import 'package:idealize_new_version/Core/Utils/file_utils.dart';
import 'package:idealize_new_version/Features/project_details/presentation/widgets/comment_container_widget.dart';
import 'package:idealize_new_version/Features/project_details/presentation/widgets/project_details_info_widget.dart';
import 'package:idealize_new_version/Features/project_details/presentation/widgets/project_material_widget.dart';
import 'package:idealize_new_version/Features/project_details/presentation/widgets/tags_container_widget.dart';

import 'package:idealize_new_version/app_repo.dart';
import 'package:idealize_new_version/gen/assets.gen.dart';

import 'controller/project_details_controller.dart';

class ProjectDetailsScreen extends GetView<ProjectDetailsController> {
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors().backGroundColor,
      appBar: AppBar(
        title: Text(AppStrings.projectDetails.tr),
        actions: [
          Obx(() => IconButton(
                iconSize: 28,
                padding: const EdgeInsets.only(right: 10),
                icon: Icon(
                  controller.isArchived.value
                      ? Icons.bookmark
                      : Icons.bookmark_add_outlined,
                  color: AppColors().purpleColor,
                ),
                onPressed: () async {
                  await controller
                      .toggleArchive((controller.project?.id ?? ''));
                },
              ))
        ],
      ),
      body: FutureBuilder<Project>(
        future: controller.getProject(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomLoadingIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: controller.scrollController,
              child: Column(
                children: [
                  if (controller.project?.thumbnail?.id != null)
                    AppImageLoader(
                      imageId: controller.project?.thumbnail?.id ?? '',
                      decoration:
                          const BoxDecoration(shape: BoxShape.rectangle),
                      placeholder: ColoredBox(
                        color: AppColors().secondaryColor,
                        child: SizedBox(
                            width: double.infinity,
                            height: Get.height * 0.18,
                            child: Image.asset(
                              Assets.png.logoWhite.path,
                            )),
                      ),
                    ),
                  if (controller.project?.thumbnail?.id == null)
                    ColoredBox(
                      color: AppColors().secondaryColor,
                      child: SizedBox(
                          width: double.infinity,
                          height: Get.height * 0.18,
                          child: Image.asset(
                            Assets.png.logoWhite.path,
                          )),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.fromBorderSide(BorderSide(
                        color: AppColors().lightGrayColor,
                        width: 0.1,
                      )),
                    ),
                    width: double.infinity,
                    child: Text(
                      (controller.project?.title ?? '').toString(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors().txtColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ).paddingAll(AppConfig().dimens.medium),
                  ),
                  Obx(
                    () => CustomTabBar(
                      selectedIndex: controller.tabIndex.value,
                      onTabSelected: (index) =>
                          controller.changeTabIndex(index),
                      tabs: [
                        AppStrings.aboutProject.tr,
                        AppStrings.projectMaterials.tr,
                      ],
                    ),
                  ),
                  Obx(
                    () => IndexedStack(
                      index: controller.tabIndex.value,
                      children: [
                        Column(
                          children: [
                            Obx(
                              () => ProjectDetailsInfoWidget(
                                onReportProjectTapped: (reason) {
                                  controller.reportProject(reason);
                                },
                                onTappedComment: controller.scrollToComments,
                                ownerName:
                                    controller.project?.owner?.firstname ??
                                        'N/A',
                                ownerId: controller.project?.owner?.id ?? '',
                                comments: controller.comments.length,
                                likes: ((controller.project?.likes ?? 0) +
                                    controller.isLikedValue.value),
                                isLiked: controller.isLiked.value,
                                members: controller.project?.projectUsers ?? [],
                                onTappedLike: () {
                                  controller.toggleLike(
                                      AppRepo().user!.id.toString());
                                },
                                onTapJoinProject: () =>
                                    controller.joinProject(),
                              ),
                            ),
                            Gap(AppConfig().dimens.medium),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.fromBorderSide(BorderSide(
                                  color: AppColors().lightGrayColor,
                                  width: 0.1,
                                )),
                              ),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.desciption.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: AppColors().txtColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Gap(AppConfig().dimens.medium),
                                  Text(
                                    (controller.project?.description ?? '')
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors().txtColor,
                                        ),
                                  ),
                                ],
                              ).paddingAll(AppConfig().dimens.medium),
                            ),
                            Gap(AppConfig().dimens.medium),
                            TagsContainerWidget(
                              tags: controller.project?.tags
                                      .map((tag) => tag.tagName)
                                      .toList() ??
                                  [],
                            ),
                            Gap(AppConfig().dimens.medium),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.fromBorderSide(BorderSide(
                                    color: AppColors().lightGrayColor,
                                    width: 0.1,
                                  )),
                                ),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.comments.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: AppColors().txtColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ).paddingOnly(
                                        left: AppConfig().dimens.medium,
                                        right: AppConfig().dimens.medium,
                                        top: AppConfig().dimens.medium),
                                    Gap(AppConfig().dimens.small),
                                    controller.comments.isEmpty
                                        ? Center(
                                            child: Padding(
                                            padding: EdgeInsets.only(
                                              left: AppConfig().dimens.large,
                                              right: AppConfig().dimens.large,
                                              top: AppConfig().dimens.small,
                                              bottom: AppConfig().dimens.large,
                                            ),
                                            child: Text(
                                                textAlign: TextAlign.center,
                                                AppStrings.noComments.tr,
                                                style: TextStyle(
                                                  color: AppColors().txtColor,
                                                )),
                                          ))
                                        : Column(
                                            children: controller
                                                .comments.reversed
                                                .map(
                                                  (e) => CommentContainerWidget(
                                                    comment: e,
                                                    isReply: false,
                                                    onTappedReply: () =>
                                                        controller.reply(e.id),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                  ],
                                )),
                            if (controller.replyCommentId.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        'Reply To ${controller.getNameBasedOnReplyId(controller.replyCommentId.value)}'),
                                    IconButton(
                                        onPressed: controller.removeReply,
                                        icon: const Icon(Icons.close)),
                                  ],
                                ),
                              ),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                focusNode: controller.myFocusNode,
                                controller: controller.commentCtrl,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                      color: AppColors().lightGrayColor,
                                      width: 0.1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                      color: AppColors().primaryColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  hintText: "Write a comment",
                                  contentPadding: EdgeInsets.only(
                                    left: AppConfig().dimens.medium,
                                    right: AppConfig().dimens.medium,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      size: 20,
                                      Iconsax.send1,
                                      color: controller.isCommentEmpty.value
                                          ? Colors.grey
                                          : AppColors().secondaryColor,
                                    ),
                                    onPressed: controller.isCommentEmpty.value
                                        ? null
                                        : () => controller.comment(),
                                  ),
                                ),
                              ),
                            ).paddingOnly(
                              left: AppConfig().dimens.medium,
                              right: AppConfig().dimens.medium,
                              bottom: AppConfig().dimens.large,
                              top: AppConfig().dimens.medium,
                            ),
                          ],
                        ),
                        ProjectMaterialWidget(
                          documentFiles: documentFiles,
                          mediaFiles: mediaFiles,
                          downloadFile: controller.downloadProjectFile,
                          projectLinks: controller.project?.links,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  List<CustomXFile> get documentFiles =>
      controller.project?.attachments
          .where((attachment) => !FileUtils.isMediaFile(attachment.mimeType))
          .map(
            (e) => CustomXFile(
              name: e.filename,
              path: e.path,
              mediaType: e.mimeType.toMediaType(),
              uploadedId: e.id,
            ),
          )
          .toList() ??
      [];

  List<CustomXFile> get mediaFiles =>
      controller.project?.attachments
          .where((attachment) => FileUtils.isMediaFile(attachment.mimeType))
          .map(
            (e) => CustomXFile(
              name: e.filename,
              path: e.path,
              mediaType: e.mimeType.toMediaType(),
              uploadedId: e.id,
            ),
          )
          .toList() ??
      [];
}