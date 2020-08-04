import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_repos_git/app/reposGit/controller/reposGit_controller.dart';
import 'package:my_repos_git/app/reposGit/model/api_response_model.dart';
import 'package:my_repos_git/app/reposGit/service/reposGit_service.dart';

void main() {
  test('Test my ReposGitService get repositories', () async {
    ReposGitService gitService = ReposGitService();
    ApiResponse response = await gitService.resposGit("edilsonvilarinho");
    expect(response.result.body, isNotNull);
  });

  test('Test my ReposGitService get repositories Not found', () async {
    ReposGitService gitService = ReposGitService();
    ApiResponse response = await gitService.resposGit("asdasdadadsa");
    Map<String, dynamic> map = json.decode(response.message);
    expect(map["message"], "Not Found");
  });

  test('Test my ReposGitController get resposGit', () async {
    ReposGitController gitController = ReposGitController(ReposGitService());
    await gitController.resposGit("edilsonvilarinho");
    expect(gitController.repos, isNotEmpty);
  });

  test('Test my ReposGitController get resposGit Not found', () async {
    ReposGitController gitController = ReposGitController(ReposGitService());
    await gitController.resposGit("edilsonvilarnho");
    expect(gitController.errorModel.message, "Not Found");
  });
}
