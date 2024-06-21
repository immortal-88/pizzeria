import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// //////////////////////////////////////////////////////////////
/// Styles - Contains the design system for the entire app.
/// Includes paddings, text styles, timings etc. Does not include colors, check [AppTheme] file for that.

class ImageCacheSizes {
  static int get thumbWidth => 300;
  static int get thumbHeight => 280;
  static int get thumbMaxWidth => 600;
  static int get thumbMaxHeight => 560;
}

class Durations {
  static const Duration fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}

class Sizes {
  static double min = 1.0.w;
  static double fab = 10.0.w;
  static Size minSize = Size(min, min);
}

class IconSizes {
  static double fab = 5.0.w;

  static double sm = 12.0.sp;
  static double med = 14.0.sp;
  static double lg = 24.0.sp;
}

class Insets {
  static double get xs => 1.0.w;
  static double get sm => 2.0.w;
  static double get med => 1.0.h;
  static double get medx => 1.5.h;
  static double get lg => 2.0.h;
  static double get lgx => 3.0.h;
  static double get xl => 4.0.h;
  static double get xxl => 6.0.h;
  static double get xxxl => 8.0.h;
}

class Corners {
  static const double sm = 3;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double med = 6;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 8;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);

  static const double xl = 12;
  static const BorderRadius xlBorder = BorderRadius.all(lgRadius);
  static const Radius xlRadius = Radius.circular(lg);
}

class Strokes {
  static const double thin = 0.5;
  static const double med = 1;
  static const double thick = 4;
}

class Shadows {
  static List<BoxShadow> get universal => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 10),
      ];
  static List<BoxShadow> get small => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 1)),
      ];
}

/// Font Sizes
/// You can use these directly if you need, but usually there should be a predefined style in TextStyles.
class FontSizes {
  static double get s6 => 6.0.sp;
  static double get s7 => 7.0.sp;
  static double get s8 => 8.0.sp;
  static double get s9 => 9.0.sp;
  static double get s10 => 10.0.sp;
  static double get s11 => 11.0.sp;
  static double get s12 => 12.0.sp;
  static double get s13 => 13.0.sp;
  static double get s14 => 14.0.sp;
  static double get s16 => 16.0.sp;
  static double get s24 => 24.0.sp;
  static double get s48 => 48.0.sp;
}

/// Fonts - A list of Font Families, this is uses by the TextStyles class to create concrete styles.
// class Fonts {
//   static String? poppins = GoogleFonts.poppins().fontFamily;
// }

/// TextStyles - All the core text styles for the app should be declared here.
/// Don't try and create every variant in existence here, just the high level ones.
/// More specific variants can be created on the fly using `style.copyWith()`
/// `newStyle = TextStyles.body1.copyWith(lineHeight: 2, color: Colors.red)`
// class TextStyles {
//   /// Declare a base style for each Family
//   static TextStyle inter = TextStyle(
//       fontFamily: GoogleFonts.poppins().fontFamily,
//       fontWeight: FontWeight.w400,
//       height: 1);

//   static TextStyle get h1 => inter.copyWith(
//       fontWeight: FontWeight.w600,
//       fontSize: FontSizes.s48,
//       letterSpacing: -1,
//       height: 1.17);
//   static TextStyle get h2 =>
//       h1.copyWith(fontSize: FontSizes.s24, letterSpacing: -.5, height: 1.16);
//   static TextStyle get h3 =>
//       h1.copyWith(fontSize: FontSizes.s14, letterSpacing: -.05, height: 1.29);
//   static TextStyle get title1 => inter.copyWith(
//         fontWeight: FontWeight.w600,
//         fontSize: FontSizes.s14,
//       );
//   static TextStyle get title2 =>
//       title1.copyWith(fontWeight: FontWeight.w600, fontSize: FontSizes.s12);
//   static TextStyle get body1 => inter.copyWith(
//       fontWeight: FontWeight.normal,
//       fontSize: FontSizes.s12,
//       color: const Color(0xFF828A92));
//   static TextStyle get body2 =>
//       body1.copyWith(color: Colors.black, fontSize: FontSizes.s12);
//   static TextStyle get body3 =>
//       body1.copyWith(fontSize: FontSizes.s12, fontWeight: FontWeight.w600);
//   static TextStyle get button => body1.copyWith(color: Colors.black);
//   static TextStyle get callout1 => inter.copyWith(
//       fontWeight: FontWeight.w800,
//       fontSize: FontSizes.s12,
//       height: 1.17,
//       letterSpacing: .5);
//   static TextStyle get callout2 =>
//       callout1.copyWith(fontSize: FontSizes.s10, height: 1, letterSpacing: .25);
//   static TextStyle get caption => inter.copyWith(
//       fontWeight: FontWeight.w500, fontSize: FontSizes.s11, height: 1.36);
// }

class ButtonStyles {}
