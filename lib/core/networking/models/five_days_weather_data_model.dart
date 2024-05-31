class FiveDaysWeatherDataModel {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherData>? list;
  City? city;

  FiveDaysWeatherDataModel({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory FiveDaysWeatherDataModel.fromJson(Map<String, dynamic> json) {
    return FiveDaysWeatherDataModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => WeatherData.fromJson(e))
          .toList(),
      city: json['city'] != null ? City.fromJson(json['city']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'city': city?.toJson(),
    };
    if (list != null) {
      data['list'] = list!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class WeatherData {
  late String dateTimeText;
  late double temperature;

  WeatherData({
    required this.dateTimeText,
    required this.temperature,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      dateTimeText: json['dt_txt'],
      temperature: (json['main']['temp'] - 273.15), // Converting temperature from Kelvin to Celsius
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dt_txt': dateTimeText,
      'temp': temperature,
    };
  }
}

class City {
  late int id;
  late String name;
  late Coord coord;
  late String country;
  late int population;
  late int timezone;
  late int sunrise;
  late int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'coord': coord.toJson(),
      'country': country,
      'population': population,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }
}

class Coord {
  late double lat;
  late double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'],
      lon: json['lon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }
}
