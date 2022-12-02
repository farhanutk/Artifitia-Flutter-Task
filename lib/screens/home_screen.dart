import 'package:artifitia_flutter_task/services/database_services.dart';
import 'package:artifitia_flutter_task/styles/spacing.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/font_styles.dart';
import '../widgets/course_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //nav items (to be used later when multiple screens are there)
  // final List<Widget> _navItems = [];

  int _selectedIndex = 0;

  void _onTap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // for slide animation
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: sectionPadding,
                child: Text('Learn and Evolve', style: mainTitleStyle()),
              ),
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                        .animate(_animationController),
                child: Stack(alignment: Alignment.bottomLeft, children: [
                  Container(
                    margin: sectionPadding,
                    decoration: BoxDecoration(
                        color: primaryColor, borderRadius: mainBorderRadius),
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, bottom: 10, right: 30),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/asif.png',
                          height: 160,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Become Master in Data Science',
                                  style: mediumSectionTitleStyle(Colors.white),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  'By Asif Abduraheem',
                                  style: cardSubtitleStyle(Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: sectionPadding,
                child: Text(
                  'Featured Course',
                  style: largeSectionTitleStyle(),
                ),
              ),
              FutureBuilder(
                  future: getCourses(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      final List courses = snapshot.data;
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(1, 0), end: Offset.zero)
                            .animate(_animationController),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(30, 7, 30, 17),
                            child: Row(
                              children: courses
                                  .map(
                                    (course) => Padding(
                                      padding: const EdgeInsets.only(right: 17),
                                      child: CourseCard(
                                          courseName: course["courseName"],
                                          authorName: course["authorName"],
                                          priceInRupees:
                                              course["priceInRupees"],
                                          isBestSeller: course["isBestSeller"],
                                          thumbnailUrl: course["thumbnailUrl"],
                                          onBookmarkTap: () {},
                                          onEnrollTap: () {}),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Show More',
                          style: TextStyle(color: primaryColor),
                        )),
                  ],
                ),
              ),
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                        .animate(_animationController),
                child: Container(
                  padding: sectionPadding,
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/slider.png',
                      ),
                    ),
                  ),
                  child: Text(
                    'Join the Community',
                    style: mediumSectionTitleStyle(Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 25,
          onTap: _onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill_rounded),
              label: 'Play',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmarks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
