import 'package:flutter/material.dart';
import 'card_image.dart';
import 'card_content.dart';
import 'centered_avater.dart';

class WorkspaceCard extends StatelessWidget {
  const WorkspaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;
        final avatarSize = cardWidth * 0.5;

        return Card(
          elevation: 2,
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: cardWidth * 0.8,
                child: Stack(
                  children: [
                    const CardImage(),
                    CenteredAvatar(avatarSize: avatarSize),
                  ],
                ),
              ),
              const CardContent(),
            ],
          ),
        );
      },
    );
  }
}
