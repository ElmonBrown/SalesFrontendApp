import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/common/components/SideBar.dart';
import 'package:multiquimica_store_app/common/components/app_bars.dart';
import 'package:multiquimica_store_app/common/components/yes_no_dialog.dart';
import 'package:multiquimica_store_app/modules/catalogue/view/categories_tab_page.dart';
import 'package:multiquimica_store_app/modules/login/view/login_page.dart';
import 'package:multiquimica_store_app/modules/orders/view/orders_tab_page.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';
import 'package:multiquimica_store_app/settings/app_strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.mainAppBar(context: context, text: AppStrings.appName,toolbarHeight: 0),
        drawer: SideBar(),
        body: _buildTab(),
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  Widget _buildTab() {
    return new IndexedStack(
      index: _tabIndex,
      children: <Widget>[
        CategoriesTabPage(),
        OrdersTabPage(),
        Container(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: AppColors.primarySwatch,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: AppLocalizations.of(context)!.catalogue),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_mall),
            label: AppLocalizations.of(context)!.orders),
        BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacto'),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => _showLogOutDialog(context),
          ),
          label: AppLocalizations.of(context)!.logout,
        )
      ],
      currentIndex: _tabIndex,
      onTap: _changeTab,
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  void _changeTab(int index) {
    setState(() {
      _tabIndex = index > 2
          ? _tabIndex
          : index; //When is de tab for LogOut, do nothing.
    });
  }

  _showLogOutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return YesNoDialog(
            title: 'Do you want to Log out?',
            onOkTap: () => _goToLogin(context),
          );
        });
  }
}
