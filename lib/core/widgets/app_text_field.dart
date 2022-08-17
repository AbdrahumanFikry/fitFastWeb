import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:fit_fast_web/core/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AppTextField extends StatelessWidget {
  final bool readOnly;
  final bool hidePassword;
  final bool isPassword;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? errorText;
  final int maxLines;
  final TextAlign textAlignment;
  final TextInputType keyBoardType;
  final double? fontSize;
  final double? hintFontSize;
  final Function()? changeObscuring;
  final bool autoFocus;
  final bool showError;
  final FocusNode? focusNode;
  final double? letterSpacing;
  final List<TextInputFormatter>? formatters;
  final EdgeInsets? margin;
  final String? labelText;
  final Color? borderColor;
  final Color? cursorColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final String? initialValue;
  final Function(String?)? onSaved;
  final BorderRadius? borderRadius;
  final Function()? onTap;
  final bool isBusy;
  final TextDirection? textDirection;
  final TextEditingController? textEditingController;

  const AppTextField({
    Key? key,
    this.errorText,
    this.formatters,
    this.showError = true,
    this.autoFocus = false,
    this.hidePassword = false,
    this.isPassword = false,
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.fillColor,
    this.hintText,
    this.cursorColor,
    this.fontSize,
    this.hintFontSize,
    this.textAlignment = TextAlign.start,
    this.keyBoardType = TextInputType.text,
    this.letterSpacing,
    this.changeObscuring,
    this.readOnly = false,
    this.maxLines = 1,
    this.margin,
    this.labelText,
    this.borderRadius,
    this.borderColor,
    this.hintColor,
    this.textColor,
    this.focusNode,
    this.textDirection,
    this.validator,
    this.onTap,
    this.isBusy = false,
    this.textEditingController,
    this.initialValue,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            Text(
              labelText!,
              style: AppUtil.textStyle(
                context,
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: ColorUtil.blackColor,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 6.0),
          ],
          WaitingShimmer(
            loading: isBusy,
            borderRadius: borderRadius ?? AppUtil.borderRadius15,
            child: GlobalCard(
              borderRadius: borderRadius ?? AppUtil.borderRadius15,
              color: fillColor ?? ColorUtil.lightGreyColor,
              margin: EdgeInsets.zero,
              elevation: 0.0,
              borderColor: errorText != null
                  ? Theme.of(context).errorColor
                  : borderColor,
              onTap: readOnly ? onTap : null,
              child: TextFormField(
                initialValue: initialValue,
                controller: textEditingController,
                autofocus: autoFocus,
                onSaved: onSaved,
                onChanged: onChanged,
                validator: validator,
                readOnly: readOnly,
                textAlign: textAlignment,
                textInputAction: TextInputAction.done,
                cursorColor: cursorColor ?? ColorUtil.primaryColor,
                keyboardType: keyBoardType,
                maxLines: maxLines,
                obscureText: hidePassword,
                style: AppUtil.textStyle(
                  context,
                  ignoreTextSizing: true,
                  color: textColor ?? ColorUtil.blackColor,
                  fontSize: fontSize ?? 16.0,
                  letterSpacing: letterSpacing,
                  fontWeight: FontWeight.w500,
                ),
                inputFormatters: formatters,
                focusNode: focusNode,
                textDirection: textDirection ??
                    (AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: hintText,
                  hintStyle: AppUtil.textStyle(
                    context,
                    ignoreTextSizing: true,
                    fontSize: hintFontSize ?? 14.0,
                    color: hintColor ?? ColorUtil.mediumGreyColor,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: suffixWidget != null || prefixWidget != null
                        ? 12.0
                        : 16.0,
                  ),
                  prefixIcon: prefixWidget,
                  suffixIconConstraints: const BoxConstraints.tightFor(
                    width: 56.0,
                  ),
                  prefixIconConstraints: const BoxConstraints.tightFor(
                    width: 56.0,
                  ),
                  suffixIcon: suffixWidget == null && !isPassword
                      ? null
                      : suffixWidget ??
                          (isPassword
                              ? InkWell(
                                  onTap: changeObscuring,
                                  borderRadius: borderRadius,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                      hidePassword
                                          ? WebPathUtil.openEyeSVG
                                          : WebPathUtil.openEyeSVG,
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                              : null),
                  enabledBorder: AppUtil.outLineInputBorder(
                    color: Colors.transparent,
                    borderRadius: borderRadius,
                  ),
                  disabledBorder: AppUtil.outLineInputBorder(
                    color: Colors.transparent,
                    borderRadius: borderRadius,
                  ),
                  focusedBorder: AppUtil.outLineInputBorder(
                    color: Colors.transparent,
                    borderRadius: borderRadius,
                  ),
                  border: AppUtil.outLineInputBorder(
                    color: Colors.transparent,
                    borderRadius: borderRadius,
                  ),
                  errorBorder: AppUtil.errorOutLineInputBorder(
                    context,
                    borderRadius: borderRadius,
                  ),
                  errorStyle: AppUtil.textStyle(
                    context,
                    ignoreTextSizing: true,
                    color: Theme.of(context).errorColor,
                  ),
                  errorMaxLines: 5,
                ),
              ),
            ),
          ),
          if (errorText != null && showError) ...[
            const SizedBox(height: 6.0),
            Text(
              errorText!,
              style: AppUtil.textStyle(
                context,
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Theme.of(context).errorColor,
              ),
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ],
        ],
      ),
    );
  }
}
