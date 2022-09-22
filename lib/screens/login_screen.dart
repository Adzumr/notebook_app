import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:notebook/main.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Column(
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
                    validator: EmailValidator(errorText: "Invalid Email"),
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Type your email here',
                        labelText: "Email Address"),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 2.h),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: 'Type your password',
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : AppElevatedButton(
                          title: isLogin ? 'Sign in' : "Sign up",
                          onPressed: () {
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
    );
  }
}
