import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// The VYORA mark: a rising "V" path that ends in a dot (the goal).
class VyoraLogo extends StatelessWidget {
  const VyoraLogo({super.key, this.size = 96});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'VYORA',
      image: true,
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _LogoPainter()),
      ),
    );
  }
}

class _LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final k = size.width / 64; // design grid is 64 x 64

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset.zero & size,
        Radius.circular(18 * k),
      ),
      Paint()..color = Brand.violet,
    );

    final v = Path()
      ..moveTo(17 * k, 20 * k)
      ..lineTo(30 * k, 46 * k)
      ..lineTo(44 * k, 25 * k);
    canvas.drawPath(
      v,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6 * k
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    canvas.drawCircle(
      Offset(49 * k, 17 * k),
      4.5 * k,
      Paint()..color = Brand.mint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
