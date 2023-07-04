import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/icon_manager.dart';

class TutorContentModel {
  final String id;
  final String title;
  final String description;

  TutorContentModel({
    required this.id,
    required this.title,
    required this.description,
  });

  TutorContentModel copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return TutorContentModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}

class TutorContentTile extends StatelessWidget {
  const TutorContentTile({
    super.key,
    required this.isSelected,
    required this.model,
    this.onTilePressed,
    this.onRemovedPressed,
  });

  final bool isSelected;
  final TutorContentModel model;
  final VoidCallback? onTilePressed;
  final VoidCallback? onRemovedPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTilePressed,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            color: isSelected
                ? theme.primaryColor.withOpacity(0.1)
                : Colors.transparent,
            border: Border.all(
              color: isSelected ? theme.primaryColor : const Color(0xFFEFF1F3),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      model.title,
                      style: getBody1TextStyle(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Visibility.maintain(
                    visible: !isSelected,
                    child: AbsorbPointer(
                      absorbing: isSelected,
                      child: TextButton(
                        onPressed: onRemovedPressed,
                        style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "Remove",
                          style: getCaptionTextStyle().copyWith(
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      model.description,
                      style: getBody2TextStyle(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    isSelected ? IconManager.tickFilled : IconManager.tickEmpty,
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
