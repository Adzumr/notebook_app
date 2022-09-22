import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notebook/main.dart';
import 'package:notebook/widgets/toast.dart';
import 'package:sizer/sizer.dart';

import '../widgets/elevated_button.dart';
import '../widgets/text_button.dart';

class LoginScreen extends StatefulWidget {
  static const String idScreen = "loginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Notebook",
                  textAlign: TextAlign.center,
                  style: appStyles.headerFont,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isLogin ? 'Welcome back' : "Create a free account",
                        textAlign: TextAlign.left,
                        style: appStyles.titleFont,
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "Create and share unlimited notes with your friends.",
                        textAlign: TextAlign.left,
                        style: appStyles.bodyFont,
                      ),
                      SizedBox(height: 5.h),
                      TextFormField(
                        validator: (value) {
                          if (value!.trim().length < 3) {
                            return "email too short";
                          } else if (!RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: const InputDecoration(
                            hintText: 'Type your email here',
                            labelText: "Email Address"),
                      ),
                      SizedBox(height: 2.h),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.length < 6) {
                            return "password too short";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: 'Type your password',
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppElevatedButton(
                      title: isLogin ? 'Sign in' : "Sign up",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            isLogin
                                ? api.signIn(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    context: context,
                                  )
                                : api.signUp(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    context: context,
                                  );
                          } catch (e) {
                            showToast("$e", context);
                          } finally {
                            // FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 1.h),
                    AppTextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      title: isLogin
                          ? "Don't have an Account?"
                          : "Already have an Account?",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
