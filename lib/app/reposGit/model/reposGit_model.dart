import 'package:my_repos_git/app/reposGit/model/owner_model.dart';

class ReposGitModel {
  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  String htmlUrl;
  OwnerModel owner;

  ReposGitModel(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.private,
      this.htmlUrl,
      this.owner});

  ReposGitModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    htmlUrl = json['html_url'];
    owner =
        json['owner'] != null ? new OwnerModel.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['private'] = this.private;
    data['html_url'] = this.htmlUrl;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    return data;
  }
}
