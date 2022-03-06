import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/modules/home/view/home_page.dart';
import 'package:multiquimica_store_app/modules/login/services/login_service.dart';
import 'package:multiquimica_store_app/settings/app_connections.dart';
import 'package:multiquimica_store_app/settings/app_strings.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _hidePassword = true;
  bool _isLoading = false;

  TextEditingController _userEC = new TextEditingController();
  TextEditingController _passEC = new TextEditingController();

  final FocusNode _passwordFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userEC.dispose();
    _passEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildLogin());
  }

  Widget _buildLogin() {
    List<Widget> mainViewWidgets = <Widget>[_buildMainView()];
    if (_isLoading) mainViewWidgets.add(_buildLoadingView());
    return Stack(
      children: mainViewWidgets,
    );
  }

  Widget _buildLoadingView() {
    return Container(
      child: CircularProgressIndicator(),
      color: Colors.black.withOpacity(0.3),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildMainView() {
    return GestureDetector(
      child: Stack(
        children: [
          _buildBackGround(),
          _buildForm(),
        ],
      ),
      onTap: () => FocusScope.of(context).requestFocus(
        new FocusNode(),
      ),
    );
  }
  Widget _buildBackGround() {
    //TODO: Paint background with code
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset("assets/images/login_bg/bg_top.png", width: double.infinity,),
      Image.asset("assets/images/login_bg/bg_bot.png", width: double.infinity,)
    ],);
  }

  Widget _buildAnimatedBackground(){
    return Stack(
      children: [
        AnimatedPositioned(duration: Duration(milliseconds: 500 ),
          top: _hidePassword ? 0 :325,
          child: Image.asset("assets/images/login_bg/bg_top.png", width: 400,),
        ),

        AnimatedPositioned(duration: Duration(milliseconds: 500),
          bottom: _hidePassword ? 0 :325,
          child: Image.asset("assets/images/login_bg/bg_bot.png", width: 400,),
        )
      ],
    );
  }

  Widget _buildForm(){
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset("assets/images/multiquimica_logo.png"),
            ),
            Text(
              AppStrings.appName,
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _userEC,
              validator: _validateIfEmpty,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) =>
                  FocusScope.of(context).requestFocus(_passwordFocus),
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.user,
                  prefixIcon: Icon(Icons.person)),
            ),
            TextFormField(
              controller: _passEC,
              validator: _validateIfEmpty,
              focusNode: _passwordFocus,
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.password,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(_hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: _showOrHidePassword,
                  )),
              obscureText: _hidePassword,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _onLogInPressed(context),
                child: Text(AppLocalizations.of(context)!.login),
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onLogInPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showLoadingView();
      String? token = await _getToken();
      if (token != null) {
        AppConnections.token = token;
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        _hideLoadingView();
        _showErrorMessage(
            context, AppLocalizations.of(context)!.loginErrorMessage);
      }
    }
  }

  void _showOrHidePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  Future<String?> _getToken() async {
    LoginService loginService = new LoginService();
    //return await loginService.signIn("sysadmin", "sysadmin*123");
    return await loginService.signIn(_userEC.text, _passEC.text);
  }

  void _showErrorMessage(BuildContext context, String message) {
    print(message);
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 4),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _showLoadingView() {
    setState(() => _isLoading = true);
  }

  _hideLoadingView() {
    setState(() => _isLoading = false);
  }

  String? _validateIfEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.requiredField;
    }
    return null;
  }
}
