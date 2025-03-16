import 'package:flutter/material.dart';
import 'package:tessafold_task/core/utils/assets_data.dart';

class CardImage extends StatelessWidget {
  const CardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AssetsData.sharedWorkespaceCardImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
