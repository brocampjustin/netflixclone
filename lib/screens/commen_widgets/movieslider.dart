// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';

class MovieSliderWidget extends StatelessWidget {
  MovieSliderWidget(
      {super.key,
      required this.screenSize,
      required this.widgethight,
      required this.widgetwidth,
      required this.moviesLIst});
  final Future<List<Movie>> Function() moviesLIst;
  final Size screenSize;
  double widgethight;
  double widgetwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widgethight,
      width: double.infinity,
      child: FutureBuilder(
        future: moviesLIst(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('no Data fond');
          }

          if (snapshot.data!.isEmpty) {
            return Text('No Data fond');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: widgethight,
                      width: widgetwidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${snapshot.data![index].imageUrl}'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('An Eror occured');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
