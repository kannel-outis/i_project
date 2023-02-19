import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_project/abuse/report_abuse.dart';
import 'package:i_project/auth/log_in.dart';
import 'package:i_project/home/gradient_mask.dart';
import 'package:i_project/sub/do_you_know.dart';
import 'package:i_project/utils.dart';

import 'contact_tile.dart';
import 'home_tile.dart';

class HomePage extends StatefulWidget {
  final String? username;
  const HomePage({super.key, this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
    _pageController = PageController();
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore_for_file: use_build_context_synchronously
    if (Navigator.of(context).canPop()) {
      Navigator.pop(context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LogIn(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Utils.bodyPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Utils.blockHeight * 2.5,
                  ),
                  Text(
                    "Welcome, ${widget.username ?? FirebaseAuth.instance.currentUser!.displayName}",
                    style: TextStyle(
                      fontSize: Utils.blockWidht * 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Utils.blockHeight * 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const DoYouKnowPage()),
                      );
                    },
                    child: const HomeTile(
                      title: "Do you know ?",
                      note:
                          "A number of promising approaches to reduce sexual violence against children are being tested, but many more are needed",
                      buttonText: "Learn More",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const ReportAbuse()),
                        ),
                      );
                    },
                    child: const HomeTile(
                      title: "Report Abuse",
                      note:
                          "Maybe you have a suspicion that a child is being abused with evidence. or confirmation with the said child.",
                      buttonText: "Report Abuse",
                      icon: Icons.report_outlined,
                    ),
                  ),
                ],
              ),
            ),
            const SecondPage()
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        icons: const [
          Icons.home,
          Icons.contact_page,
        ],
        index: 0,
        onChanged: (index) {
          _pageController.jumpToPage(index);
          print(index);
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Utils.bodyPadding - 20,
        vertical: Utils.bodyPadding,
      ),
      child: ListView(
        children: const [
          ContactTile(
            name: "Adetunmbi juwon",
            position: "Therapist",
            imageLink:
                "https://minimaltoolkit.com/images/randomdata/male/21.jpg",
          ),
          ContactTile(
            name: "Salami olamide",
            position: "Medical doctor",
            imageLink:
                "https://minimaltoolkit.com/images/randomdata/male/98.jpg",
          ),
          ContactTile(
            name: "Azeez taiwo",
            position: "Medical doctor",
            imageLink:
                "https://minimaltoolkit.com/images/randomdata/male/41.jpg",
          ),
          ContactTile(
            name: "Aderinola samsom",
            position: "Social counsellor",
            imageLink:
                "https://minimaltoolkit.com/images/randomdata/male/30.jpg",
          ),
          ContactTile(
            name: "Olumuyiwa damilare",
            position: "physician",
            imageLink:
                "https://minimaltoolkit.com/images/randomdata/male/11.jpg",
          ),
        ],
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
    if (widget.icons != oldWidget.icons) {
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
