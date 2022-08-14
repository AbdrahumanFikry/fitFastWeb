part of '../pages/cart_page.dart';

class _CalenderWidget extends StatelessWidget {
  const _CalenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.arrow_back_ios,
              color: ColorUtil.greyColor,
              size: 18.0,
            ),
          ),
          const SizedBox(width: 15.0),
          InkWell(
            onTap: () async {
              final result = showDialog<DateTime>(
                context: context,
                barrierColor: Colors.transparent,
                builder: (_) => Theme(
                  data: Theme.of(context).copyWith(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    colorScheme: const ColorScheme.light(
                      primary: ColorUtil.primaryColor,
                      onPrimary: ColorUtil.whiteColor,
                      onSurface: ColorUtil.blackColor,
                    ),
                    dialogTheme: const DialogTheme(elevation: 10.0),
                    dialogBackgroundColor: ColorUtil.whiteScaffold,
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        primary: ColorUtil.blackColor,
                      ),
                    ),
                  ),
                  child: DatePickerDialog(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 100)),
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.calendar_month_outlined,
              color: ColorUtil.primaryColor,
              size: 28.0,
            ),
          ),
          const SizedBox(width: 5.0),
          Text(
            DateTime.now().toFormattedDate('EEEE, dd MMM yyyy'),
            style: AppUtil.textStyle(
              context,
              fontSize: 16.0,
              color: ColorUtil.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 15.0),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.arrow_forward_ios,
              color: ColorUtil.greyColor,
              size: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
