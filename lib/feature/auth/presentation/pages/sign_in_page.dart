import 'dart:ui';

import 'package:DishDash/config/theme/colors.dart';
import 'package:DishDash/core/di/injector_container.dart';
import 'package:DishDash/core/presentation/navigation/navigation_container.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/auth/presentation/cubit/forget_password_cubit.dart';
import 'package:DishDash/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:DishDash/feature/auth/presentation/cubit/sign_in_with_google_cubit.dart';
import 'package:DishDash/feature/auth/presentation/cubit/toggle_password_cubit.dart';
import 'package:DishDash/feature/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final resetPassEmailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<TogglePasswordCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SignInWithGoogleCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ForgetPasswordCubit>(),
        ),
      ],
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/images/auth_bg.jpg'),
                fit: BoxFit.cover,
                opacity: 0.4),
            gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(1),
              ],
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: Icon(
                      FontAwesomeIcons.envelope,
                      size: 15,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      FontAwesomeIcons.lock,
                      size: 15,
                    ),
                    suffixIcon: _buildSuffixIcon(context),
                  ),
                  obscureText: !isPasswordVisible,
                ),

                buildForgetPassword(context),
                buildSignInButton(context),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColors.lightColorScheme.onPrimary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: AppColors.lightColorScheme.onPrimary,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColors.lightColorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                buildSignInWithGoogleButton(context),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',
                        style: TextStyle(
                          color: AppColors.lightColorScheme.onPrimary,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  SignUpPage()));
                      },
                      child: const Text('Sign Up'),
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

  Widget _buildSuffixIcon(BuildContext context) {
    return BlocBuilder<TogglePasswordCubit, TogglePasswordState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<TogglePasswordCubit>().togglePasswordVisibility();

          },
          child: Icon(
            state.isPasswordVisible
                ? FontAwesomeIcons.eyeSlash
                : FontAwesomeIcons.eye,
            size: 15,
          ),
        );
      },
    );
  }

  Widget buildSignInButton(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.uiState == UIState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.exception ?? 'Error'),
            ),
          );
        }
        if (state.uiState == UIState.success) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationContainer(),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.uiState == UIState.loading) {
          return const CircularProgressIndicator();
        }
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.lightColorScheme.onPrimary,
          ),
          child: TextButton(
            onPressed: () {
              if(emailController.text.isEmpty || passwordController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all fields'),
                  ),
                );
                return;
              }
              context.read<LoginCubit>().login(email: emailController.text, password: passwordController.text,);
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                color: AppColors.lightColorScheme.scrim,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSignInWithGoogleButton(BuildContext context) {
    return BlocConsumer<SignInWithGoogleCubit, SignInWithGoogleState>(
      listener: (context, state) {
        if (state.uiState == UIState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.exception ?? 'Error'),
            ),
          );
        } else if (state.uiState == UIState.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationContainer(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.lightColorScheme.onPrimary,
          ),
          child: TextButton(
            onPressed: () {
              context.read<SignInWithGoogleCubit>().signInWithGoogle();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google-logo.png',
                  height: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  'Sign In with Google',
                  style: TextStyle(
                    color: AppColors.lightColorScheme.scrim,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildForgetPassword(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state.uiState == UIState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.exception ?? 'Error'),
            ),
          );
        }
        if (state.uiState == UIState.success) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Reset Password Email Sent'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Reset Password'),
                      content:  TextField(
                        controller: resetPassEmailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                          prefixIcon: Icon(
                            FontAwesomeIcons.envelope,
                            size: 15,
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            //context.read<ForgetPasswordCubit>().resetPassword(email: resetPassEmailController.text);
                            BlocProvider.of<ForgetPasswordCubit>(context).resetPassword(email: resetPassEmailController.text);
                          },
                          child: const Text('Reset'),
                        ),
                      ],
                    );
                  }
              );
            },
            child: const Text('Forgot password?'),
          ),
        );
      },
    );
  }
}
