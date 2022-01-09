import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/common/components/app_bars.dart';
import 'package:multiquimica_store_app/modules/catalogue/view/categories_tab_page.dart';
import 'package:multiquimica_store_app/modules/login/view/login_page.dart';
import 'package:multiquimica_store_app/modules/orders/view/orders_tab_page.dart';
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
      appBar: AppBars.mainAppBar(context: context, text: AppStrings.appName),
      body: _buildTab(),
      bottomNavigationBar: _buildBottomNavigationBar()
    );
  }

  Widget _buildTab(){
    return new IndexedStack(
      index: _tabIndex,
      children: <Widget>[
        CategoriesTabPage(),
        OrdersTabPage(),
      ],
    );
  }

  Widget _buildBottomNavigationBar(){
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.store),label: AppLocalizations.of(context)!.catalogue),
        BottomNavigationBarItem(icon: Icon(Icons.local_mall),label: AppLocalizations.of(context)!.orders),
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.exit_to_app),onPressed:()=> _showLogOutDialog(context),),label: AppLocalizations.of(context)!.logout,)
      ],
      currentIndex: _tabIndex,
      onTap: _changeTab,
    );
  }

  void _goToLogin(BuildContext context){
    Navigator.of(context)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (Route<dynamic> route) => false);
  }


  void _changeTab(int index) {
    setState(() {
      _tabIndex = index > 1 ? _tabIndex : index; //When is de tab for LogOut, do nothing.
    });
  }

  _showLogOutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              title: Text('Do you want to Log out?'),
              content: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Icon(
                        Icons.check_circle_outline,
                        size: 40,
                        color: Colors.green,
                      ),
                      title: Text(
                        'Yes',
                      ),
                      onTap: ()=>_goToLogin(context),
                    ),
                  ),
                  Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Icon(
                          Icons.cancel_outlined,
                          size: 40,
                          color: Colors.red,
                        ),
                        title: Text('No'),
                        onTap: ()=> Navigator.of(context).pop(),
                      )),
                ],
              ),
              );
        });
  }
}
