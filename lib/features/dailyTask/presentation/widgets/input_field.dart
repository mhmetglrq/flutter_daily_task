import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

import '../../../../config/items/app_colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required TextEditingController controller,
    this.hintText,
    this.validator,
    this.maxLines,
    this.readOnly = false,
    this.showCursor,
    this.onTap,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool readOnly;
  final bool? showCursor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalLow,
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        showCursor: showCursor,
        maxLines: maxLines,
        controller: _controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: context.textTheme.labelMedium?.copyWith(
            color: AppColors.blackColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
