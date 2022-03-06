import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class YesNoDialog extends StatelessWidget {
  final String title;
  final GestureTapCallback? onOkTap;

  const YesNoDialog({Key? key, this.title: '', this.onOkTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: Text(title),
      content: Row(
        children: <Widget>[
          Expanded(
              child: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Icon(
              Icons.cancel_outlined,
              size: 40,
              color: AppColors.primarySwatch,
            ),
            title: Text('No'),
            onTap: () => Navigator.of(context).pop(),
          )),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(
                Icons.check_circle_outline,
                size: 40,
                color: AppColors.primarySwatch,
              ),
              title: Text(
                'Yes',
              ),
              onTap: () => _onOkPressed(context),
            ),
          ),
        ],
      ),
    );
  }

  void _onOkPressed(BuildContext context) {
    Navigator.of(context).pop();
    if (onOkTap != null) onOkTap!.call();
  }
}
