import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilities/path_util.dart';

class ContactLinks extends StatelessWidget {
  const ContactLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ContactWidget(
          svgPath: WebPathUtil.instagramSVG,
          onTap: () {},
        ),
        _ContactWidget(
          svgPath: WebPathUtil.whatsappSVG,
          onTap: () {},
        ),
        _ContactWidget(
          svgPath: WebPathUtil.facebookSVG,
          onTap: () {},
        ),
        _ContactWidget(
          svgPath: WebPathUtil.instagramSVG,
          onTap: () {},
        ),
        _ContactWidget(
          svgPath: WebPathUtil.twitterSVG,
          onTap: () {},
        ),
      ],
    );
  }
}

class _ContactWidget extends StatelessWidget {
  final String svgPath;
  final String? title;
  final Function()? onTap;

  const _ContactWidget({
    Key? key,
    required this.svgPath,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              svgPath,
              width: 24.0,
              height: 24.0,
              fit: BoxFit.fill,
            ),
          ),
          if (title != null && context.isWebOrDesktop)
            Text(
              title!,
              style: AppUtil.textStyle(
                context,
                fontSize: 14.0,
                color: ColorUtil.blackColor,
              ),
            ),
        ],
      ),
    );
  }
}
