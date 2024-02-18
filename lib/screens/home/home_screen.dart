import 'package:flutter/material.dart';
import 'package:netflix/color/colors.dart';
import 'package:netflix/screens/commen_widgets/banner_button.dart';
import 'package:netflix/screens/commen_widgets/faltbutton.dart';
import 'package:netflix/screens/commen_widgets/movieslider.dart';
import 'package:netflix/screens/commen_widgets/subheddings.dart';
import 'package:netflix/services/movie_services.dart';
import 'package:netflix/services/tv_show_sevices.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                MyflatButton(isSelected: false, buttonlabel: 'TV Shows'),
                MyflatButton(
                  isSelected: false,
                  buttonlabel: 'Movies',
                ),
                MyflatButton(
                  isSelected: false,
                  buttonlabel: 'Categories',
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Container(
              height: screenSize.height * 0.6,
              width: double.infinity,
              child: FutureBuilder(
                future: MovieService.trendingMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Stack(
                      children: [
                        Container(
                          height: screenSize.height * 0.7,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${snapshot.data![0].imageUrl}',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                          bottom: 25,
                          left: 30,
                          child: banerButton(
                            screenSize: screenSize,
                            BackgroundColor: MyColors.textColor,
                            forgroudColor: MyColors.bgColor,
                            buttonIcon: Icons.play_arrow,
                            buttonLabel: 'Play',
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          left: 200,
                          child: banerButton(
                            screenSize: screenSize,
                            BackgroundColor:
                                Color.fromARGB(44, 255, 255, 255),
                            forgroudColor: MyColors.textColor,
                            buttonIcon: Icons.check_rounded,
                            buttonLabel: 'MyLIst',
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('An Error occured'));
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            subHeddings(
                screenSize: screenSize, heddingText: 'Trending Movies'),
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
                screenSize: screenSize, heddingText: 'Top Rated Movies'),
            MovieSliderWidget(
              screenSize: screenSize,
              widgethight: screenSize.height * 0.28,
              widgetwidth: screenSize.width * 0.32,
              moviesLIst: MovieService.topRatedMovies,
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            subHeddings(
                screenSize: screenSize, heddingText: 'Up Comming Movies'),
            MovieSliderWidget(
              screenSize: screenSize,
              widgethight: screenSize.height * 0.28,
              widgetwidth: screenSize.width * 0.32,
              moviesLIst: MovieService.upcomingMovies,
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            subHeddings(
                screenSize: screenSize, heddingText: 'Popular Movies'),
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
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            subHeddings(
                screenSize: screenSize, heddingText: 'Popular Tv Shows'),
            MovieSliderWidget(
              screenSize: screenSize,
              widgethight: screenSize.height * 0.28,
              widgetwidth: screenSize.width * 0.32,
              moviesLIst: TVshowService.popularTV,
            ),
          ],
        ),
      ),
    );
  }
}