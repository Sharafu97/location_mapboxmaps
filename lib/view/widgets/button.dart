import 'package:flutter/material.dart';
import 'package:location_mapbox_flutter/theme/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
    this.width,
  });
  final String text;
  final void Function()? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: AppColors.blue,
          fixedSize: Size(width ?? 100, height ?? 40)),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.whiteFFFFFF),
      ),
    );
  }
}
