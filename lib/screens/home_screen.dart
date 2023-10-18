import 'package:assignment_five_flutter/components/floating_action_button.dart';
import 'package:assignment_five_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../components/app_bar.dart';
import '../tabs/list_tab.dart';
import '../tabs/settings_tab.dart';
import '../utils/assets.dart';
import '../utils/settings_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "homeScreen";
  static late SettingsProvider provider;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.transparent,
    ));
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarGuide(),
      ),
      bottomNavigationBar: buildBottomNavBar(),
      body: provider.currentSelectedTabIndex == 0 ? ListTab() : const SettingsTab(),
      floatingActionButton: const FloatingActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildBottomNavBar() => BottomAppBar(
    notchMargin: 6,
    shape: const CircularNotchedRectangle(),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: BottomNavigationBar(
      currentIndex: provider.currentSelectedTabIndex,
      onTap: (index){
        provider.currentSelectedTabIndexChanger(index);

      },
      items: const [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.iconList)), label: ""),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.iconSettings)), label: ""),
      ],
    ),
  );
}
