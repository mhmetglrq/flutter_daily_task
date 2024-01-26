import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/items/colors.dart';
import '../../../../config/utility/enum/svg_enum.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required bool isObscure,
    required this.onTap,
  }) : _isObscure = isObscure;

  final bool _isObscure;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalLow,
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r"\s")),
        ],
        keyboardType: TextInputType.visiblePassword,
        validator: (value) =>
            value!.isEmpty ? "Please enter your password" : null,
        obscureText: _isObscure,
        style: context.textTheme.bodyMedium?.copyWith(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              _isObscure
                  ? SvgConstants.eyeFilled.getSvg
                  : SvgConstants.eyeOff.getSvg,
            ),
          ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: context.dynamicHeight(0.07),
            maxWidth: context.dynamicWidth(0.07),
          ),
          hintText: "Password",
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.grayColor,
            fontWeight: FontWeight.w300,
          ),
          errorStyle: context.textTheme.bodySmall?.copyWith(
            color: AppColors.errorRedColor,
            fontWeight: FontWeight.w300,
            fontSize: context.dynamicHeight(0.015),
          ),
          filled: true,
          fillColor: AppColors.whiteColor,
          contentPadding: context.paddingAllLow,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
