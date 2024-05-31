class FiveDayData {
  final String? dateTime;
  final double? temp;

  FiveDayData({this.dateTime, this.temp});


  factory FiveDayData.fromJson(Map<String, dynamic> json) {
    return FiveDayData(
      dateTime: json['dt_txt'],
      temp: (json['main']['temp'] - 273.15), // Converting temperature from Kelvin to Celsius
    );
  }
}
