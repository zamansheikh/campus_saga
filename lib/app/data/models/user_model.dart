class User {
  String? name;
  String? phoneNumber;
  String? password;
  String? gender;
  String? university;
  String? department;
  bool? isVerified;

  User(
      {this.name,
      this.phoneNumber,
      this.password,
      this.gender,
      this.university,
      this.department,
      this.isVerified});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    gender = json['gender'];
    university = json['university'];
    department = json['department'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['gender'] = gender;
    data['university'] = university;
    data['department'] = department;
    data['isVerified'] = isVerified;
    return data;
  }
}
