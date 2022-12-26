import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:fit_fast_web/core/utilities/path_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/l10n.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    Key? key,
    this.selected = false,
  }) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      borderRadius: AppUtil.borderRadius50,
      elevation: 10.0,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: context.isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    CupertinoIcons.clear_circled,
                    color: ColorUtil.blackColor,
                    size: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const _MealImagesSlider(),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: context.isMobile
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5.0,
                      left: 5.0,
                      right: 5.0,
                    ),
                    child: SvgPicture.asset(
                      WebPathUtil.starSVG,
                      height: 18.0,
                      width: 18.0,
                      color: ColorUtil.accentColor,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    "4.5",
                    style: AppUtil.textStyle(
                      context,
                      fontWeight: FontWeight.w500,
                      color: ColorUtil.accentColor,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  const SizedBox(width: 2.0),
                  Text(
                    "(120)",
                    style: AppUtil.textStyle(
                      context,
                      fontWeight: FontWeight.w500,
                      color: ColorUtil.mediumGreyColor,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Meat With Rice",
                style: AppUtil.textStyle(
                  context,
                  fontWeight: FontWeight.w500,
                  color:
                      selected ? ColorUtil.accentColor : ColorUtil.blackColor,
                  fontSize: 28.0,
                ),
                textAlign:
                    context.isMobile ? TextAlign.center : TextAlign.start,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Traditional tine dishes, couscous and fresh salad",
                style: AppUtil.textStyle(
                  context,
                  fontWeight: FontWeight.w500,
                  color: ColorUtil.greyColor,
                  fontSize: 16.0,
                ),
                textAlign:
                    context.isMobile ? TextAlign.center : TextAlign.start,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 20.0),
            const _MealContents(),
            const SizedBox(height: 20.0),
            GlobalCard(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              color:
                  selected ? ColorUtil.accentColor : ColorUtil.lightOrangeColor,
              borderRadius: AppUtil.borderRadius30,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      selected
                          ? WebPathUtil.tickSquareSVG
                          : WebPathUtil.addSquareSVG,
                      height: 24.0,
                      width: 24.0,
                      color: selected ? null : ColorUtil.accentColor,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      selected ? S.of(context).chosen : S.of(context).choose,
                      style: AppUtil.textStyle(
                        context,
                        fontWeight: FontWeight.w500,
                        color: selected
                            ? ColorUtil.whiteScaffold
                            : ColorUtil.accentColor,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MealImagesSlider extends StatefulWidget {
  const _MealImagesSlider({Key? key}) : super(key: key);

  @override
  State<_MealImagesSlider> createState() => _MealImagesSliderState();
}

class _MealImagesSliderState extends State<_MealImagesSlider> {
  final PageController pageController = PageController(initialPage: 0);
  int currentImageViewedIndex = 0;
  final List<String> imgList = [
    WebPathUtil.loginBackgroundPNG,
    WebPathUtil.loginBackgroundPNG,
    WebPathUtil.loginBackgroundPNG,
    WebPathUtil.loginBackgroundPNG,
  ];

  static const duration = Duration(milliseconds: 350);

  double get width =>
      context.screenWidth > 1100 ? 700 : context.screenWidth * 0.7;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.isMobile ? 10.0 : 24.0,
          ),
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: context.isMobile ? 200 : 300,
                child: ClipRRect(
                  borderRadius: AppUtil.borderRadius12,
                  child: PageView.builder(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    reverse: false,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) => setState(
                      () => currentImageViewedIndex = index,
                    ),
                    itemBuilder: (context, index) => Image.asset(
                      fit: BoxFit.fitWidth,
                      WebPathUtil.loginBackgroundPNG,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlobalCard(
                        onTap: () async {
                          if (currentImageViewedIndex == 0) return;

                          await pageController.previousPage(
                            duration: duration,
                            curve: Curves.easeIn,
                          );
                        },
                        color: ColorUtil.whiteScaffold.withOpacity(0.5),
                        borderRadius: AppUtil.borderRadius20,
                        elevation: 0.0,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: ColorUtil.whiteColor,
                            size: 12.0,
                          ),
                        ),
                      ),
                      GlobalCard(
                        onTap: () async {
                          if (currentImageViewedIndex >= imgList.length - 1) {
                            return;
                          }

                          await pageController.nextPage(
                            duration: duration,
                            curve: Curves.easeIn,
                          );
                        },
                        color: ColorUtil.whiteScaffold.withOpacity(0.5),
                        borderRadius: AppUtil.borderRadius20,
                        elevation: 0.0,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorUtil.whiteColor,
                            size: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12.0),
        SizedBox(
          height: 60.0,
          width: width,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: context.isMobile ? 10.0 : 24.0),
            itemCount: imgList.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: AppUtil.borderRadius12,
              child: InkWell(
                onTap: () async => await pageController.animateToPage(
                  index,
                  duration: duration,
                  curve: Curves.easeIn,
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      imgList[index],
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                    if (index != currentImageViewedIndex)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorUtil.whiteColor.withOpacity(0.6),
                            borderRadius: AppUtil.borderRadius12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 20.0),
          ),
        ),
      ],
    );
  }
}

class _MealContents extends StatelessWidget {
  const _MealContents({Key? key}) : super(key: key);

  static const List<String> contentsList = [
    "Traditional tajine dishes, couscous and fresh salad",
    "Traditional tajine dishes, couscous and fresh salad",
    "Traditional tajine dishes, couscous and fresh salad",
    "Traditional tajine dishes, couscous and fresh salad",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contents",
            style: AppUtil.textStyle(
              context,
              fontWeight: FontWeight.w500,
              color: ColorUtil.blackColor,
              fontSize: 18.0,
            ),
            textAlign: context.isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 10.0),
          ...contentsList
              .map(
                (con) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 1.5,
                      backgroundColor: ColorUtil.greyColor,
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Text(
                        con,
                        style: AppUtil.textStyle(
                          context,
                          fontWeight: FontWeight.w500,
                          color: ColorUtil.greyColor,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
