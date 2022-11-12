import 'package:flutter/material.dart';

class ButtonOnHomePage extends StatelessWidget {
  final IconData icons;
  final String data;
  final VoidCallback onTap;
  const ButtonOnHomePage({
    Key? key, required this.icons, required this.data, required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: Colors.black12, width: 1.2),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Material(
              color: Colors.transparent,
              child: Icon(
              icons,
                color: Colors.black87,
                size: 25.0,
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              data,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Axiforma',
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
