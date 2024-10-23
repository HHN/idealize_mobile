import 'package:idealize_new_version/Core/Data/Models/project_model.dart';

import '../../../Core/Data/Models/project_comment_model.dart';

abstract class ProjectDetailsRepository {
  Future<Project> projectDetails(String projectId);
  Future<bool> like(String projectId, String userId);
  Future<bool> unlike(String likeId);
  Future<List<ProjectComment>> comments(
    String projectId, {
    int page = 1,
  });
  Future<bool> leaveComment(
    String projectId,
    String userId, {
    required String content,
    String? parentCommentId,
  });
  Future<String?> archive(String projectId, String userId);
  Future<bool> unarchive(String archiveId);
  Future<dynamic> join(String projectId, String userId);
  Future<dynamic> report(
    String projectId,
    String userId, {
    String type = 'project', // 'project' | 'comment' | 'user'
    String content = '',
  });
}