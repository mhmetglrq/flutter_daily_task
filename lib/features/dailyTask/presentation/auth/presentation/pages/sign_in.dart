import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/routes/app_route_names.dart';
import 'package:flutter_daily_task/config/utility/enum/image_enums.dart';

import '../../../../../../config/items/colors.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/purple_button.dart';
import '../widgets/text_row_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: context.dynamicHeight(1),
            width: double.infinity,
            child: Image.asset(
              ImageConstants.signIn.getPng,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.scaffoldColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: context.dynamicHeight(0.45),
              width: double.infinity,
              padding: context.paddingAllDefault,
              child: AspectRatio(
                aspectRatio: 1,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: context.paddingVerticalLow,
                          child: Text(
                            "Sign In",
                            style: context.textTheme.titleLarge?.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        EmailField(emailController: _emailController),
                        PasswordField(
                          isObscure: _isObscure,
                          onTap: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        PurpleButton(
                          title: "Sign In",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(
                                  context, AppRouteNames.bottomNavbar);
                            }
                          },
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Forgot Password ?",
                              style: context.textTheme.labelMedium?.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        TextRowButton(
                          text: "Don’t haven’t an account ? ",
                          buttonText: "Sign Up",
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRouteNames.signUp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
