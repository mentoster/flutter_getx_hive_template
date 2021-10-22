import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import '../../../controllers/login_controller.dart';
import '../../theme/app_constants.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Login page'),
        ),
        // resizeToAvoidBottomInset: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ListView(
              children: [
                Obx(() => controller.registered.value == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("You already in registered in app!"),
                          Text("Email: ${controller.loginModel.value.email}"),
                          Text(
                              "Password: ${controller.loginModel.value.password}"),
                        ],
                      )
                    : Container()),
                _SignInForm(),
              ],
            ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: defaultPadding,
          ),
          CupertinoTextField(
            controller: widget._emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
          ),
          const SizedBox(
            height: 12,
          ),
          CupertinoTextField(
            obscureText: true,
            controller: widget._passwordController,
          ),
          const SizedBox(
            height: 16,
          ),
          CupertinoButton.filled(
              onPressed: _onLoginButtonPressed,
              child: const Text('Registration')),
        ],
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
