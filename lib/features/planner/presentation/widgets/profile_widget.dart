part of '../pages/planner_page.dart';

class _ProfileWidget extends StatelessWidget {
  const _ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            backgroundColor: ColorUtil.mediumGreyColor,
            radius: 20.0,
            child: FittedBox(
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 30.0,
                  color: ColorUtil.whiteScaffold,
                ),
              ),
            ),
          ),
          if (context.isWebOrDesktop) ...[
            const SizedBox(width: 8.0),
            IntrinsicWidth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Hello Yasser",
                    style: AppUtil.textStyle(
                      context,
                      fontSize: 16.0,
                      color: ColorUtil.blackColor,
                    ),
                    maxLines: 1,
                    softWrap: true,
                  ),
                  const Divider(
                    color: ColorUtil.blackColor,
                    height: 3.0,
                    thickness: 1.0,
                  ),
                ],
              ),
            ),
            PopupMenuButton(
              padding: const EdgeInsets.all(8.0),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: ColorUtil.blackColor,
                size: 22.0,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text(
                    "Account",
                    style: AppUtil.textStyle(
                      context,
                      fontSize: 16.0,
                      color: ColorUtil.blackColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
