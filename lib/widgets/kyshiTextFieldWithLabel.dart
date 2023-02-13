import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styleguide/colors.dart';
import '../styleguide/text_styles.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:kyshi/styleguide/styleguide.dart';

class KyshiTextfieldWithLabel extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final BorderRadius? borderRadius;
  final bool showText;
  final bool autoFocus;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final String? labelText2;
  final int? maxLength;
  final int? addedPadding;
  final bool? connectBorder;
  final Color? errorBorderColor;
  final Color? focusBorderColor;
  final Color? enabledBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText, errorText;

  final bool readOnly,obscureText;
  final bool? enabled, isDense;
  final String? hintText, initialValue;

  const KyshiTextfieldWithLabel({
    Key? key,
    this.controller,
    this.focusNode,
    this.autoFocus = false,
    this.keyboardType,
    this.validator,
    this.enabledBorderColor,
    this.onSaved,
    this.errorBorderColor,
    this.focusBorderColor,
    this.inputFormatters,
    this.initialValue,
    this.onChanged,
    this.helperText,
    this.readOnly = false,
    this.isDense = true,
    this.borderRadius,
    this.obscureText = false,
    this.enabled = true,
    this.hintText,
    this.onTap,
    this.maxLength,
    this.errorText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon, this.showText = false,this.connectBorder = false, this.addedPadding, this.labelText2
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText ?? "",
            style:labelTextstyle,
          ),
          const SizedBox(
            height: 6,
          )
        ],
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType?? TextInputType.text,
          controller: controller,
          autofocus: autoFocus,
          focusNode: focusNode,
          initialValue: initialValue,
          validator: validator,
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          obscureText: obscureText,
          obscuringCharacter:'*',
          style: TextStyle(
              color: iconAndFormTextColor,
              fontSize:16.0 ,
              fontWeight:  FontWeight.w300),
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: suffixIcon,
              isDense: isDense,
              errorText: errorText,
              contentPadding:  EdgeInsets.symmetric(vertical:addedPadding != null ? 40 : 20,horizontal:10),
              // color: Color(0xff6c757d),
              // fontSize: 14.0,
              // fontWeight: FontWeight.w300
              hintStyle: TextStyle(
                  color:Color(0xff6c757d).withOpacity(0.3),
                  fontFamily: 'Gilroy',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300),
              helperStyle: thinnerHintTextStyle,
              labelStyle: labelTextstyle,
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(28.5),
                borderSide: BorderSide(color: enabledBorderColor?? const Color(0xffE6E7E9)),
              ),
              disabledBorder:  OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(28.5),
                borderSide: const BorderSide(color: Color(0xff9AA1B3)),
              ),
              labelText: labelText2 ?? "",
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius:  borderRadius ??BorderRadius.circular(28.5),
                  borderSide: const BorderSide(color: Colors.red)),
              errorBorder: OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(28.5),
                  borderSide:
                  BorderSide(color: errorBorderColor ?? Colors.red)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(28.5),
                  borderSide:
                  BorderSide(color: focusBorderColor ?? const Color(0xff9AA1B3))),
              prefixIcon: prefixIcon,
              hintText: hintText),
          onChanged: onChanged,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
