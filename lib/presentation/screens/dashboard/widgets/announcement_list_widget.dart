import 'package:arkatrack/presentation/widgets/app_alert_widget.dart';
import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:arkatrack/utils/constant.dart';
import 'package:arkatrack/utils/extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AnnouncementListWidget extends StatelessWidget {
  const AnnouncementListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppTypography(
              text: 'Announcements',
              fontSize: AppFontSize.extraLarge,
              fontWeight: FontWeight.bold,
            ),
            InkWell(
              onTap: () {},
              child: const AppTypography(
                text: 'View All ',
                fontSize: AppFontSize.medium,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (context) => const AppAlertWidget(
                  title: 'Under Maintenance',
                  content:
                      'This feature is under maintenance. Please try again later.',
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(LocalImages().arkademiBanner),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppTypography(
                        text: 'Arkademi',
                        fontSize: AppFontSize.extraLarge,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                      AppTypography(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        fontSize: AppFontSize.medium,
                        color: AppColors.white,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 15),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    ).withVerticalSpacing(8);
  }
}
