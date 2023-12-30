import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:match_bet/bloc/bloc_auth/sign_up_bloc/sign_up_bloc.dart';
import 'package:match_bet/repositories/auth_repositories/models/my_user_model.dart';
import 'package:match_bet/repositories/methods/algortm/stringField.dart';
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  String? _errMsg;
  bool signUpRequired = false;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;
  bool stateError = false;
  String err = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpError) {
              setState(() {
                err = state.error;
                stateError = true;
              });
            } else {
              setState(() {
                stateError = false;
              });
            }
            if (state is SignUpSuccess) {
              setState(() {
                signUpRequired = false;
              });
            } else if (state is SignUpProcess) {
              setState(() {
                signUpRequired = true;
              });
            } else if (state is SignUpFailure) {
              return;
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
                      hintText: 'Enter your username',
                      textInputType: TextInputType.emailAddress,
                      color: inputColor,
                      textEditingController: usernameController,
                      errMsg: _errMsg,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (val.length > 30) {
                          return 'Name too long';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 12,
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
                        return 'Please fill in this field';
                      } else if (!passwordRegExp.hasMatch(val)) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      if (val!.contains(RegExp(r'[A-Z]'))) {
                        setState(() {
                          containsUpperCase = true;
                        });
                      } else {
                        setState(() {
                          containsUpperCase = false;
                        });
                      }
                      if (val.contains(RegExp(r'[a-z]'))) {
                        setState(() {
                          containsLowerCase = true;
                        });
                      } else {
                        setState(() {
                          containsLowerCase = false;
                        });
                      }
                      if (val.contains(RegExp(r'[0-9]'))) {
                        setState(() {
                          containsNumber = true;
                        });
                      } else {
                        setState(() {
                          containsNumber = false;
                        });
                      }
                      if (val.contains(specialCharRexExp)) {
                        setState(() {
                          containsSpecialChar = true;
                        });
                      } else {
                        setState(() {
                          containsSpecialChar = false;
                        });
                      }
                      if (val.length >= 8) {
                        setState(() {
                          contains8Length = true;
                        });
                      } else {
                        setState(() {
                          contains8Length = false;
                        });
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  !signUpRequired && !stateError
                      ? ButtonWidget(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              MyUser myUser = MyUser.empty;
                              myUser = myUser.copyWith(
                                email: emailController.text,
                                name: usernameController.text,
                              );
                              setState(() {
                                context.read<SignUpBloc>().add(SignUpRequired(
                                    myUser, passwordController.text));
                              });
                            }
                          },
                          buttonText: 'Sign Up')
                      : Container(
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
                  const SizedBox(
                    height: 10,
                  ),
                  const ButtonGoogleWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  stateError
                      ? Flexible(
                          child: Center(
                            child: Text(
                              err.replaceAll(regExp, ""),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        )
                      : Container(),
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: const Text(
                          'Have an accaount? ',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(LoginRoute());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Log In',
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
