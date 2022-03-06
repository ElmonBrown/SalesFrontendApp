import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(color: AppColors.primarySwatch,)
          ),
          ListTile(
            leading: Icon(Icons.clear),
            title: Text('Close'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
