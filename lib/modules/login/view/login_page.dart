import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/modules/home/view/home_page.dart';
import 'package:multiquimica_store_app/modules/login/services/login_service.dart';
import 'package:multiquimica_store_app/settings/app_connections.dart';
class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:24),
              child: Image.asset("assets/images/multiquimica_logo.png"),
            ),
            Text('Store App', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
            SizedBox(height: 50,),
            TextFormField(decoration: InputDecoration(labelText: AppLocalizations.of(context)!.user,prefixIcon: Icon(Icons.person)),),
            TextFormField(decoration: InputDecoration(labelText: AppLocalizations.of(context)!.password,prefixIcon: Icon(Icons.lock), suffixIcon: IconButton(icon:Icon(Icons.visibility) ,onPressed: (){},)),obscureText: true,),

            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=> _onLogInPressed(context), child: Text(AppLocalizations.of(context)!.login),
                style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),),),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onLogInPressed (BuildContext context) async {
          String? token = await _getToken();
          if(token != null)
            {
              AppConnections.token = token;
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            }
          else
            _showErrorMessage(context, 'ha ocurrido un errror');

  }

  Future<String?> _getToken() async {
    LoginService loginService = new LoginService();
    return await loginService.signIn("sysadmin", "sysadmin*123");
  }

  void _showErrorMessage(BuildContext context, String message) {
    print(message);
    final snackBar = SnackBar(content: Text(message), duration: Duration(seconds: 4),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}