import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/utils/font_family.dart';
import 'package:elevatetask/core/utils/font_size_responsize.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/view/home_view.dart';
import '../../data/bottom_nav_icon_list.dart';

class BottomNavBarView extends StatefulWidget {
  static String id = "BottomNavBarView";
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  final List<Widget> navPages = [
    const HomeView(),
    const Scaffold(body: Center(child: Text("Mohamed"))),
    // Add more pages here
  ];

  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView.builder(
          reverse: true,
          itemCount: navPages.length,
          controller: pageController,
          onPageChanged: onPageChanged,
          itemBuilder: (context, index) => navPages[index],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
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
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.mediumGrayColor.withOpacity(0.7),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveFontSize(context: context, fontSize: 16),
            fontFamily: AppFontFamily.cairoFontFamily,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: getResponsiveFontSize(context: context, fontSize: 14),
            fontFamily: AppFontFamily.cairoFontFamily,
          ),
          enableFeedback: false,
          items: List.generate(
            navPages.length,
            (index) => BottomNavigationBarItem(
              icon: _buildAnimatedIcon(index),
              label: bottomNavIconsList[index].label,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon(int index) {
    final isActive = currentIndex == index;

    return AnimatedBuilder(
      animation: Listenable.merge([pageController]),
      builder: (context, _) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: isActive ? -40 : 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: isActive ? 50 : 0,
                height: isActive ? 50 : 0,
                decoration: BoxDecoration(
                  color:
                      isActive ? AppColors.darkBlueAccent : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.translationValues(
                0,
                isActive ? -25 : 0,
                0,
              ),
              child: isActive
                  ? bottomNavIconsList[index].iconSelected
                  : bottomNavIconsList[index].iconUnSelected,
            ),
          ],
        );
      },
    );
  }
}
