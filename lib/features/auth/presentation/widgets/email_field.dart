import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

import '../../../../config/items/colors.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalLow,
      child: TextFormField(
        controller: _emailController,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r"\s")),
        ],
        keyboardType: TextInputType.emailAddress,
        validator: (value) =>
            value!.isEmpty ? "Please enter your e-mail address" : null,
        style: context.textTheme.bodyMedium?.copyWith(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          hintText: "Email",
          filled: true,
          fillColor: AppColors.whiteColor,
          contentPadding: context.paddingAllLow,
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.grayColor,
            fontWeight: FontWeight.w300,
          ),
          errorStyle: context.textTheme.bodySmall?.copyWith(
            color: AppColors.errorRedColor,
            fontWeight: FontWeight.w300,
            fontSize: context.dynamicHeight(0.015),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
