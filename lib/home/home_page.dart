import 'package:flutter/material.dart';
import 'package:i_project/home/gradient_mask.dart';
import 'package:i_project/utils.dart';

import 'home_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Utils.bodyPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Utils.blockHeight * 2.5,
              ),
              Text(
                "Welcome, Isaac",
                style: TextStyle(
                  fontSize: Utils.blockWidht * 7,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Utils.blockHeight * 5),
              const HomeTile(
                title: "Do you know ?",
                note:
                    "A number of promising approaches to reduce sexual violence against children are being tested, but many more are needed",
                buttonText: "Learn More",
              ),
              const HomeTile(
                title: "Report Abuse",
                note:
                    "Maybe you have a suspicion that a child is being abused with evidence. or confirmation with the said child.",
                buttonText: "Report Abuse",
                icon: Icons.report_outlined,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        icons: const [
          Icons.home,
          Icons.home,
        ],
        index: 0,
        onChanged: (index) {
          print(index);
        },
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  final List<IconData> icons;
  final Function(int)? onChanged;
  final int index;
  const CustomBottomNavBar({
    Key? key,
    required this.index,
    required this.icons,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  List<IconData> _icons = [];

  @override
  void initState() {
    super.initState();
    _icons = widget.icons;
    _currentIndex = widget.index;
  }

  void setCurrentIndex(int i) {
    _currentIndex = i;
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.icons.length != oldWidget.icons.length) {
      _icons = widget.icons;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.blockHeight * 6,
      width: double.infinity,
      decoration: BoxDecoration(
        // border: Border(top: BorderSide(color: Colors.white,),),
        color: Colors.grey.withOpacity(.15),
      ),
      child: Row(
        children: [
          for (var i = 0; i < _icons.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setCurrentIndex(i);
                  widget.onChanged?.call(i);
                },
                child: Container(
                  color: Colors.transparent,
                  height: double.infinity,
                  width: double.infinity,
                  child: _currentIndex == i
                      ? GradientMask(
                          child: Icon(
                            _icons[i],
                            color: Colors.grey,
                          ),
                        )
                      : Icon(
                          _icons[i],
                          color: Colors.grey,
                        ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
