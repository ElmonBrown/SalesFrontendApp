import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiquimica_store_app/common/utils/messages_helper.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}
enum PaymentMethods { Tarjeta, Credito, Transferencia }
class _PaymentPageState extends State<PaymentPage> {
  PaymentMethods? _payment = PaymentMethods.Transferencia;

  File? _image;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        children: [
          ListTile(
              title: Text(
                'Choose payment method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Divider(),
          RadioListTile<PaymentMethods>(
            title: const Text('Tarjeta'),
            value: PaymentMethods.Tarjeta,
            groupValue: _payment,
            onChanged: (PaymentMethods? value) {
              MessagesHelper.showMessage(context, 'Opción temporalmente fuera de servicio');
              // setState(() {
              //   _payment = value;
              // });
            },
          ),
          RadioListTile<PaymentMethods>(
            title: const Text('Crédito'),
            value: PaymentMethods.Credito,
            groupValue: _payment,
            onChanged: (PaymentMethods? value) {
              MessagesHelper.showMessage(context, 'Opción temporalmente fuera de servicio');
              // setState(() {
              //   _payment = value;
              // });
            },
          ),
          RadioListTile<PaymentMethods>(
            title: const Text('Transferencia'),
            value: PaymentMethods.Transferencia,
            groupValue: _payment,
            onChanged: (PaymentMethods? value) {
              // setState(() {
              //   _payment = value;
              // });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap:  _showPickImageSourceDialog,
              child: Container(
                decoration:  BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor)
                ),
                width: double.infinity,
                height: 200,
                child: _buildImageView(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Confirmar'),
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildImageView() {
    if (_image == null)
      return Center(
        child: Icon(
          Icons.add_a_photo,
          size: 80,
          color: Colors.grey,
        ),
      );
    else
      return Image.file(
        File(_image!.path),
        fit: BoxFit.fill,
      );
  }

  _showPickImageSourceDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              title: Text('Seleccionar Imagen:'),
              content: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Icon(
                        Icons.photo_library,
                        size: 40,
                      ),
                      title: Text(
                        'Desde Galería',
                      ),
                      onTap: _pickImageFromGallery,
                    ),
                  ),
                  Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Icon(
                          Icons.camera_alt,
                          size: 40,
                        ),
                        title: Text('Desde Cámara'),
                        onTap: _pickImageFromCamera,
                      )),
                ],
              ));
              // titleTextStyle: Theme.of(context)
              //     .textTheme
              //     .title
              //     .copyWith(color: AppColors.primaryColor));
        });
  }
  Future _pickImageFromGallery() async {
    Navigator.of(context).pop();
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image != null)
      setState(() {
        _image = File(image.path);
      });
  }

  Future _pickImageFromCamera() async {
    Navigator.of(context).pop();
    final image = await picker.getImage(source: ImageSource.camera);
    if (image != null)
      setState(() {
        _image = File(image.path);
      });
  }
}
