import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 12,
      this.fontWeight,
      this.richTextlist,
      this.color = Colors.black,
      this.overFlow,
      this.maxLines,
      this.textAlign,
      this.fontStyle,
      this.isRich = false,
      this.textBaseLine});

  const TextWidget.rich(
      {super.key,
      this.text,
      required this.richTextlist,
      this.fontSize = 12,
      this.fontWeight,
      this.color = Colors.black,
      this.overFlow,
      this.maxLines,
      this.textAlign,
      this.isRich = true,
      this.fontStyle,
      this.textBaseLine});

  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overFlow;
  final int? maxLines;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final TextBaseline? textBaseLine;
  final bool? isRich;
  final List<InlineSpan>? richTextlist;

  @override
  Widget build(BuildContext context) {
    return isRich!
        ? Text.rich(
            maxLines: maxLines,
            textAlign: textAlign,
            TextSpan(
              children: richTextlist,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: color,
                overflow: overFlow,
                fontStyle: fontStyle,
                textBaseline: textBaseLine,
              ),
            ))
        : Text(
            text ?? "",
            maxLines: maxLines,
            textAlign: textAlign,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              overflow: overFlow,
              fontStyle: fontStyle,
              textBaseline: textBaseLine,
            ),
          );
  }
}
