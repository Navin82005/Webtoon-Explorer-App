import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/view/widget/secondary_container.dart';

class GenreSection extends StatelessWidget {
  final List<String> genres;
  final bool disableHeading;
  const GenreSection(
      {super.key, required this.genres, this.disableHeading = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!disableHeading) Text("Genre", style: AppTypography.heading1),
        const SizedBox(height: 8),
        Row(
          children: genres.map((genre) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SecondaryContainer(
                child: Text(
                  genre.capitalize!,
                  style: AppTypography.subHeading1,
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
