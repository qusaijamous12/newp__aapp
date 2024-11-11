class UserModel{

  final String ?age;
  final String ?email;
  final String ?idNumber;
  final String ?phoneNumber;
  final String ?uid;
  final String ?userName;
  final int ?status;

  UserModel({
    this.uid,
    this.age,
    this.email,
    this.userName,
    this.phoneNumber,
    this.idNumber,
    this.status

});


  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      age: json['age'],
      email: json['email'],
      idNumber: json['idNumber'],
      phoneNumber: json['phone_number'],
      userName: json['user_name'],
      uid: json['uid'],
      status: json['status']
    );
  }


}