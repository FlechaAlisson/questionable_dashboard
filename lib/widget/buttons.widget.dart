import 'package:flutter/material.dart';
import 'package:questionable_dashboard/theme/app_colors.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  VoidCallback onTap;
  PrimaryButton({
    Key? key,
    required this.text,
    this.width = double.infinity,
    this.height = 65,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: AppColors.primary,
        ),
        width: widget.width,
        height: widget.height,
        child: Center(
            child: Text(
          widget.text.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            decoration: TextDecoration.none,
          ),
        )),
      ),
    );
  }
}
