import 'package:assignment_five_flutter/components/bottom_sheet.dart';
import 'package:assignment_five_flutter/utils/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingActionBtn extends StatelessWidget {
  static late SettingsProvider provider;
  const FloatingActionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
            builder: (_) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: const AddBottomSheet()));
      },
      child: const Icon(CupertinoIcons.plus),
    );
  }
}
