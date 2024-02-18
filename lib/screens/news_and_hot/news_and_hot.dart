import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/color/colors.dart';
import 'package:netflix/services/trending_now_serviece.dart';

class HotAndNew extends StatelessWidget {
  const HotAndNew({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TrendingNow.trendingNow(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text(
            'ther is an errror',
            style: TextStyle(color: MyColors.textColor),
          ));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              DateFormat.MMM().format(DateFormat("yyyy-MM-dd")
                                  .parse(snapshot.data![index].date)),
                              style: TextStyle(
                                  color: MyColors.textColor, fontSize: 25),
                            ),
                            Text(
                              DateFormat.d().format(DateFormat("yyyy-MM-dd")
                                  .parse(snapshot.data![index].date)),
                              style: TextStyle(
                                  color: MyColors.textColor, fontSize: 30),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${snapshot.data![index].imageUrl}'))),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Text(
                            snapshot.data![index].discription,
                            style: TextStyle(
                              color: MyColors.textColor,
                              overflow: TextOverflow.visible,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
