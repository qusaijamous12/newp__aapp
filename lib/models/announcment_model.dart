class AnnouncmentModel{
  final String ?date;
  final String ?time;
  final String ?news;
  final String ?title;

  AnnouncmentModel({
    this.date,
    this.title,
    this.time,
    this.news
});

  factory AnnouncmentModel.fromJson(Map<String,dynamic> json){
    return AnnouncmentModel(
      date: json['date'],
      title: json['title'],
      news: json['news'],
      time: json['time']
    );
  }

}