import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final void Function()? ontap;
  //final IconData icon;
  final Color color;
  final Widget child;
  MyButton({Key? key, 
  required this.ontap, 
  //required this.icon, 
  required this.color, 
  required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),

        ),
        padding: EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}