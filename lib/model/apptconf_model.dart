class ApptConf {
  String? shortname;
  String? confirmationname;

  ApptConf({this.shortname, this.confirmationname});

  ApptConf.fromJson(Map<String, dynamic> json) {
    shortname = json['shortname'];
    confirmationname = json['confirmationname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // ignore: unnecessary_this
    data['shortname'] = this.shortname;
    data['confirmationname'] = confirmationname;
    return data;
  }
}
