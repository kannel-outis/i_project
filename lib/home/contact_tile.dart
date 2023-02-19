import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:i_project/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String position;
  final String imageLink;
  const ContactTile({
    Key? key,
    required this.name,
    required this.position,
    required this.imageLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.blockHeight * 17,
      width: double.infinity,
      padding: EdgeInsets.all(Utils.blockWidht * 3.5),
      margin: EdgeInsets.only(bottom: Utils.blockWidht * 4),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: Utils.blockWidht * 15,
                width: Utils.blockWidht * 15,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(Utils.blockWidht * 50),
                  image: DecorationImage(
                    image: NetworkImage(imageLink),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: Utils.blockWidht * 2),
              SizedBox(
                height: Utils.blockWidht * 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: Utils.blockWidht * 4,
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    Text(
                      position,
                      style: TextStyle(
                        fontSize: Utils.blockWidht * 2.5,
                        color: Colors.white.withOpacity(.5),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse("sms: +2347066566595"));
                },
                child: Container(
                  height: Utils.blockWidht * 10,
                  width: Utils.blockWidht * 15,
                  decoration: BoxDecoration(
                    color: const Color(0xffC44BC1).withOpacity(.8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.blockWidht * 2),
                    ),
                  ),
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                    size: Utils.blockWidht * 3.5,
                  ),
                ),
              ),
              SizedBox(width: Utils.blockWidht * 3.5),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel: +2347066566595"));
                  },
                  child: Container(
                    height: Utils.blockWidht * 10,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      border: GradientBoxBorder(
                        gradient: Utils.borderGradient,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.blockWidht * 2),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Call Now",
                        style: TextStyle(
                          fontSize: Utils.blockWidht * 3,
                          color: const Color(0xffC44BC1).withOpacity(.8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
