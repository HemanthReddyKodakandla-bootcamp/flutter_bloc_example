import 'package:flutter/material.dart';
import 'package:flutter_week5_bloc_app/ui/user_list_widget.dart';

void main() => runApp(UserListScreen());

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: UserListWidget(),
      ),
    );
  }
}
