import 'package:arkatrack/presentation/widgets/app_alert_widget.dart';
import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:arkatrack/utils/constant.dart';
import 'package:arkatrack/utils/extension.dart';
import 'package:flutter/material.dart';

class CategoryListsWidget extends StatelessWidget {
  const CategoryListsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (context) => const AppAlertWidget(
                title: 'Under Maintenance',
                content:
                    'This feature is under maintenance. Please try again later.',
              ),
            ),
            splashFactory: InkRipple.splashFactory,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    categoriesList[index]['icon'] as String,
                    width: 48,
                    height: 48,
                  ),
                ),
                AppTypography(
                  text: categoriesList[index]['label'] as String,
                  fontSize: 12,
                  color: AppColors.black,
                ),
              ],
            ).withVerticalSpacing(4),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
      ),
    );
  }
}
