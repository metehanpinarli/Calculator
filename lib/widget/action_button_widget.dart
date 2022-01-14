import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ActionButton extends StatefulWidget {
   bool selected;
  final IconData icon;
  final String title;


   ActionButton({required this.selected, required this.icon,required this.title,Key? key}) : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin:  EdgeInsets.only(top:context.normalValue),
      child: ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          leading: Icon(widget.icon),
          title: Text(widget.title,style: TextStyle(color:widget.selected?Colors.white: Colors.grey[800]),),
          trailing: widget.selected?const Icon(Icons.check_circle_outlined) :const Icon(Icons.circle_outlined),
          selected: widget.selected,
          shape: RoundedRectangleBorder(side: BorderSide(color:widget.selected?Colors.white :(Colors.grey[900])!), borderRadius: BorderRadius.circular(10)),
          onTap: () {
            setState(() {
              widget.selected = !widget.selected;
            });
          },
        ),
      ),
    );
  }
}
