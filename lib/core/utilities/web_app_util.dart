import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:flutter/material.dart';

class WebAppUtil {
  static ThemeData themeData = ThemeData(
    fontFamily: "Objective",
    primaryColor: ColorUtil.accentColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorUtil.lightOrangeColor,
    ),
    scaffoldBackgroundColor: ColorUtil.whiteScaffold,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static Future<bool?> showAlertDialog(
    BuildContext context, {
    String? title,
    String? contentText,
    Function? onConfirm,
    String? confirmText,
    Color? titleColor,
    bool enableCancel = false,
    bool noMargin = false,
    String? cancelText,
    Widget? child,
  }) async {
    return await showDialog<bool?>(
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: noMargin
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),
        titlePadding: const EdgeInsets.symmetric(vertical: 5.0),
        contentPadding: EdgeInsets.zero,
        backgroundColor: ColorUtil.whiteScaffold,
        shape: ContinuousRectangleBorder(borderRadius: AppUtil.borderRadius12),
        content: SingleChildScrollView(
          child: Column(
            textDirection:
                AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppUtil.textStyle(
                      context,
                      color: titleColor ?? Theme.of(context).errorColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              if (title == null) const SizedBox(height: 10.0),
              Padding(
                padding: contentText == null
                    ? EdgeInsets.zero
                    : const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0,
                      ),
                child: child ??
                    Text(
                      contentText ?? '',
                      style: AppUtil.textStyle(
                        context,
                        color: ColorUtil.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        height: 1.5,
                      ),
                      maxLines: 10,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
              Row(
                children: [
                  if (enableCancel)
                    Expanded(
                      child: AppButton(
                        backgroundColor: ColorUtil.lightGreyColor,
                        textColor: Colors.black,
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        fontSize: 14.0,
                        shrink: true,
                        borderRadius: AppUtil.borderRadius5,
                        borderColor: Theme.of(context).errorColor,
                        margin: const EdgeInsets.all(15.0),
                        title: cancelText ?? "Back",
                        onTap: () => Navigator.pop(context, false),
                        context: context,
                      ),
                    ),
                  Expanded(
                    child: AppButton(
                      backgroundColor: Theme.of(context).errorColor,
                      textColor: Colors.white,
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      fontSize: 16.0,
                      shrink: true,
                      borderRadius: AppUtil.borderRadius5,
                      margin: const EdgeInsets.all(15.0),
                      title: confirmText ?? "Ok",
                      onTap: () {
                        if (onConfirm != null) {
                          onConfirm.call();
                        } else {
                          Navigator.pop(context, true);
                        }
                      },
                      context: context,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        buttonPadding: EdgeInsets.zero,
      ),
    );
  }
}
