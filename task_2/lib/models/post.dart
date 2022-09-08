// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    ////required this.gender,
    required this.employeePic,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  //// Gender gender;
  String employeePic;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        //gender: genderValues.map[json["gender"]],
        employeePic: json["employee_pic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        // "gender": genderValues.reverse[gender],
        "employee_pic": employeePic,
      };
}

// enum Gender { BIGENDER, MALE, POLYGENDER, FEMALE, GENDERQUEER, AGENDER, GENDERFLUID, NON_BINARY }

// final genderValues = EnumValues({
//     "Agender": Gender.AGENDER,
//     "Bigender": Gender.BIGENDER,
//     "Female": Gender.FEMALE,
//     "Genderfluid": Gender.GENDERFLUID,
//     "Genderqueer": Gender.GENDERQUEER,
//     "Male": Gender.MALE,
//     "Non-binary": Gender.NON_BINARY,
//     "Polygender": Gender.POLYGENDER
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
