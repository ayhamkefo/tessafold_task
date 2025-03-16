import 'package:flutter/material.dart';
import 'package:tessafold_task/core/utils/assets_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomSharedWorkSpacesAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;

  const CustomSharedWorkSpacesAppBar({super.key, required this.height});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: AppColors.bottomNavBarColor,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth * 0.12,
                  height: screenWidth * 0.12,
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundContainerIconColor,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: TextButton(
                    child: SvgPicture.asset(
                      AssetsData.notification,
                      width: screenWidth * 0.06,
                      height: screenWidth * 0.06,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.05,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsData.logoNoBg,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "البحث عن مساحة عمل مشتركة",
              style: Styles.textStyle13.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textappbarColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Container(
              height: screenHeight * 0.065,
              decoration: BoxDecoration(
                color: AppColors.backgroundContainerIconColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style: Styles.textStyle13
                    .copyWith(color: AppColors.textappbarColor),
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      AssetsData.search,
                      width: screenWidth * 0.06,
                      height: screenWidth * 0.06,
                    ),
                  ),
                  hintText: 'اكتب اسم موقع او مدينة او منطقة',
                  hintStyle: Styles.textStyle13
                      .copyWith(color: AppColors.textappbarColor),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.04,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
