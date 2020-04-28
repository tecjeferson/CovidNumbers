import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio();
  }

  CustomDio.withAuthentication() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onResquest, onResponse: _onResponse, onError: _onError));
  }

  Dio get instance => _dio;

  _onResquest(RequestOptions options) async {
    //SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('040b40a681msh8c429f45bd58853p11317ajsnd2a8e6a221a9');
    options.connectTimeout = 5000;
    options.headers = {
      "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
      "x-rapidapi-key": "040b40a681msh8c429f45bd58853p11317ajsnd2a8e6a221a9",
      "content-type": "application/json"
    };
  }

  _onError(DioError e) {
    print('##################### Errror');
    return e;
  }

  _onResponse(Response e) {
    print('##################### Response Log');
    print(e.data);
    print('##################### Response Log');
  }
}
