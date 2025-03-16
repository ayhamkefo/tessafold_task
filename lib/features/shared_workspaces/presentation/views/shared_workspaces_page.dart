import 'package:flutter/material.dart';
import 'package:tessafold_task/core/widgets/custom_bottom_nav_bar.dart';
import 'widgets/workspace_card.dart';
import 'widgets/custom_shared_workspaces_app_bar.dart';

class SharedWorkspacesPage extends StatelessWidget {
  const SharedWorkspacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSharedWorkSpacesAppBar(
        height: MediaQuery.of(context).size.height * 0.32,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: _calculateAspectRatio(constraints.maxWidth),
            ),
            itemCount: 5,
            itemBuilder: (context, index) => const WorkspaceCard(),
          );
        },
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomNavBar(
        cartItemCount: 3,
        onDestinationSelected: (val) => {},
        selectedIndex: 1,
      ),
    );
  }

  double _calculateAspectRatio(double screenWidth) {
    const baseWidth = 400;
    final ratio = screenWidth / baseWidth;
    return ratio.clamp(0.65, 0.75);
  }
}
