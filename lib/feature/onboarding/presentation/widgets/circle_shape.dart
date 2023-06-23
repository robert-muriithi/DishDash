import 'package:DishDash/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*class CircleArrow extends StatelessWidget {
  const CircleArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: CustomPaint(
        painter: CircleArrowPainter(),
      ),
    );
  }
}

class CircleArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw the circle
    canvas.drawCircle(center, radius, paint);

    final arrowPaint = Paint()
      ..color = AppColors.orange
      ..style = PaintingStyle.fill;

    // Draw the arrow
    final arrowPath = Path();
    arrowPath.moveTo(center.dx - radius * 0.4, center.dy);
    arrowPath.lineTo(center.dx, center.dy - radius * 0.4);
    arrowPath.lineTo(center.dx + radius * 0.4, center.dy);
    arrowPath.lineTo(center.dx, center.dy + radius * 0.4);
    arrowPath.close();

    canvas.drawPath(arrowPath, arrowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}*/



class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: CustomPaint(
        painter: CircleIconPainter(),
        child: const Icon(
          FontAwesomeIcons.arrowRight,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CircleIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..color = AppColors.lightColorScheme.primary
      ..style = PaintingStyle.fill;

    // Draw the circle
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

