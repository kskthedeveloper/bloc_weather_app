import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class LocationWidget extends StatelessWidget {
  final String location;

  LocationWidget({
    Key key,
    @required this.location
  }) : assert(location !=  null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
    );
  }
}

