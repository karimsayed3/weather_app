class DefaultApiResponse {
  String? statusMessage;

  DefaultApiResponse({this.statusMessage});

  DefaultApiResponse.fromJson(Map<String, dynamic> json) {
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusMessage'] = statusMessage;
    return data;
  }
}
