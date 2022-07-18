
import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/constant.dart';

/// Base text with black color and letter spacing set
class AppTextBase extends StatelessWidget {
  const AppTextBase(
      this.text, {
        this.style,
        this.textAlign = TextAlign.left,
        this.overflow = TextOverflow.visible,
        this.maxLines = 1,
        Key? key,
      }) : super(key: key);
  final String? text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    assert(text != null, 'test can not be null');
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 15,
      ).merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

/// Main black bold text
class AppTextBold extends AppTextBase {
  AppTextBold(
      String text, {
        Key? key,
        TextStyle? style,
        TextAlign? textAlign,
        TextOverflow? overflow,
        int maxLines = 2,
      }) : super(
    text,
    key: key,
    style: const TextStyle(
      fontFamily: AppFont.montserrat,
    ).merge(style),
    textAlign: textAlign ?? TextAlign.left,
    overflow: overflow ?? TextOverflow.visible,
    maxLines: maxLines,
  );
}

/// Semi-bold text
class AppTextSemiBold extends AppTextBase {
  AppTextSemiBold(
      String text, {
        Key? key,
        TextStyle? style,
        TextAlign? textAlign,
        TextOverflow? overflow,
        int maxLines = 2,
      }) : super(
    text,
    key: key,
    style: const TextStyle(
      fontFamily: AppFont.montserrat,
    ).merge(style),
    textAlign: textAlign ?? TextAlign.left,
    overflow: overflow ?? TextOverflow.visible,
    maxLines: maxLines,
  );
}

/// Medium text
class AppTextMedium extends AppTextBase {
  AppTextMedium(
      String text, {
        Key? key,
        TextStyle? style,
        TextAlign textAlign = TextAlign.left,
        TextOverflow overflow = TextOverflow.visible,
        int maxLines = 2,
      }) : super(
    text,
    key: key,
    style: const TextStyle(
      fontFamily: AppFont.montserrat,
    ).merge(style),
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );
}

/// Medium text
class AppTextRegular extends AppTextBase {
  AppTextRegular(
      String text, {
        Key? key,
        TextStyle? style,
        TextAlign textAlign = TextAlign.left,
        TextOverflow overflow = TextOverflow.visible,
        int maxLines = 2,
      }) : super(
    text,
    key: key,
    style: const TextStyle(
      fontFamily: AppFont.montserrat,
    ).merge(style),
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );
}

class TextBody extends TextRegular {
  TextBody(
      String text, {
        Key? key,
        TextStyle? style,
        Color? color,
        double? fontSize,
        TextAlign textAlign = TextAlign.left,
        TextOverflow overflow = TextOverflow.visible,
        int maxLines = 2,
        double? height,
      }) : super(
    text,
    key: key,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? AppColors.white,
      fontWeight: FontWeight.w400,
      height: height,
    ).merge(style),
    textAlign: textAlign,
  );
}

class H1 extends AppTextBold {
  H1(
      String text, {
        Key? key,
        Color? color,
        TextStyle? style,
        TextAlign textAlign = TextAlign.left,
        TextOverflow overflow = TextOverflow.visible,
        int maxLines = 3,
      }) : super(
    text,
    key: key,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: color ?? AppColors.white,
    ).merge(style),
    textAlign: textAlign,
  );
}

class TextRegular extends AppTextRegular {
  TextRegular(
      String text, {
        Key? key,
        TextStyle? style,
        TextAlign textAlign = TextAlign.left,
        TextOverflow overflow = TextOverflow.visible,
        int maxLines = 2,
      }) : super(
    text,
    key: key,
    overflow: overflow,
    maxLines: maxLines,
    style: const TextStyle(
      fontFamily: AppFont.montserrat,
      fontSize: 15,
    ).merge(style),
    textAlign: textAlign,
  );
}

class TextBold extends AppTextBold {
  TextBold(
      String text, {
        Key? key,
        TextStyle? style,
        double fontSize = 32,
        FontWeight fontWeight = FontWeight.w600,
        Color? color,
        TextAlign textAlign = TextAlign.left,
        TextOverflow overflow = TextOverflow.visible,
        int maxLines = 2,
      }) : super(
    text,
    key: key,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppColors.white,
    ).merge(style),
    textAlign: textAlign,
  );
}

class TextSemiBold extends AppTextSemiBold {
  TextSemiBold(
      String text, {
        Key? key,
        TextStyle? style,
        double? fontSize,
        Color? color,
        TextAlign textAlign = TextAlign.left,
        TextOverflow overflow = TextOverflow.visible,
        int maxLines = 2,
      }) : super(
    text,
    key: key,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? AppColors.white,
      fontWeight: FontWeight.w500,
    ).merge(style),
    textAlign: textAlign,
  );
}

class SmallTextBold extends AppTextRegular {
  SmallTextBold(
      String text, {
        Key? key,
        double fontSize = 12,
        TextStyle? style,
        Color? color,
        TextAlign textAlign = TextAlign.left,
        TextOverflow overflow = TextOverflow.visible,
        int maxLines = 2,
      }) : super(
    text,
    key: key,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
    ).merge(style),
    textAlign: textAlign,
  );
}

class SmallText extends AppTextRegular {
  SmallText(
      String text, {
        double fontSize = 12,
        Key? key,
        TextStyle? style,
        Color? color,
        TextAlign textAlign = TextAlign.left,
        TextOverflow overflow = TextOverflow.visible,
        int maxLines = 2,
        FontStyle? fontStyle,
        FontWeight fontWeight = FontWeight.w300,
      }) : super(
    text,
    key: key,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
    ).merge(style),
    textAlign: textAlign,
  );
}

class SmallerText extends AppTextRegular {
  SmallerText(
      String text, {
        Key? key,
        TextStyle? style,
        TextAlign textAlign = TextAlign.left,
        TextOverflow overflow = TextOverflow.visible,
        int maxLines = 2,
        Color? color,
      }) : super(
    text,
    key: key,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: color,
    ).merge(style),
    textAlign: textAlign,
  );
}
