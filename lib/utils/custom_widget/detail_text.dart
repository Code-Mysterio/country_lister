import 'package:flutter/material.dart';

class DetailText extends StatelessWidget {
  final String data;
  final String detailsData;
  const DetailText({
    Key? key,
    required this.data,
    required this.detailsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: data,
        style: TextStyle(
            fontFamily: 'Axiforma',
            fontSize: 20.0,
            color: Theme.of(context).hoverColor,
            fontWeight: FontWeight.w600),
        children: <TextSpan>[
          TextSpan(
              text: detailsData,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).hoverColor)),
        ],
      ),
    );
  }
}
