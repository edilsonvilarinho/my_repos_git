class ErrorModel {
  String message;
  String documentationUrl;

  ErrorModel({this.message, this.documentationUrl});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    documentationUrl = json['documentation_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['documentation_url'] = this.documentationUrl;
    return data;
  }
}
