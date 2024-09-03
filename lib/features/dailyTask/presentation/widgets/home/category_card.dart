import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

import '../../../../../config/items/colors.dart';
import '../../../domain/entities/status.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.status,
  });

  final StatusEntity? status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingRightLow,
      child: Container(
        decoration: BoxDecoration(
          color: Color(status?.color ?? 0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status?.value ?? "Category",
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.titleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: context.paddingVerticalLow,
                child: Text(
                  '${status?.projectCount ?? 0} tasks',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.titleTextColor,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: context.paddingVerticalLow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More Info',
                      style: context.textTheme.labelLarge?.copyWith(
                        color: AppColors.titleTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        color: AppColors.containerColor,
                        child: Padding(
                          padding: context.paddingAllLow,
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            color: Color(status?.color ?? 0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
