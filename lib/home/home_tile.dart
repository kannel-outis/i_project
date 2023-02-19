import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:i_project/utils.dart';

import 'gradient_mask.dart';

class HomeTile extends StatelessWidget {
  final String title;
  final String buttonText;
  final String note;
  final IconData? icon;
  final Function()? callback;
  const HomeTile({
    Key? key,
    required this.buttonText,
    required this.note,
    required this.title,
    this.callback,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.blockHeight * 17,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Utils.blockWidht * 5,
        vertical: Utils.blockHeight * 2,
      ),
      margin: EdgeInsets.only(bottom: Utils.blockHeight * 2.5),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(Utils.borderRadius),
        // border: GradientBoxBorder(
        //   gradient: Utils.borderGradient,
        // ),
        color: Colors.grey.withOpacity(.15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: Utils.blockWidht * 3.1,
                        ),
                      ),
                      SizedBox(height: Utils.blockHeight),
                      Text(
                        note,
                        style: TextStyle(
                          fontSize: Utils.blockWidht * 3.3,
                          color: Colors.white.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: Utils.blockWidht * 4),
                Icon(
                  icon ?? Icons.forum_outlined,
                  color: Colors.grey,
                  size: Utils.blockWidht * 10,
                ),
              ],
            ),
          ),
          SizedBox(height: Utils.blockHeight * 2),
          GestureDetector(
            onTap: callback,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: Utils.blockWidht * 3.3,
                      color: const Color(0xffC44BC1).withOpacity(.8),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    color: const Color(0xffC44BC1).withOpacity(.8),
                    size: Utils.blockWidht * 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
