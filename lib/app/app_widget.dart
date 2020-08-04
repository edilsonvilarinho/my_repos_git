import 'package:flutter/material.dart';
import 'package:my_repos_git/app/reposGit/controller/reposGit_controller.dart';
import 'package:my_repos_git/app/reposGit/service/reposGit_service.dart';
import 'package:my_repos_git/app/reposGit/view/reposGit_view.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReposGitController>.value(
            value: ReposGitController(ReposGitService()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: ReposGitView(),
      ),
    );
  }
}
