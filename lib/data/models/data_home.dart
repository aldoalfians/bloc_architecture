class DataHomeModel {
  String? fullname;
  String? profile;
  String? email;
  String? nameAnimal;
  String? imageAnimal;

  DataHomeModel(
      {this.fullname,
      this.profile,
      this.email,
      this.nameAnimal,
      this.imageAnimal});

  DataHomeModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    profile = json['profile'];
    email = json['email'];
    nameAnimal = json['nameAnimal'];
    imageAnimal = json['imageAnimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['profile'] = this.profile;
    data['email'] = this.email;
    data['nameAnimal'] = this.nameAnimal;
    data['imageAnimal'] = this.imageAnimal;
    return data;
  }
}
