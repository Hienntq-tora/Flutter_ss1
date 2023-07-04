import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/icon_manager.dart';

import '../buttons/square_button.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.title,
    this.backPress,
    this.trailing,
    this.color,
  });

  final String title;
  final VoidCallback? backPress;
  final Widget? trailing;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        color: color,
        child: Row(
          children: [
            (backPress != null)
                ? SquareButton(
                    icon: SvgPicture.asset(
                      IconManager.back,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).textTheme.bodyMedium?.color ??
                              Colors.white,
                          BlendMode.srcIn),
                    ),
                    onPressed: backPress,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    splashColor: Theme.of(context).dividerColor,
                  )
                : const SizedBox(width: 48),
            const Expanded(child: SizedBox()),
            Text(
              title,
              style: getHeadline1TextStyle(),
            ),
            const Expanded(child: SizedBox()),
            trailing ?? const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
