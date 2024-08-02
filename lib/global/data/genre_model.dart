class GenreModel {
   String genre;


  GenreModel({ required this.genre});
  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(

      genre: json['hombre'],

    );
  }
  Map<String, dynamic> toJson() {
    return {
     'genre': genre,
    };
  }

}