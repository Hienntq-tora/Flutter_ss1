import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  final double rating;
  final double size;
  final bool showText;
  final bool isDisabled;
  final TextStyle? ratingTextStyle;
  final double textSpacing;
  final String? reviewText;
  final TextStyle? reviewTextStyle;
  final Function(double rating)? callBack;

  const RatingBar({
    super.key,
    required this.rating,
    this.size = 18,
    this.callBack,
    this.showText = true,
    this.ratingTextStyle,
    this.isDisabled = false,
    this.textSpacing = 10,
    this.reviewText,
    this.reviewTextStyle,
  });

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  final _starRowKey = GlobalKey();
  double _rating = 0.0;

  void _onRatingBarPanUpdate(DragUpdateDetails details) {
    final upperBound = _starRowKey.currentContext!.size!.width;
    final xOffSet = details.localPosition.dx;
    double tempValue = xOffSet;
    int counter = 0;
    double newRating = 0.0;

    if (xOffSet > 0.0 && xOffSet < upperBound) {
      while (tempValue > 0) {
        counter += 1;
        if (tempValue < widget.size) {
          // Hanlde remainder
          break;
        } else {
          tempValue -= widget.size;
        }
      }
      newRating = counter.toDouble();
    } else {
      if (xOffSet >= upperBound) {
        newRating = 5;
      }
    }
    _setRating(newRating);
  }

  void _setRating(double rating) {
    setState(() {
      _rating = rating;
      widget.callBack?.call(rating);
    });
  }

  @override
  void initState() {
    _rating = widget.rating;
    widget.callBack?.call(_rating);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Widget> starList = [];

    int realNumber = _rating.floor();
    int partNumber = ((_rating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      late Widget starIcon;

      if (i < realNumber) {
        starIcon = Icon(
          Icons.star,
          color: theme.primaryColor,
          size: widget.size,
        );
      } else if (i == realNumber) {
        starIcon = SizedBox(
          height: widget.size,
          width: widget.size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Icon(
                Icons.star,
                color: theme.primaryColor,
                size: widget.size,
              ),
              ClipRect(
                clipper: _Clipper(part: partNumber),
                child: Icon(
                  Icons.star,
                  color: theme.disabledColor,
                  size: widget.size,
                ),
              )
            ],
          ),
        );
      } else {
        starIcon = Icon(
          Icons.star,
          color: theme.disabledColor,
          size: widget.size,
        );
      }

      starList.add(
        GestureDetector(
          onTap: () => _setRating(i + 1),
          child: starIcon,
        ),
      );
    }

    final ratingText = widget.showText
        ? Padding(
            padding: EdgeInsets.only(left: widget.textSpacing),
            child: Text(
              _rating.toStringAsFixed(1),
              style: widget.ratingTextStyle ??
                  TextStyle(
                    fontSize: widget.size * 0.8,
                    color: theme.disabledColor,
                  ),
            ),
          )
        : const SizedBox();

    final reviewText = (widget.reviewText != null)
        ? Padding(
            padding: EdgeInsets.only(left: widget.textSpacing),
            child: Text(
              widget.reviewText!,
              style: widget.reviewTextStyle ??
                  TextStyle(
                    fontSize: widget.size * 0.8,
                    color: theme.disabledColor,
                  ),
            ),
          )
        : const SizedBox();

    return AbsorbPointer(
      absorbing: widget.isDisabled,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onPanUpdate: _onRatingBarPanUpdate,
            child: Row(key: _starRowKey, children: starList),
          ),
          ratingText,
          reviewText,
        ],
      ),
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  final int part;

  _Clipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0.0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
