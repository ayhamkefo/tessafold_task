import 'package:flutter/material.dart';
import 'package:tessafold_task/core/utils/colors.dart';
import 'package:tessafold_task/core/utils/styles.dart';
import 'location_row.dart';

class CardContent extends StatelessWidget {
  const CardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('شارك هب',
              style: Styles.textStyle16.copyWith(
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const LocationRow(),
        ],
      ),
    );
  }
}
