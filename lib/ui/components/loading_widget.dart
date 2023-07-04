import 'package:flutter/material.dart';
import 'package:time_tracker/configs/theme_manager.dart';

class LoadingProvider extends StatefulWidget {
  const LoadingProvider({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<LoadingProvider> createState() => _LoadingProviderState();
}

class _LoadingProviderState extends State<LoadingProvider> {
  bool isLoading = false;

  void show() {
    setState(() {
      isLoading = true;
    });
  }

  void hide() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingInherited(
        show: show,
        hide: hide,
        child: Stack(
          textDirection: TextDirection.ltr,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: IgnorePointer(ignoring: isLoading, child: widget.child),
            ),
            isLoading
                ? SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: GeneralColors.primaryColor,
                      ),
                    ),
                  )
                : Container()
          ],
        ));
  }
}

class LoadingInherited extends InheritedWidget {
  const LoadingInherited({
    super.key,
    required super.child,
    required this.show,
    required this.hide,
  });

  final void Function() show;
  final void Function() hide;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static LoadingInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoadingInherited>();
  }
}
