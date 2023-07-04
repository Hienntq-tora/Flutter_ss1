import 'package:flutter/material.dart';

class SelectionListTile extends StatelessWidget {
  const SelectionListTile({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.leading,
    required this.center,
    required this.trailingIcon,
    required this.selectedTrailingIcon,
  });

  final bool isSelected;
  final VoidCallback? onTap;
  final Widget leading;
  final Widget center;
  final Widget trailingIcon;
  final Widget selectedTrailingIcon;

  @override
  Widget build(BuildContext context) {
    const padding = 16.0;
    const spacer = SizedBox(width: padding);
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withOpacity(0.1)
              : Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
            color: isSelected ? colorScheme.primary : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: [
            leading,
            spacer,
            Expanded(child: center),
            spacer,
            isSelected ? selectedTrailingIcon : trailingIcon,
          ],
        ),
      ),
    );
  }
}
