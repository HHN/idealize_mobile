import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Services/archive_service.dart';
import 'package:idealize_new_version/Core/Data/Services/project_service.dart';
import 'package:idealize_new_version/Features/home/domain/home_repository.dart';
import 'package:idealize_new_version/app_repo.dart';

import '../../../../Core/Data/Services/notification_service.dart';

class HomeRepositoryImpl extends HomeRepository {
  final projectService = ProjectService();
  final archiveService = ArchiveService();

  @override
  Future<String?> archive({required String projectId}) async =>
      await archiveService.archiveProject(projectId, AppRepo().user!.id);

  @override
  Future<bool> unarchive({required String archiveId}) async =>
      await archiveService.unarchiveProject(archiveId);

  @override
  Future<List<Project>> fetchAll({
    String? searchInput,
    String selectedSegment = 'all-projects',
    int page = 1,
  }) async {
    return await projectService.fetchAllProject(
        search: searchInput,
        page: page,
        sortField: 'creationDate',
        filter: selectedSegment,
        );
  }

  @override
  Future<int> unreadNotifications() async {
    return await NotificationService().getCountOfUnreadNotifications();
  }
}
