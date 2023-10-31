import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';
import 'package:match_bet/widgets/button.dart';

import '../../router/router.dart';
import '../../widgets/button_google.dart';
import '../../widgets/input.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFieldInput(
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                textEditingController: _nameController,
                isPassword: true,
                color: inputColor,
              ),
              const SizedBox(
                height: 12,
              ),
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
                color: inputColor,
              ),
              const SizedBox(
                height: 12,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPassword: true,
                color: inputColor,
              ),
              const SizedBox(
                height: 12,
              ),
              ButtonWidget(onTap: () {}, buttonText: 'Sign Up'),
              const SizedBox(
                height: 10,
              ),
              const ButtonGoogleWidget(),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const Text(
                      'Have an account? ',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(LoginRoute());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
