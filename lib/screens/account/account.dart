import 'package:flutter/material.dart';
import 'package:netflix/color/colors.dart';
import 'package:netflix/screens/commen_widgets/banner_button.dart';
import 'package:netflix/screens/commen_widgets/faltbutton.dart';
import 'package:netflix/screens/commen_widgets/movieslider.dart';
import 'package:netflix/screens/commen_widgets/subheddings.dart';
import 'package:netflix/services/movie_services.dart';
import 'package:netflix/services/tv_show_sevices.dart';

class Account extends StatelessWidget {
  Account({super.key, required this.screenSize});
  Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Icon(
                Icons.person,
                size: 50,
                color: MyColors.textColor,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 83, 63, 63),
              ),
              height: 100,
              width: 100,
            ),
            Text(
              'Justin',
              style: TextStyle(
                  color: MyColors.textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.notifications,
                      size: 25,
                      color: MyColors.textColor,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                    height: 45,
                    width: 45,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  subHeddings(
                      screenSize: screenSize, heddingText: "Notifications"),
                  SizedBox(
                    width: 130,
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: MyColors.textColor,
                    size: 40,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.download,
                      size: 25,
                      color: MyColors.textColor,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Color.fromARGB(255, 5, 4, 106),
                    ),
                    height: 45,
                    width: 45,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  subHeddings(screenSize: screenSize, heddingText: "Downloads"),
                  SizedBox(
                    width: 150,
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: MyColors.textColor,
                    size: 40,
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.04,
            ),
            subHeddings(
                screenSize: screenSize,
                heddingText: 'Tv Shows \& Movies you liked'),
            MovieSliderWidget(
              screenSize: screenSize,
              widgethight: screenSize.height * 0.28,
              widgetwidth: screenSize.width * 0.32,
              moviesLIst: MovieService.trendingMovies,
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            subHeddings(
                screenSize: screenSize, heddingText: 'Movies You Watched'),
            MovieSliderWidget(
              screenSize: screenSize,
              widgethight: screenSize.height * 0.39,
              widgetwidth: screenSize.width * 0.5,
              moviesLIst: MovieService.popularMovies,
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            subHeddings(
                screenSize: screenSize, heddingText: 'Up Comming Tv Shows'),
            MovieSliderWidget(
              screenSize: screenSize,
              widgethight: screenSize.height * 0.28,
              widgetwidth: screenSize.width * 0.32,
              moviesLIst: TVshowService.topRatedTV,
            ),
          ],
        ),
      ),
    );
  }
}
