class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});


  factory RatingModel.fromJson(Map<String, dynamic> json)=> RatingModel(rate: json['rate'].toDouble(), count: json['count']);
}