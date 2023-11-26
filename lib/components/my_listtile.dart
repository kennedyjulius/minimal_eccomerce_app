import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? ontap;
  MyListTile({Key? key, 
  required this.icon, 
  required this.text, 
  required this.ontap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Card(
          child: ListTile(
            leading: Icon(icon, color: Colors.grey,),
            title: Text(text),
            onTap: ontap,
          ),
        ),
    );
    
  }
}