import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/utils/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/bottom_nav_icon_list.dart';

class BottomNavBarView extends StatefulWidget {
  static String id ="BottomNavBarView";
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  var navPages = [
    const Scaffold(
      body: Center(child: Text("Amr"),),
    ),
     Scaffold(
       body: Center(child: Text("Mohamed"),),
     ),
    // const HomeScreen(),
    // const DoctorsScreen(),
    // const VaccineTimesScreen(),
    // const AccountScreen(),
  ];

  int localIndex = 0;
  PageController? controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView.builder(
          reverse: true,
          itemCount: navPages.length,
          controller: controller,
          onPageChanged: (val) {
            setState(() {
              localIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return navPages[index];
          },
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 0.01.h),
          decoration: const BoxDecoration(
            color: AppColors.skyBlueColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent, // Remove ripple effect
              highlightColor: Colors.transparent, // Remove highlight effect
            ),
            child: BottomNavigationBar(
              currentIndex: localIndex,
              onTap: (index) {
                setState(() {
                  localIndex = index;
                  controller!.jumpToPage(index);
                });
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.mediumGrayColor.withOpacity(0.7),
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: AppFontFamily.cairoFontFamily,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontFamily: AppFontFamily.cairoFontFamily,
              ),
              enableFeedback: false,
              items: List.generate(
                navPages.length,
                    (index) => BottomNavigationBarItem(
                  icon: AnimatedBuilder(
                    animation: Listenable.merge([controller!]),
                    builder: (context, _) {
                      // Check if the current item is selected
                      final isActive = localIndex == index;

                      return Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 300),
                            top: isActive ? -40 : 0, // Active item moves upward
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              width: isActive
                                  ? 50
                                  : 0, // Circle appears only for active item
                              height: isActive ? 50 : 0,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.darkBlueAccent
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            transform: Matrix4.translationValues(
                              0,
                              isActive
                                  ? -25
                                  : 0, // Icon moves upward when active
                              0,
                            ),
                            child: isActive
                                ? bottomNavIconsList[index].iconSelected
                                : bottomNavIconsList[index].iconUnSelected,
                          ),
                        ],
                      );
                    },
                  ),
                  label: bottomNavIconsList[index].label,
                ),
              ),
            ),
          )),
    );
  }
}
