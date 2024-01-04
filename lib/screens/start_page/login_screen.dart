import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:match_bet/bloc/bloc_auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:match_bet/repositories/methods/algortm/stringField.dart';
import 'package:match_bet/widgets/button.dart';

import '../../router/router.dart';
import '../../utils/colors.dart';

import '../../widgets/input.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _errMsg;
  bool signInRequired = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              setState(() {
                signInRequired = false;
              });
            } else if (state is SignInProcess) {
              setState(() {
                signInRequired = true;
              });
            } else if (state is SignInFailure) {
              setState(() {
                signInRequired = false;
                _errMsg = 'Invalid email or password';
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Form(
              key: _formKey,
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
                  TextFieldInput(
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    color: inputColor,
                    textEditingController: emailController,
                    errMsg: _errMsg,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in input';
                      } else if (!emailRexExp.hasMatch(val)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFieldInput(
                    hintText: 'Enter your password',
                    textInputType: TextInputType.text,
                    textEditingController: passwordController,
                    isPassword: true,
                    color: inputColor,
                    errMsg: _errMsg,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in input';
                      } else if (!passwordRegExp.hasMatch(val)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  !signInRequired
                      ? ButtonWidget(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SignInBloc>().add(SignInRequired(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          buttonText: 'Log in')
                      : Container(
                          child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 30),
                              decoration: ShapeDecoration(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  color: primaryColor),
                              child: Center(
                                  child: SizedBox(
                                height: 16,
                                width: 16,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: whiteColor,
                                )),
                              ))),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  // const ButtonGoogleWidget(),
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
                        onTap: () {
                          AutoRouter.of(context).push(SignUpRoute());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500),
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
        ),
      ),
    );
  }
}
