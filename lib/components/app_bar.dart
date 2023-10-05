import 'package:flutter/material.dart';

class AppBarGuide extends StatelessWidget {

  const AppBarGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("To Do List"),
      toolbarHeight: MediaQuery.of(context).size.height * 10,
      elevation: 0,
    );
  }
}
