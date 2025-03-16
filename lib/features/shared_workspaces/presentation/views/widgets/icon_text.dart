import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tessafold_task/core/utils/colors.dart';
import 'package:tessafold_task/core/utils/styles.dart';

class IconText extends StatelessWidget {
  final SvgPicture icon;
  final String text;

  const IconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          text,
          style: Styles.textStyle13.copyWith(color: AppColors.grayTextColor),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
