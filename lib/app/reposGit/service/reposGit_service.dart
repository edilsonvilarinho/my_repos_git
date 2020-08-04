import 'package:http/http.dart' as http;
import 'package:my_repos_git/app/reposGit/model/api_response_model.dart';

class ReposGitService {
  Future<ApiResponse> resposGit(String user) async {
    http.Response response =
        await http.get("https://api.github.com/users/$user/repos");
    try {
      if (response.statusCode == 200) {
        return ApiResponse<http.Response>.ok(response);
      } else {
        return ApiResponse<http.Response>.error(response.body);
      }
    } catch (e) {
      throw e;
    }
  }
}
