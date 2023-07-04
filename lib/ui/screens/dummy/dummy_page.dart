import 'package:flutter/material.dart';
import 'package:time_tracker/configs/theme_manager.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/buttons/rounded_border_text_button.dart';
import 'package:time_tracker/ui/components/buttons/secondary_button.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/screens/lesson_history/components/comment_button.dart';
import 'package:time_tracker/ui/screens/lesson_history/components/report_button.dart';
import '../../components/buttons/square_button.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Dummy",
        backPress: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Button(
                text: "Submit",
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              SecondaryButton(
                text: "Cancel",
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              SquareButton(
                icon: const Icon(
                  Icons.add,
                  size: 24,
                  color: Colors.black,
                ),
                color: Colors.white,
                splashColor: GeneralColors.alternate,
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              CommentButton(
                isHighlighted: false,
                isDisabled: false,
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ReportButton(
                isDisabled: false,
                isUsed: false,
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              RoundedBorderTextButton(
                "Hello World",
                // borderColor: Colors.transparent,
                // textColor: Colors.white,
                // fillColor: Theme.of(context).primaryColor,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
