import 'package:flutter/material.dart';

class SourceIcon extends StatelessWidget {
  final String? icon;
  final String? name;
  final double width;

  const SourceIcon({super.key, this.icon, this.name, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45, width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: icon?.isNotEmpty == true
          ? Image.network(
              fit: BoxFit.cover,
              icon!,
              width: width,
              height: width,
            )
          : Center(
              child: Text(
              (name ?? "E").characters.first,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            )),
    );
  }
}
