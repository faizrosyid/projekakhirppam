// class UserModel {
//   late String user_id;
//   late String user_name;
//   late String email;
//   late String password;
//
//   UserModel(this.user_id, this.user_name, this.email, this.password);
//
//   Map<String, dynamic> toMap() {
//     return{
//       'user_id': user_id,
//       'user_name': user_name,
//       'email': email,
//       'password': password,
//     };
//
//   }
//
//   UserModel.fromMap(Map<String, dynamic> map) {
//     user_id = map['user_id'];
//     user_name = map['user_name'];
//     email = map['email'];
//     password = map['password'];
//   }
// }

class UserModel {
  late String user_id;
  late String user_name;
  late String email;
  late String password;

  UserModel(this.user_id, this.user_name, this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'user_name': user_name,
      'email': email,
      'password': password,
    };
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    user_name = map['user_name'];
    email = map['email'];
    password = map['password'];
  }
}