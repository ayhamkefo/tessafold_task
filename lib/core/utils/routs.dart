import 'package:go_router/go_router.dart';
import 'package:tessafold_task/features/shared_workspaces/presentation/views/shared_workspaces_page.dart';

abstract class Routers {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SharedWorkspacesPage(),
      ),
    ],
  );
}
