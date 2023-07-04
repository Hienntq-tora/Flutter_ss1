import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer(
      {Key? key, required this.child, required this.isLoading})
      : super(key: key);

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            ),
          )
      ],
    );
  }
}
