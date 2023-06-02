class UserModelRegister {
  int? id;
  String? userName;
  String? email;
  String? password;

  UserModelRegister(
      {required this.id,
      required this.userName,
      required this.email,
      required this.password});
  Map<String, Object?> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['userName'] = userName;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  UserModelRegister.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    userName = map['userName'];
    email = map['email'];
    password = map['password'];
  }
}

class UserModelLogin {
  int? id;
  String? userName;
  String? email;
  String? password;

  UserModelLogin(
      {required this.id,
      required this.userName,
      required this.email,
      required this.password});
  Map<String, Object?> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['userName'] = userName;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  UserModelLogin.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    userName = map['userName'];
    email = map['email'];
    password = map['password'];
  }
}

class UserModelPersonalDetail {
  int? id;
  dynamic fullName;
  String? email;
  String? profession;
  String? phoneNumber;
  String? country;
  String? city;

  UserModelPersonalDetail({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profession,
    required this.phoneNumber,
    required this.country,
    required this.city,
  });
  Map<String, Object?> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['profession'] = profession;
    map['phoneNumber'] = phoneNumber;
    map['country'] = country;
    map['city'] = city;
    return map;
  }

  factory UserModelPersonalDetail.fromMap(Map<String, dynamic> map) {
    return UserModelPersonalDetail(
      id: map['id'],
      fullName : map['fullName'],
      email : map['email'] ,
      profession : map['profession'],
      phoneNumber : map['phoneNumber'],
      country : map['country'],
      city : map['city'] ,
    );
  }
}

class UserModeExperience {
  int? id;
  String? userName;
  String? email;
  String? password;

  UserModeExperience(
      {required this.id,
      required this.userName,
      required this.email,
      required this.password});
  Map<String, Object?> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['userName'] = userName;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  UserModeExperience.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    userName = map['userName'];
    email = map['email'];
    password = map['password'];
  }
}

class UserModelOthers {
  int? id;
  String? userName;
  String? email;
  String? password;

  UserModelOthers(
      {required this.id,
      required this.userName,
      required this.email,
      required this.password});
  Map<String, Object?> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['userName'] = userName;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  UserModelOthers.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    userName = map['userName'];
    email = map['email'];
    password = map['password'];
  }
}

class UserModelProject {
  int? id;
  String? userName;
  String? email;
  String? password;

  UserModelProject(
      {required this.id,
      required this.userName,
      required this.email,
      required this.password});
  Map<String, Object?> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['userName'] = userName;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  UserModelProject.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    userName = map['userName'];
    email = map['email'];
    password = map['password'];
  }
}
