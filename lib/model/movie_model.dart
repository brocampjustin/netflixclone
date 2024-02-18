class Movie {
  String name;
  String discription;
  String imageUrl;
  String? date;

  Movie(
      {required this.discription, required this.imageUrl, required this.name,this.date});
}
class MovieTrending {
  String name;
  String discription;
  String imageUrl;
  String date;

  MovieTrending(
      {required this.discription, required this.imageUrl, required this.name,required this.date});
}
