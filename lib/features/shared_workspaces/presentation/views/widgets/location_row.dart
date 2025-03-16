import 'package:flutter/material.dart';
import 'package:tessafold_task/core/utils/assets_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'icon_text.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final iconSize = constraints.maxWidth * 0.1;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconText(
              icon: SvgPicture.asset(AssetsData.gps,
                  width: iconSize, height: iconSize),
              text: "2.16 km",
            ),
            IconText(
              icon: SvgPicture.asset(AssetsData.location,
                  width: iconSize, height: iconSize),
              text: "جدة",
            ),
          ],
        );
      },
    );
  }
}
