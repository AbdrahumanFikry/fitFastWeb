import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fit_fast_core/fit_fast_core.dart';

class AppDropDownSearch<T> extends StatelessWidget {
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? errorText;
  final int maxLines;
  final TextAlign textAlignment;
  final TextInputType keyBoardType;
  final double fontSize;
  final double hintFontSize;
  final EdgeInsets? margin;
  final String? labelText;
  final String emptyListMessage;
  final Color? borderColor;
  final Color? cursorColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? suggestionsBoxColor;
  final Function(String?)? onSaved;
  final BorderRadius? borderRadius;
  final bool isBusy;
  final bool readOnly;
  final bool autoFocus;
  final FocusNode? focusNode;
  final double? letterSpacing;
  final List<TextInputFormatter>? formatters;
  final TextEditingController typeAheadController;
  final TextDirection? textDirection;
  final SuggestionsCallback<T> suggestionsCallback;
  final ItemBuilder<T> itemBuilder;
  final String Function(T value) itemLabel;
  final SuggestionSelectionCallback<T> onSelectItem;
  final Function()? onTap;

  const AppDropDownSearch({
    Key? key,
    required this.typeAheadController,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.itemLabel,
    required this.emptyListMessage,
    required this.onSelectItem,
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.validator,
    this.hintText,
    this.errorText,
    this.isBusy = false,
    this.readOnly = false,
    this.fontSize = 16,
    this.hintFontSize = 14.0,
    this.textAlignment = TextAlign.start,
    this.keyBoardType = TextInputType.text,
    this.maxLines = 1,
    this.margin,
    this.labelText,
    this.borderColor,
    this.suggestionsBoxColor,
    this.cursorColor,
    this.textColor,
    this.fillColor,
    this.hintColor,
    this.onSaved,
    this.borderRadius,
    this.autoFocus = false,
    this.focusNode,
    this.letterSpacing,
    this.formatters,
    this.textDirection,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(vertical: 2.5),
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
                fontSize: 16.0,
                color: ColorUtil.blackColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5.0),
          ],
          WaitingShimmer(
            loading: isBusy,
            borderRadius: borderRadius ?? AppUtil.borderRadius15,
            child: GlobalCard(
              borderRadius: borderRadius ?? AppUtil.borderRadius15,
              color: fillColor,
              margin: EdgeInsets.zero,
              elevation: 0.0,
              borderColor: errorText != null
                  ? Theme.of(context).errorColor
                  : borderColor,
              onTap: readOnly ? onTap : null,
              child: TypeAheadFormField<T>(
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  color: suggestionsBoxColor ?? ColorUtil.whiteScaffold,
                  borderRadius: AppUtil.borderRadius10,
                  elevation: 0.5,
                  constraints: const BoxConstraints.tightFor(height: 180.0),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  enabled: !readOnly,
                  autofocus: autoFocus,
                  onChanged: onChanged,
                  textAlign: textAlignment,
                  textInputAction: TextInputAction.done,
                  cursorColor: cursorColor ?? ColorUtil.primaryColor,
                  keyboardType: keyBoardType,
                  maxLines: maxLines,
                  style: AppUtil.textStyle(
                    context,
                    ignoreTextSizing: true,
                    color: textColor ?? ColorUtil.blackColor,
                    fontSize: fontSize,
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
                      fontSize: hintFontSize,
                      color: hintColor ?? ColorUtil.blackColor60,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: maxLines > 1 ? 10.0 : 0.0,
                      horizontal: suffixWidget != null ? 20.0 : 10.0,
                    ),
                    prefixIcon: prefixWidget,
                    suffixIconConstraints: BoxConstraints.tightFor(
                      width: context.isMobile ? 50.0 : 50.0,
                    ),
                    suffixIcon: suffixWidget,
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
                  ),
                  controller: typeAheadController,
                ),
                suggestionsCallback: suggestionsCallback,
                itemBuilder: itemBuilder,
                transitionBuilder: (context, suggestionsBox, controller) =>
                    suggestionsBox,
                onSuggestionSelected: (T suggestion) {
                  typeAheadController.text = itemLabel(suggestion);
                  onSelectItem(suggestion);
                },
                validator: validator,
                onSaved: onSaved,
                hideSuggestionsOnKeyboardHide: false,
                loadingBuilder: (context) => const AdaptiveLoading(),
                noItemsFoundBuilder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 15.0,
                  ),
                  child: Text(
                    emptyListMessage,
                    style: AppUtil.textStyle(
                      context,
                      fontWeight: FontWeight.w700,
                      color: context.isMobile
                          ? ColorUtil.blackColor
                          : ColorUtil.whiteColor,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ),
            ),
          ),
          if (errorText != null) ...[
            const SizedBox(height: 2.5),
            Text(
              errorText!,
              style: AppUtil.textStyle(
                context,
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Theme.of(context).errorColor,
              ),
              maxLines: 5,
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
