import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_repos_git/app/reposGit/model/api_response_model.dart';
import 'package:my_repos_git/app/reposGit/model/error_model.dart';
import 'package:my_repos_git/app/reposGit/model/reposGit_model.dart';
import 'package:my_repos_git/app/reposGit/service/reposGit_service.dart';

class ReposGitController extends ChangeNotifier {
  List<ReposGitModel> repos = List();
  ErrorModel errorModel = null;
  final ReposGitService _reposGitService;
  ReposGitController(this._reposGitService);

  resposGit(String user) async {
    try {
      ApiResponse apiResponse = await _reposGitService.resposGit(user);
      if (apiResponse.ok) {
        List<dynamic> mapRepos = json.decode(apiResponse.result.body);
        repos = mapRepos.map((item) => ReposGitModel.fromJson(item)).toList();
        errorModel = null;
      } else {
        Map<String, dynamic> mapRepos = json.decode(apiResponse.message);
        errorModel = ErrorModel.fromJson(mapRepos);
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }
}
