import 'package:flutter/material.dart';
import 'package:my_repos_git/app/reposGit/controller/reposGit_controller.dart';
import 'package:provider/provider.dart';

class ReposGitView extends StatefulWidget {
  @override
  _ReposGitViewState createState() => _ReposGitViewState();
}

class _ReposGitViewState extends State<ReposGitView> {
  TextEditingController textEditController = TextEditingController();

  showResult(ReposGitController controller) {
    if (controller.errorModel != null) {
      return Container(
        color: Colors.red,
        child: Center(
          child: Text(controller.errorModel.message),
        ),
      );
    } else {
      if (controller.repos.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
            itemCount: controller.repos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.repos[index].fullName),
              );
            },
          ),
        );
      } else {
        return Container();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Your Repositories GitHub"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: Consumer<ReposGitController>(
          builder: (context, controller, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Your user"),
                  controller: textEditController,
                ),
                RaisedButton(
                  onPressed: () {
                    controller.resposGit(textEditController.text);
                  },
                  child: Text("Confirm"),
                ),
                showResult(controller)
              ],
            );
          },
        ),
      ),
    );
  }
}
