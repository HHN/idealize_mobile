import 'package:idealize_new_version/Core/Data/Models/project_comment_model.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Services/archive_service.dart';
import 'package:idealize_new_version/Core/Data/Services/comment_service.dart';
import 'package:idealize_new_version/Core/Data/Services/join_project.dart';
import 'package:idealize_new_version/Core/Data/Services/like_service.dart';
import 'package:idealize_new_version/Core/Data/Services/project_service.dart';
import 'package:idealize_new_version/Core/Data/Services/report_service.dart';

import '../../domain/project_details_repo.dart';

class ProjectDetailsRepositoryImpl implements ProjectDetailsRepository {
  @override
  Future<Project> projectDetails(String projectId) async {
    return await ProjectService().getProjectDetails(projectId);
  }

  @override
  Future<String?> archive(
    String projectId,
    String userId,
    String projectOwnerId
  ) async {
    return await ArchiveService().archiveProject(projectId, userId, projectOwnerId);
  }

  @override
  Future<bool> leaveComment(
    String projectId,
    String userId, {
    required String content,
    required String projectOwnerId,
    String? parentCommentId,
  }) async {
    return await CommentService().comment(
      projectId,
      userId,
      content: content,
      parentCommentId: parentCommentId,
      projectOwnerId: projectOwnerId,
    );
  }

  @override
  Future<List<ProjectComment>> comments(
    String projectId, {
    int page = 1,
  }) async {
    return await CommentService().fetchAllCommnets(projectId, page: page);
  }

  @override
  Future<dynamic> join(
    String projectId,
    String userId, {
    String? message,
  }) async {
    return await JoinProjectService().joinProject(projectId, userId, message);
  }

  @override
  Future<bool> like(
    String projectId,
    String ownerId,
    String userId,
  ) async {
    return await LikeService().likeProject(projectId, userId, ownerId);
  }

  @override
  Future<bool> unarchive(String archiveId) async {
    return await ArchiveService().unarchiveProject(archiveId);
  }

  @override
  Future<bool> unlike(String likeId) async {
    return await LikeService().unlikeProject(likeId);
  }

  @override
  Future<dynamic> report(
    String projectId,
    String reportedUserId, {
    String type = 'project', // 'project' | 'comment' | 'user'
    String content = '',
  }) async {
    return await ReportService().report(
      projectId,
      reportedUserId,
      content: content,
      type: type,
    );
  }

  @override
  Future<void> deleteComment(String commentId) async {
    await CommentService().deleteComment(commentId);
  }

  @override
  Future<List<ProjectLikes>> likes(String projectId, {int page = 1}) async {
    final result = await LikeService().likes(projectId);

    return [
      for (final item in result['likes']) ProjectLikes.fromJson(item),
    ];
  }
}
