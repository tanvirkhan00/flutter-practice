import 'package:flutter/material.dart';

class water_button extends StatelessWidget {
  final int amount ;
  IconData ? icon;
  final VoidCallback onClick;

  water_button({
    super.key, required this.amount, required this.onClick, this.icon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton.icon(onPressed: onClick,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            icon: Icon(icon ?? Icons.water_drop, size: 25,color: Colors.red,),
            label:Text( '+$amount LTR', style: TextStyle(
                fontSize: 20,
              color: Colors.black
            ),) ),
      ),
    );
  }
}
