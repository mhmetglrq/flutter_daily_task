import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/routes/app_route_names.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/items/colors.dart';
import '../../../config/utility/enum/svg_enum.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                SvgPicture.asset(
                  SvgConstants.signUp.getSvg,
                  // fit: BoxFit.cover,
                ),
                Container(
                  padding: context.paddingAllHigh,
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Hello\nThere!",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Padding(
                padding: context.paddingAllDefault,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "E-Mail",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: context.paddingVerticalLow,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r"\s")),
                        ],
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => value!.isEmpty
                            ? "Please enter your e-mail address"
                            : null,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: context.paddingAllLow,
                            child: SvgPicture.asset(
                              SvgConstants.email.getSvg,
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: context.dynamicHeight(0.12),
                            maxWidth: context.dynamicWidth(0.12),
                          ),
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          contentPadding: context.paddingAllLow,
                          hintText: "xyz@gmail.com",
                          hintStyle: Theme.of(context).textTheme.bodyLarge,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: context.paddingVerticalLow,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r"\s")),
                        ],
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) => value!.isEmpty
                            ? "Please enter your password"
                            : null,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: context.paddingAllLow,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              child: SvgPicture.asset(
                                _isObscure
                                    ? SvgConstants.eyeFilled.getSvg
                                    : SvgConstants.eyeOff.getSvg,
                              ),
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: context.dynamicHeight(0.12),
                            maxWidth: context.dynamicWidth(0.12),
                          ),
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          contentPadding: context.paddingAllLow,
                          hintText: "xyz@gmail.com",
                          hintStyle: Theme.of(context).textTheme.bodyLarge,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "If you have an account",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.titleTextColor.withOpacity(0.5),
                          ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRouteNames.signIn),
                      child: Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: context.paddingVerticalLow,
                      child: MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minWidth: double.infinity,
                        color: AppColors.blueColor,
                        child: Padding(
                          padding: context.paddingAllLow,
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
