import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/controllers/login_controller.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_constants.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

class SignInForm extends StatefulWidget {
  final log = Logger('SignInForm');
  final LoginController _controller = Get.find();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._key,
      autovalidateMode:
          _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: defaultPadding,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email address'.tr,
                filled: true,
                isDense: true,
              ),
              controller: widget._emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required.'.tr;
                }
                if (!value.isEmail) {
                  return 'Not email'.tr;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password'.tr,
                filled: true,
                isDense: true,
              ),
              obscureText: true,
              controller: widget._passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required.'.tr;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: _onLoginButtonPressed,
                child: Text('Registration'.tr)),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _onLoginButtonPressed() {
    if (widget._key.currentState!.validate()) {
      widget._controller.saveLogin(
          widget._emailController.text, widget._passwordController.text);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
