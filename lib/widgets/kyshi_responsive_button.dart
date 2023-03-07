import 'dart:ui';

import '../helper/screen_export.dart';
import '../styleguide/text_styles.dart';

class KyshiButtonResponsive extends StatelessWidget {
  final Color? color;
  final TextStyle? childTextStyle;
  final String? text;
  final double? elevation;
  final double? size;
  final double? radius;
  final Color? borderColor;
  final double? height;
  final VoidCallback? onPressed;
  final Widget? child;

//responsive button
  const KyshiButtonResponsive(
      {this.text,
      @required this.color,
      @required this.onPressed,
      this.size,
      this.elevation,
      this.height,
      this.child,
      this.childTextStyle,
      this.radius,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = childTextStyle ?? buttonTextStyleResponsive;

    return MaterialButton(
      elevation: elevation,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          side: BorderSide(color: borderColor ?? Colors.transparent)),
      onPressed: onPressed,
      minWidth: size,
      height: height ?? 64,
      child: child ?? Text(text ?? "", style: textStyle),
    );
  }
}
