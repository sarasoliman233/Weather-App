
import 'package:dio/dio.dart';
import 'package:weather_app/models/WeatherModel.dart';

class WeatherServices{
final Dio dio;
final String baseUrl="http://api.weatherapi.com/v1";
final apiKey="3677bed892474b30b7a122242220806";
  WeatherServices(this.dio);
 Future<WeatherModel>getCurrentWeather({required String cityName})async{
  try {
    Response response= await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    WeatherModel weatherModel=WeatherModel.fromJson(response.data);
    print('imagggggge${weatherModel.image}');
    return weatherModel;

  } on DioException catch (e) {
    final errorMessage= e.response?.data['error']['message'] ?? 'opps!';
    throw Exception(errorMessage);
  }catch(e){
   // log(e.toString());
    throw Exception('khs');
  }

}

}