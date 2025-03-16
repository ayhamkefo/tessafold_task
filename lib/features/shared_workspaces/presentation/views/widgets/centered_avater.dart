import 'package:flutter/material.dart';
import 'package:tessafold_task/core/utils/assets_data.dart';

class CenteredAvatar extends StatelessWidget {
  final double avatarSize;

  const CenteredAvatar({super.key, required this.avatarSize});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 40,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: CircleAvatar(
            radius: avatarSize / 2,
            backgroundColor: Colors.white.withOpacity(0.5),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffE9EBEB),
              ),
              child: CircleAvatar(
                radius: avatarSize / 2.2,
                backgroundColor: const Color(0xffE9EBEB),
                child: Image.asset(
                  AssetsData.sharedWorkespaceCardImageCenter,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
