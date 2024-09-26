import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  List<Widget> _actionWidgets(BuildContext context) {
    return [
      const Icon(Icons.favorite_border_rounded),
      const SizedBox(
        width: 4,
      ),
      const Icon(Icons.notifications_none_rounded),
      const SizedBox(
        width: 16,
      ),
    ];
  }

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Icon(Icons.person_2_rounded,
              color: Theme.of(context).colorScheme.onInverseSurface),
          const SizedBox(
            width: 8,
          ),
          const Text(
            'Hi, John',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      titleTextStyle:
          TextStyle(color: Theme.of(context).colorScheme.onInverseSurface),
      titleSpacing: 0,
      actions: _actionWidgets(context),
      actionsIconTheme:
          IconThemeData(color: Theme.of(context).colorScheme.onInverseSurface),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
