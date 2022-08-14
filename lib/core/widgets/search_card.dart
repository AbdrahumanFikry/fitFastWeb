import 'package:flutter/material.dart';
import 'package:fit_fast_core/fit_fast_core.dart';

class SearchCard extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? netImageUrl;

  const SearchCard({
    Key? key,
    required this.title,
    this.subTitle,
    this.netImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      elevation: 2.0,
      color: context.isMobile ? ColorUtil.whiteColor : ColorUtil.primaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
      child: ListTile(
        title: Text(
          title,
          style: AppUtil.textStyle(
            context,
            fontSize: 14.0,
            color:
                context.isMobile ? ColorUtil.blackColor : ColorUtil.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: subTitle == null
            ? null
            : Text(
                subTitle!,
                style: AppUtil.textStyle(
                  context,
                  fontSize: 12.0,
                  color: ColorUtil.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
        leading: netImageUrl == null
            ? null
            : SizedBox(
                width: 50.0,
                child: NetImage(
                  netImageUrl!,
                  fit: BoxFit.contain,
                  showErrorWidget: true,
                ),
              ),
      ),
    );
  }
}
