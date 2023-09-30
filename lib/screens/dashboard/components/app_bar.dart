import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onSearch;
  final VoidCallback? onNotifications;

  CustomAppBar({
    required this.title,
    this.onBack,
    this.onSearch,
    this.onNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.grey, size: 28),
      leading: onBack != null
          ? IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.grey,
        ), onPressed: () {
        Navigator.pop(context);
      },
      )
          : null,
      actions: [
        if (onSearch != null)
          IconButton(
            onPressed: onSearch,
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        if (onNotifications != null)
          IconButton(
            onPressed: onNotifications,
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
        Container(
          margin: const EdgeInsets.only(top: 4, right: 16, bottom: 5),
          child: IconButton(
            icon: const Icon(
              Icons.person_2_outlined,
              color: Colors.grey,
            ), onPressed: () {
            Navigator.pushNamed(context, 'user_profile');
          },
          ),
        )
      ],
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
