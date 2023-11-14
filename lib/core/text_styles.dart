import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'sizes.dart';

class TextStyles {
  static final small = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Sizes.smallFontSize,
  );

  static final regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Sizes.regularFontSize,
  );

  static final greyText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Sizes.regularFontSize,
      color: Colors.grey);

  static final medium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Sizes.mediumFontSize,
  );

  static final large = TextStyle(
    fontWeight: FontWeight.w400,
    height: 1.57,
    fontSize: Sizes.h1FontSize,
  );

  static const semiBold = TextStyle(
    fontWeight: FontWeight.w600,
  );

  static final light = TextStyle(
    height: 1.57,
    fontSize: Sizes.regularFontSize,
  );

  // Bold Text
  static final bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: Sizes.regularFontSize,
  );

  static final lightBold = TextStyle(
    fontWeight: FontWeight.w600,
    height: 1.57,
    fontSize: Sizes.regularFontSize,
    color: Colors.white,
  );

  static final largeBold = large.copyWith(fontWeight: FontWeight.w600);
  static final mediumBold = medium.copyWith(fontWeight: FontWeight.w600);

  static final greyBoldText = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: Sizes.regularFontSize,
    color: Colors.grey,
  );

  static const moreLessText =
      TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold);
}
