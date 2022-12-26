part of '../pages/daily_planner_page.dart';

class _Cart extends StatelessWidget {
  const _Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      color: ColorUtil.accentColor,
      borderRadius: AppUtil.borderRadius30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30.0),
        child: context.isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _FilledDaysDropDownMenu(),
                  const SizedBox(height: 20.0),
                  AppButton(
                    onTap: () {},
                    context: context,
                    elevation: 0.0,
                    fontSize: 14.0,
                    title: S.of(context).checkout,
                    textColor: ColorUtil.accentColor,
                    borderRadius: AppUtil.borderRadius20,
                    backgroundColor: ColorUtil.whiteColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35.0,
                      vertical: 20.0,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _FilledDaysDropDownMenu(),
                  const Spacer(),
                  AppButton(
                    onTap: () {},
                    shrink: true,
                    context: context,
                    elevation: 0.0,
                    fontSize: 14.0,
                    title: S.of(context).checkout,
                    textColor: ColorUtil.accentColor,
                    borderRadius: AppUtil.borderRadius20,
                    backgroundColor: ColorUtil.whiteColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35.0,
                      vertical: 20.0,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final String title;
  final bool onMenu;

  const _CartItemCard({
    Key? key,
    required this.title,
    this.onMenu = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                DateTime.now().toFormattedDate('dd'),
                style: AppUtil.textStyle(
                  context,
                  fontWeight: FontWeight.w500,
                  color: ColorUtil.accentColor,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(width: 5.0),
              Text(
                DateTime.now().toFormattedDate('EEE'),
                style: AppUtil.textStyle(
                  context,
                  fontWeight: FontWeight.w500,
                  color: ColorUtil.accentColor,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(width: 10.0),
              Image.asset(
                WebPathUtil.mealPNG,
                width: 36.0,
                height: 36.0,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  title,
                  style: AppUtil.textStyle(
                    context,
                    fontWeight: FontWeight.w500,
                    color: ColorUtil.blackColor,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (onMenu) ...[
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    WebPathUtil.replaceSVG,
                    height: 24.0,
                    width: 24.0,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    WebPathUtil.trashSVG,
                    height: 24.0,
                    width: 24.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (onMenu)
          const Divider(
            color: ColorUtil.mediumGreyColor,
            height: 1.0,
            thickness: 1.0,
          ),
      ],
    );
  }
}

class _FilledDaysDropDownMenu extends StatelessWidget {
  const _FilledDaysDropDownMenu({Key? key}) : super(key: key);
  static final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
  ];
  static String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      color: ColorUtil.whiteScaffold,
      borderRadius: AppUtil.borderRadius20,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: const _CartItemCard(title: 'Meat With Rice'),
          value: selectedValue,
          onChanged: (value) {
            selectedValue = value as String;
          },
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: ColorUtil.greyColor,
          ),
          iconSize: 24,
          focusColor: Colors.transparent,
          iconEnabledColor: ColorUtil.accentColor,
          iconDisabledColor: ColorUtil.greyColor,
          buttonHeight: 60,
          buttonWidth: 370,
          itemHeight: 61.0,
          isDense: true,
          dropdownMaxHeight: 200.0,
          dropdownWidth: 400,
          buttonPadding: const EdgeInsets.only(right: 12.0),
          buttonElevation: 0,
          itemPadding: EdgeInsets.zero,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: AppUtil.borderRadius15,
            color: ColorUtil.whiteScaffold,
          ),
          dropdownElevation: 10,
          scrollbarRadius: const Radius.circular(20),
          scrollbarThickness: 5,
          scrollbarAlwaysShow: true,
          offset: const Offset(0, 0),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: _CartItemCard(
                      title: item,
                      onMenu: true,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
