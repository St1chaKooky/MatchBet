import 'package:flutter/material.dart';
import 'package:match_bet/widgets/button.dart';

import '../../utils/colors.dart';
import '../../widgets/button_google.dart';
import '../../widgets/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 64,
              ),
              const TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                // textEditingController: _emailController,
              ),
              const SizedBox(
                height: 12,
              ),
              const TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                // textEditingController: _passwordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 12,
              ),
              ButtonWidget(onTap: () {}, buttonText: 'Log in'),
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
                      'Don`t have accaount? ',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Sign Up',
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
