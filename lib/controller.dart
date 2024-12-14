import 'dart:convert';
import 'package:get/get.dart';
import 'package:weather_app/weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherController extends GetxController {
  final apiKey = "e91f0609102a45eb89681238241312";

  WeatherModel weather = WeatherModel();
  String City = "";

  Future<WeatherModel> getWeather([String city="karachi"]) async {
    String url =
        "https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      weather = WeatherModel.fromJson(body);

      update();
      return weather;
    } else {
      print("error");
      return throw Exception("Error");
    }
  }

  search(value) async {
    if (value.toString().isNotEmpty) {
      City = value;
    } else {
      City = "Karachi";
    }
    getWeather(City);
    update();
  }
  String time = "";


  dateTimeFunction(){
    DateTime dateTime = DateTime.parse(weather.location!.localtime.toString());
    return dateTime;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    search("Karachi");
    getWeather(City);
  }
}
