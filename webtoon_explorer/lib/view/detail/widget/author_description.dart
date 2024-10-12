import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/view/widget/secondary_text.dart';

class AuthorDescription extends StatelessWidget {
  final List<String> authors;
  const AuthorDescription({super.key, required this.authors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Creator", style: AppTypography.heading1),
        const SizedBox(height: 8),
        Row(
          children: [
            ...authors.map((author) {
              return SecondaryText(
                text: author.capitalize!,
                padding: const EdgeInsets.only(right: 10),
              );
            }),
          ],
        ),
      ],
    );
  }
}
