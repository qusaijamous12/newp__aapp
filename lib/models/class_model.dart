class ClassesModel{
  final String ?classDate;
  final String ?className;
  final String ?couchName;
  final String ?uid;
  final String ?classTime;

  ClassesModel({
    this.classDate,
    this.className,
    this .couchName,
    this.uid,
    this.classTime

});

  factory ClassesModel.fromJson(Map<String,dynamic> json){
    return ClassesModel(
      classDate: json['class_date'],
      className: json['class_name'],
      couchName: json['couch_name'],
      uid: json['uid'],
      classTime: json['class_time']
    );
  }

}