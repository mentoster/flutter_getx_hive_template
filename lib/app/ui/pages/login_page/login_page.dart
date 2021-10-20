import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import '../../../controllers/login_controller.dart';
import '../../../data/models/login_model.dart';
import '../../global_widgets/pages_buttons.dart';
import '../../theme/app_constants.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => controller.registred.value == true
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("You already in servise!"),
                        Text("Email: ${controller.loginModel.value.email}"),
                        Text(
                            "Password: ${controller.loginModel.value.password}"),
                      ],
                    )
                  : Container()),
              _SignInForm(),
              controller.registred.value == true
                  ? const PagesButtons()
                  : const SizedBox(),
            ],
          ),
        ));
  }
}

class _SignInForm extends StatefulWidget {
  final log = Logger('SignInForm');
  final LoginController _controller = Get.find();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
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
              decoration: const InputDecoration(
                labelText: 'Email address',
                filled: true,
                isDense: true,
              ),
              controller: widget._emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required.';
                }
                if (!value.isEmail) {
                  return 'Not email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                isDense: true,
              ),
              obscureText: true,
              controller: widget._passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required.';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: _onLoginButtonPressed,
                child: const Text('Registration')),
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
      widget._controller.saveLogin(LoginModel(
          email: widget._emailController.text,
          password: widget._passwordController.text));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
