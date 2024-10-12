import 'package:flutter/material.dart';

import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/view/home/widget/render_section.dart';

class Section extends StatelessWidget {
  final String? title;
  const Section({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      margin: const EdgeInsets.only(left: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title!, style: AppTypography.heading2),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: AppTypography.body1.copyWith(
                    color: AppColors.secondaryForeground,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: RenderSection(
              genre: title!,
            ),
          ),
        ],
      ),
    );
  }
}

class PapularSection extends StatelessWidget {
  const PapularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.only(left: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Popular", style: AppTypography.heading2),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: AppTypography.body1.copyWith(
                    color: AppColors.secondaryForeground,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Expanded(
            child: RenderPapularSection(),
          ),
        ],
      ),
    );
  }
}
