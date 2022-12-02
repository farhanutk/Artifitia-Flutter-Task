import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/font_styles.dart';
import '../styles/spacing.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.courseName,
    required this.authorName,
    required this.priceInRupees,
    required this.isBestSeller,
    required this.thumbnailUrl,
    required this.onBookmarkTap,
    required this.onEnrollTap,
  }) : super(key: key);

  final String courseName;
  final String authorName;
  final String priceInRupees;
  final bool isBestSeller;
  final String thumbnailUrl;

  final Function() onBookmarkTap;
  final Function() onEnrollTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: mainBorderRadius),
          clipBehavior: Clip.antiAlias,
          elevation: 15,
          shadowColor: Colors.grey[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                thumbnailUrl,
                width: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseName,
                      style: cardTitleStyle(Colors.black),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          authorName,
                          style: cardSubtitleStyle(Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          '$priceInRupees ₹',
                          style: cardPriceStyle(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        isBestSeller
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.purple[50],
                                    borderRadius: mainBorderRadius),
                                child: Text(
                                  'Best Seller',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(13),
          width: 250,
          height: 190,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(7),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: buttonBorderRadius)),
                onPressed: onBookmarkTap,
                child: const Icon(
                  Icons.bookmark_border_rounded,
                  color: Colors.white,
                  size: 17,
                ),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: buttonBorderRadius)),
                  onPressed: onEnrollTap,
                  child: const Text(
                    'Enroll',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
