import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color backgroundColor;
  final double borderRadius;
  final double verticalMargin;
  final double horizontalMargin;
  final double itemWidth;
  final double selectedFontSize;
  final double unselectedFontSize;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    this.selectedItemColor = Colors.orange,
    this.unselectedItemColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.borderRadius = 7.0,
    this.verticalMargin = 10.0,
    this.horizontalMargin = 20.0,
    this.itemWidth = 22.0, // Smaller icon width
    this.selectedFontSize = 10.0, // Smaller text size
    this.unselectedFontSize = 10.0, // Smaller text size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin, horizontal: horizontalMargin),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(width: 1,color: Colors.grey.shade300),
        gradient: LinearGradient(
            begin: Alignment.topCenter,end: Alignment.bottomCenter,
            colors: [Colors.grey.shade300,Colors.white])
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: onTap,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unselectedItemColor,
          selectedFontSize: selectedFontSize,
          unselectedFontSize: unselectedFontSize,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/compass.svg",
                width: itemWidth,
                height: 22, // Smaller height
                colorFilter: ColorFilter.mode(
                  currentIndex == 0 ? selectedItemColor : unselectedItemColor,
                  BlendMode.srcIn,
                ),
              ),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/store.svg",
                width: itemWidth,
                height: 22, // Smaller height
                colorFilter: ColorFilter.mode(
                  currentIndex == 1 ? selectedItemColor : unselectedItemColor,
                  BlendMode.srcIn,
                ),
              ),
              label: "Restaurants",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                width: itemWidth,
                height: 22, // Smaller height
                colorFilter: ColorFilter.mode(
                  currentIndex == 2 ? selectedItemColor : unselectedItemColor,
                  BlendMode.srcIn,
                ),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/heart.svg",
                width: itemWidth,
                height: 22, // Smaller height
                colorFilter: ColorFilter.mode(
                  currentIndex == 3 ? selectedItemColor : unselectedItemColor,
                  BlendMode.srcIn,
                ),
              ),
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/user2.svg",
                width: itemWidth,
                height: 22, // Smaller height
                colorFilter: ColorFilter.mode(
                  currentIndex == 4 ? selectedItemColor : unselectedItemColor,
                  BlendMode.srcIn,
                ),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
