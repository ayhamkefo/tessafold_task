// custom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/assets_data.dart';
import '../utils/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final int cartItemCount;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.cartItemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.bottomNavBarColor,
      ),
      child: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        backgroundColor: Colors.transparent,
        destinations: [
          _buildNavItem(
            NavBarItem(
              selectedIcon: SvgPicture.asset(AssetsData.berifcase),
              unselectedIcon: SvgPicture.asset(AssetsData.berifcase),
              label: 'خدمات الأعمال',
            ),
          ),
          _buildNavItem(
            NavBarItem(
              selectedIcon: SvgPicture.asset(AssetsData.coworking),
              unselectedIcon: SvgPicture.asset(AssetsData.coworking),
              label: 'المساحات المكتبية',
            ),
          ),
          _buildNavItem(
            NavBarItem(
              selectedIcon: SvgPicture.asset(AssetsData.home),
              unselectedIcon: SvgPicture.asset(AssetsData.home),
              label: 'الرئيسية',
            ),
          ),
        ],
      ),
    );
  }

  NavigationDestination _buildNavItem(NavBarItem item) {
    return NavigationDestination(
      icon: _NavItemContent(icon: item.unselectedIcon, label: item.label),
      selectedIcon: _NavItemContent(
        icon: item.selectedIcon,
        label: item.label,
        isSelected: true,
      ),
      label: '',
    );
  }
}

class _NavItemContent extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isSelected;

  const _NavItemContent({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: icon,
          ),
          const SizedBox(height: 4),
          Text(label,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 8,
                  color:
                      isSelected ? Colors.white : Colors.white.withOpacity(0.7),
                  overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}

class NavBarItem {
  final Widget selectedIcon;
  final Widget unselectedIcon;
  final String label;

  const NavBarItem({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
  });
}
