import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_project/utils.dart';

class InfoPage extends StatelessWidget {
  final String label;
  final String info;
  final TextAlign align;
  const InfoPage({
    super.key,
    required this.info,
    required this.label,
    required this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Utils.blockWidht * 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: Utils.blockWidht * 6,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Utils.blockHeight * 2),
              Text(
                info,
                textAlign: align,
                style: TextStyle(fontSize: Utils.blockWidht * 3.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
