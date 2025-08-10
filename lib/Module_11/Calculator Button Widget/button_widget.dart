import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String text ;
  Color ? color;
  final VoidCallback onClick;

  CalculatorButton({
    super.key,
    required this.onClick,
    required this.text,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(onPressed: onClick,
            style: ElevatedButton.styleFrom(
                backgroundColor: color ?? Colors.grey[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.all(10)
            ),
            child: Text(text,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),
            )),
      ),
    );
  }
}
