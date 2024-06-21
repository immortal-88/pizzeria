import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/common/common_widgets/big_button.dart';
import 'package:pizzeria_app/src/common/common_widgets/custom_appbar.dart';
import 'package:pizzeria_app/src/common/common_widgets/custom_text_field.dart';
import 'package:pizzeria_app/src/features/auth/presentation/controllers/register_controller.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends HookConsumerWidget {
  SignUpPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final confirmPasswordController = useTextEditingController(text: '');
    final nameController = useTextEditingController(text: '');
    final lastNameController = useTextEditingController(text: '');

    // final key = useState(GlobalKey<FormState>());

    final register = ref.read(registerControllerProvider.notifier);
    // final registerState = ref.watch(registerControllerProvider);

    final obscureText = useState(true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: ''),
      body: SizedBox(
        height: 100.h,
        child: Container(
          margin: EdgeInsets.only(top: 5.h),
          child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  Center(
                      child: Text(
                    'My Pizzeria Sign Up',
                    style: TextStyle(
                        fontSize: FontSizes.s16, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(height: 1.h),
                  Center(
                      child: Text(
                          'Hey, Enter your details to create your account',
                          style: TextStyle(fontSize: FontSizes.s11))),
                  SizedBox(height: 5.h),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(Insets.lg, Insets.sm, Insets.lg, 0),
                    child: CustomTextField(
                        hintText: 'Name',
                        withBorder: false,
                        controller: nameController,
                        validator: (value) =>
                            value!.isEmpty ? 'Name is required' : null,
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(Insets.lg, Insets.sm, Insets.lg, 0),
                    child: CustomTextField(
                        hintText: 'Last Name',
                        withBorder: false,
                        controller: lastNameController,
                        validator: (value) =>
                            value!.isEmpty ? 'Last Name is required' : null,
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(Insets.lg, Insets.sm, Insets.lg, 0),
                    child: CustomTextField(
                        hintText: 'Email',
                        withBorder: false,
                        controller: emailController,
                        validator: (value) =>
                            value!.isEmpty ? 'Email is required' : null,
                        prefixIcon: const Icon(Icons.email)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(Insets.lg, Insets.sm, Insets.lg, 0),
                    child: CustomTextField(
                        hintText: 'Password',
                        withBorder: false,
                        controller: passwordController,
                        obscureText: obscureText.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            obscureText.value = !obscureText.value;
                          },
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.password)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(Insets.lg, Insets.sm, Insets.lg, 0),
                    child: CustomTextField(
                        hintText: 'Confirm Password',
                        obscureText: obscureText.value,
                        withBorder: false,
                        autovalidate: true,
                        controller: confirmPasswordController,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            obscureText.value = !obscureText.value;
                          },
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.password)),
                  ),
                  Container(
                    width: 100.w,
                    padding: EdgeInsets.fromLTRB(
                        Insets.lg, Insets.xl, Insets.lg, Insets.xl),
                    child: BigButton(
                      text: 'Sign Up',
                      onTap: _formKey.currentState?.validate() ?? false
                          ? null
                          : () {
                              register.register(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                                lastName: lastNameController.text,
                              );
                            },
                    ),
                  ),
                  SizedBox(height: 3.h),
                  const Spacer(),
                ],
              )),
        ),
      ),
    );
  }
}
