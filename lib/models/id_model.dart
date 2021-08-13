class IdModel {
  String? title;
  String? locationType;
  int? woeid;
  IdModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    locationType = json['location_type'];
    woeid = json['woeid'];
  }
}