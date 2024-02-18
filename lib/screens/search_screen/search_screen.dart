import 'package:flutter/material.dart';
import 'package:netflix/color/colors.dart';
import 'package:netflix/services/search_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MovieSearch.SearchMovies('hi');
  }

  String query = '';
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: AppBar(
        actions: [
          Icon(
            Icons.cast,
            color: MyColors.textColor,
          )
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: MyColors.textColor,
          ),
        ),
        backgroundColor: MyColors.bgColor,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 114, 106, 106),
              child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    query = value;
                    setState(() {});
                  },
                  style: TextStyle(color: MyColors.textColor),
                  decoration: InputDecoration(
                    hintText: 'Movies,Tv Sows',
                    hintStyle: TextStyle(color: MyColors.textColor),
                    icon: Icon(Icons.search),
                    iconColor: MyColors.textColor,
                  )),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: screenSize.height,
                color: MyColors.bgColor,
                child: FutureBuilder(
                  future: MovieSearch.SearchMovies(query),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('error'));
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data!.isEmpty) {
                        return Center(
                            child: Text(
                          'No Search Result',
                          style: TextStyle(color: MyColors.textColor),
                        ));
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://image.tmdb.org/t/p/w500${snapshot.data![index].imageUrl}'),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data![index].name,
                                    style: TextStyle(
                                        color: MyColors.textColor,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 25),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
