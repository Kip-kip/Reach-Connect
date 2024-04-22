import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/components/appbar/app_bar_title_widget.dart';
import '../../../shared/constants/constants.dart';
import '../controllers/home_controller.dart';
import '../widgets/drawer_page.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  HomeController appController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    GetDelegate? mainDelegate;
    String? currentLocation;
    final size = MediaQuery
        .of(context)
        .size;

    return Stack(
      children: <Widget>[
        DrawerPage(
          onTap: () {
            setState(
                  () {
                xOffset = 0;
                yOffset = 0;
                scaleFactor = 1;
                isDrawerOpen = false;
              },
            );
          },
        ),
        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor)
            ..rotateY(isDrawerOpen ? -0.5 : 0),
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: isDrawerOpen
                    ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: kColorPrimary,
                  ),
                  onPressed: () {
                    setState(
                          () {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      },
                    );
                  },
                )
                    : IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: kColorPrimary,
                  ),
                  onPressed: () {
                    setState(() {
                      xOffset = size.width - size.width / 3;
                      yOffset = size.height * 0.1;
                      scaleFactor = 0.8;
                      isDrawerOpen = true;
                    });
                  },
                ),
                title: AppBarTitleWidget(
                  size: 15,
                ),
                centerTitle: true,
                elevation: 2.0,
                actions: <Widget>[
                  appController.selectedIndex.value == 2
                      ? IconButton(
                    iconSize: 25.0,
                    color: kColorPrimary,
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                    ),
                  )
                      : IconButton(
                    onPressed: () {
                      Get.rootDelegate.toNamed(Routes.NOTIFICATION);
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      color: kColorPrimary,
                    ),
                  ),
                ],
              ),
              body: GetRouterOutlet.builder(
                builder: (context, delegate, currentRoute) {
                  currentLocation = currentRoute?.location;

                  final title = currentRoute?.location;
                  if (appController.selectedIndex.value == 0) {
                    if (title == Routes.DASHBOARD) {
                      appController.selectedIndex.value = 0;
                    } else if (title == Routes.PROFILE) {
                      appController.selectedIndex.value = 1;
                    } else if (title == Routes.CHAT_DIALOGS) {
                      appController.selectedIndex.value = 3;
                    } else if (title == Routes.CHATROOM) {
                      appController.selectedIndex.value = 4;
                    }
                  }
                  return Scaffold(
                    body: GetRouterOutlet(
                      initialRoute: Routes.DASHBOARD,
                      key: Get.nestedKey(Routes.HOME),
                    ),
                  );
                },
              ),
              bottomNavigationBar: Obx(() {
                return BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.black,
                  currentIndex: appController.selectedIndex.value,
                  onTap: (value) {
                    appController.selectedIndex.value = value;
                    switch (value) {
                      case 0:
                        Get.rootDelegate.toNamed(Routes.HOME);
                        break;
                      case 1:
                        Get.rootDelegate.toNamed(Routes.PROFILE);
                        break;
                      case 3:
                        Get.rootDelegate.toNamed(Routes.CHAT_DIALOGS);
                        break;

                      case 4:
                        Get.rootDelegate.toNamed(Routes.CHATROOM);
                        break;
                      default:
                    }
                    appController.selectedIndex.value = value;
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(EvaIcons.homeOutline),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(EvaIcons.calendarOutline),
                      label: 'Schedule',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        EvaIcons.plusCircleOutline,
                        color: Colors.white,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(EvaIcons.messageSquareOutline),
                      label: 'Messages',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(EvaIcons.globe2Outline),
                      label: 'Settings',
                    ),
                  ],
                );
              }),
              floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Container(
                width: 80,
                height: 80,
                margin: EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x202e83f8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Get.rootDelegate.toNamed(Routes.HEALTHCARE_CONCERN);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kColorGreen,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
