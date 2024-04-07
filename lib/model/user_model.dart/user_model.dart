class UserModel {
  final String name;
  final int age;
  final String phoneNumber;
  final String imageUrl;

  UserModel(
      {required this.name,
      required this.age,
      required this.phoneNumber,
      required this.imageUrl});
  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'],
      age: json['age'],
      phoneNumber: json['phonenumber'],
      imageUrl: json['imageUrl']);
  Map<String, dynamic> toJason() => {
        'name': name,
        'age': age,
        'phonenumber': phoneNumber,
        'imageUrl': imageUrl
      };
}
