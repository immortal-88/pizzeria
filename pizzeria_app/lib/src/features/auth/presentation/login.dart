import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/common/app_state.dart';
import 'package:pizzeria_app/src/common/common_widgets/big_button.dart';
import 'package:pizzeria_app/src/common/common_widgets/custom_appbar.dart';
import 'package:pizzeria_app/src/common/common_widgets/custom_text_field.dart';
import 'package:pizzeria_app/src/features/auth/presentation/controllers/login_controller.dart';
import 'package:pizzeria_app/src/features/auth/presentation/widgets/social_login_button.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:sizer/sizer.dart';

enum Status {
  login,
  signUp,
}

Status type = Status.login;

class LoginPage extends HookConsumerWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey();
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: [
  //     'email',
  //     'https://www.googleapis.com/auth/contacts.readonly',
  //   ],
  // );

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');

    final auth = ref.read(loginControllerProvider.notifier);

    ref.listen<AppState>(appStateProvider, (prev, state) {
      if (state is Authorized) {
        GoRouter.of(context).go('/home');
      }
      if (state is Error) {
        Flushbar(
          title: 'Error',
          message:
              state.message == null ? 'Something went wrong' : state.message!,
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
        ).show(context);
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: '', isLogin: true),
      body: Container(
        height: 100.h,
        width: 100.w,
        margin: EdgeInsets.only(top: 5.h),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                    child: Image.asset('assets/images/pizza_logo.jpg',
                        width: 40.w, height: 40.w, fit: BoxFit.contain)),
                SizedBox(height: 1.h),
                Text('My Pizzeria',
                    style: TextStyle(
                        fontSize: FontSizes.s16, fontWeight: FontWeight.bold)),
                SizedBox(height: 2.h),
                ListView(shrinkWrap: true, children: [
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(Insets.lg, Insets.sm, Insets.lg, 0),
                    child: CustomTextField(
                      hintText: 'Email',
                      withBorder: false,
                      controller: emailController,
                      prefixIcon:
                          const Icon(FontAwesomeIcons.envelope, size: 18),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(Insets.lg, Insets.sm, Insets.lg, 0),
                    child: CustomTextField(
                      hintText: 'Password',
                      withBorder: false,
                      controller: passwordController,
                      prefixIcon: const Icon(FontAwesomeIcons.lock, size: 18),
                    ),
                  ),
                ]),
                Container(
                  width: 100.w,
                  padding: EdgeInsets.fromLTRB(
                      Insets.lg, Insets.xl, Insets.lg, Insets.xl),
                  child: BigButton(
                      isGradient: true,
                      gradientColors: [
                        Colors.orange.shade500,
                        Colors.red.shade300,
                      ],
                      text: 'Sign In',
                      onTap: () => auth.login(
                          email: emailController.text,
                          password: passwordController.text)),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 10.w,
                        child: Divider(
                          height: 2.0,
                          color: Colors.grey.shade700,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text('Or Sign In With',
                          style: TextStyle(fontSize: FontSizes.s10)),
                    ),
                    SizedBox(
                        width: 10.w,
                        child: Divider(
                          height: 2.0,
                          color: Colors.grey.shade700,
                        )),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SocialLoginButton(
                          onTap: () {},
                          icon: FontAwesomeIcons.google,
                          text: 'Google',
                        ),
                        SizedBox(width: 3.w),
                        SocialLoginButton(
                          onTap: () {},
                          icon: FontAwesomeIcons.apple,
                          text: 'Apple',
                        ),
                        SizedBox(width: 3.w),
                        SocialLoginButton(
                          onTap: () {},
                          icon: FontAwesomeIcons.facebook,
                          text: 'Facebook',
                        ),
                      ]),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: () {
                            GoRouter.of(context).push('/signup');
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
