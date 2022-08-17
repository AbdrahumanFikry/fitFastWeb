part of '../pages/login_page.dart';

class _ErrorPopUp extends StatelessWidget {
  const _ErrorPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state.errorMessage.isEmpty) return const SizedBox.shrink();

        return Container(
          color: Theme.of(context).errorColor.withOpacity(0.2),
          margin: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4.0,
                width: double.infinity,
                color: Theme.of(context).errorColor,
              ),
              const SizedBox(width: 12.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  state.errorMessage,
                  style: AppUtil.textStyle(
                    context,
                    color: Theme.of(context).errorColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
