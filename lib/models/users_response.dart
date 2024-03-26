class UsersResponse {
  int? page;
  List<UserDetails>? data;

  UsersResponse({this.page, this.data});

  UsersResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'] ?? 0;
    if (json['data'] != null) {
      data = <UserDetails>[];
      json['data'].forEach((v) {
        data!.add(UserDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserDetails(
      {this.id, this.email, this.firstName, this.lastName, this.avatar});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    email = json['email'] ?? "";
    firstName = json['first_name'] ?? "";
    lastName = json['last_name'] ?? "";
    avatar = json['avatar'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}
