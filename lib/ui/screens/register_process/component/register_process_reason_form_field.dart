import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';

class ProcessReasonFormField extends StatelessWidget {
  const ProcessReasonFormField({super.key, required this.title, required this.decription});
  final String title;
  final String decription;

  @override
  Widget build(BuildContext context) {
    return  IntrinsicHeight(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: getHeadline1TextStyle(),
                              ),
                            ],
                          ),
                           Text(
                            decription,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}