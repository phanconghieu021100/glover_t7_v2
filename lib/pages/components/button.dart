import 'package:flutter/material.dart';
import 'package:glover_t7_v2/u.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {

  final Function()? onTap;
  final String? textoBotao;
  Color color;
   CustomButton({super.key, required this.onTap, this.textoBotao, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
            child: Text(textoBotao ?? 'Access',
            style: const TextStyle(
              color: AppColors.textColor, 
              fontWeight: FontWeight.bold,
              fontSize: 16
              ),
            ),
          ),
        ),
    );
    
  }
}