import 'package:assignment_five_flutter/components/floating_action_button.dart';
import 'package:assignment_five_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/app_bar.dart';
import '../tabs/list_tab.dart';
import '../tabs/settings_tab.dart';
import '../utils/assets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
    ));
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarGuide(),
      ),
      bottomNavigationBar: buildBottomNavBar(),
      body: currentSelectedTabIndex == 0 ? const ListTab() : const SettingsTab(),
      floatingActionButton: const FloatingActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildBottomNavBar() => BottomAppBar(
    notchMargin: 6,
    shape: const CircularNotchedRectangle(),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: BottomNavigationBar(
      currentIndex: currentSelectedTabIndex,
      onTap: (index){
        currentSelectedTabIndex = index;
        setState(() {

        });
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
