import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar_assignment/blocs/lang_bloc/lang_bloc.dart';
import 'package:haupcar_assignment/utils/const_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
    this.showBackIcon = true,
    this.title = "",
  }) : super(key: key);

  final bool showBackIcon;

  final String title;

  @override
  Size get preferredSize => const Size(double.infinity, 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: showBackIcon
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            )
          : const SizedBox(),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                "Thai",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ConstColors.blueColor,
                    ),
              ),
              BlocBuilder<LangBloc, LangState>(
                builder: (context, state) {
                  return CupertinoSwitch(
                    thumbColor: state.lang.languageCode == "en" ? ConstColors.buttonYellowColor : ConstColors.lightGrey,
                    // trackColor: ConstColors.buttonYellowColor.withOpacity(0.3),
                    trackColor: ConstColors.lightGrey,
                    activeColor: ConstColors.buttonYellowColor.withOpacity(0.3),
                    value: state.lang.languageCode == "en",
                    onChanged: (val) {
                      context.read<LangBloc>().add(OnLangChangedEvent());
                    },
                  );
                },
              ),
              Text(
                "Eng",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ConstColors.blueColor,
                    ),
              ),
            ],
          ),
        ),
      ],
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ConstColors.blackColor,
              height: 1,
            ),
      ),
      centerTitle: true,
    );
  }
}
