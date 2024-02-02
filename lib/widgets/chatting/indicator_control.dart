import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(this, onChanged);
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomTabIndicatorPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final double indicatorWidth = 120;
    final double indicatorHeight = 3.0;

    final Rect rect = Rect.fromCenter(
      center: Offset(
        offset.dx + (configuration.size!.width / 2),
        offset.dy + configuration.size!.height - (indicatorHeight / 2),
      ),
      width: indicatorWidth,
      height: indicatorHeight,
    );

    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = indicatorHeight
      ..strokeCap = StrokeCap.square;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
      ),
      paint,
    );
  }
}
