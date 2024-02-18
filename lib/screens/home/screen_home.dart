// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:netflix/color/colors.dart';

import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/account/account.dart';
import 'package:netflix/screens/commen_widgets/banner_button.dart';
import 'package:netflix/screens/commen_widgets/buttom_navbar.dart';
import 'package:netflix/screens/commen_widgets/faltbutton.dart';
import 'package:netflix/screens/commen_widgets/movieslider.dart';
import 'package:netflix/screens/commen_widgets/subheddings.dart';
import 'package:netflix/screens/home/home_screen.dart';
import 'package:netflix/screens/news_and_hot/news_and_hot.dart';
import 'package:netflix/screens/search_screen/search_screen.dart';

import 'package:netflix/services/movie_services.dart';
import 'package:netflix/services/trending_now_serviece.dart';
import 'package:netflix/services/tv_show_sevices.dart';

int navCurrentIndex = 0;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ValueNotifier<int> tredingLength = ValueNotifier(0);
  List<Movie> trending = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovies();
    TrendingNow.trendingNow();
  }

  getMovies() async {
    trending = await TVshowService.popularTV();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<Widget> mywidget = [
      ScreenHome(screenSize: screenSize),
      HotAndNew(),
      Account(screenSize: screenSize),
    ];
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      // ...
      appBar: AppBar(
        backgroundColor: MyColors.bgColor,
        leading: Container(
          child: Row(
            children: [
              SizedBox(
                width: screenSize.width * 0.03,
              ),
              Image(
                image: const AssetImage(
                  'assets/images/netflix.png',
                ),
                width: screenSize.width * 0.05,
              ),
            ],
          ),
        ),
        leadingWidth: screenSize.width * 0.1,
        actions: [
          Icon(
            Icons.cast,
            color: MyColors.textColor,
            size: screenSize.width * 0.065,
          ),
          SizedBox(
            width: screenSize.width * 0.05,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ));
            },
            icon: Icon(
              Icons.search,
              color: MyColors.textColor,
              size: screenSize.width * 0.065,
            ),
          ),
          SizedBox(
            width: screenSize.width * 0.03,
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.bgColor,
        unselectedItemColor: MyColors.textColor,
        selectedItemColor: MyColors.textColor,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: MyColors.textColor),
        onTap: (value) {
          navCurrentIndex = value;
          setState(() {});
        },
        currentIndex: navCurrentIndex,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.newspaper), label: 'New &hot'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'My Netflix')
        ],
      ),

      body: mywidget[navCurrentIndex],
    );
  }
}



// class SubHeddings extends StatelessWidget {
//   const SubHeddings({
//     super.key,
//     required this.screenSize,
//   });

//   final Size screenSize;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           'Text',
//           style: TextStyle(
//               fontWeight: FontWeight.w600,
//               color: MyColors.textColor,
//               fontSize: screenSize.height * 0.033),
//         ));
//   }
// }
