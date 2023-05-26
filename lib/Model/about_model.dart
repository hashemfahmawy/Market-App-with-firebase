class AboutModel {
  String? desc;
  AboutModel({
    this.desc,
  });
  AboutModel.fromJson(Map<String, dynamic> json) {
    desc = json["desc"];
  }
}
