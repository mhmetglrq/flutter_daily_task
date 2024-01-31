import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    super.key,
    this.height,
    required this.icon,
    this.onTap,
    this.color,
  });

  final double? height;
  final String icon;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalLow,
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          icon,
          height: height ?? context.dynamicHeight(0.05),
          colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
