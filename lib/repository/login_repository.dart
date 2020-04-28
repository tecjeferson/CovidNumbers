import 'package:covidenumbers/model/api.dart';
import 'package:covidenumbers/utils/custom_dio.dart';
import 'package:dio/dio.dart';

import 'dart:convert';

class LoginRepository {
  Future<List<CovidModel>> findAll() async {
    var dio = CustomDio.withAuthentication().instance;
    try {
      var response = await dio
          .get('https://covid-19-data.p.rapidapi.com/country/code?code=br');
      return (response.data as List)
          .map((item) => CovidModel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
  // Future<List<CovidModel>> findAll() {
  //   var dio = CustomDio.withAuthentication().instance;

  //   return dio //.get('https://covid-19-data.p.rapidapi.com/totals')
  //       .get('https://covid-19-data.p.rapidapi.com/country/code?code=br')
  //       .then((res) {
  //     print('Resultado LoginRepository ${res.data}');

  //     return res.data.map<CovidModel>((c) => CovidModel.fromMap(c)).toList()
  //         as List<CovidModel>;
  //   });
  // }

}
