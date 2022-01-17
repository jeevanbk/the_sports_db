import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:the_sports_db/sports_module/model/countries_model.dart';
import 'package:the_sports_db/sports_module/model/leagues_model.dart';
import 'package:the_sports_db/sports_module/model/sports_model.dart';
import 'dart:io';
import 'package:the_sports_db/utils/resources/uri_endpoints.dart';
import 'dart:ui';

class SportsModuleApiService {

  String _baseUrl = UriEndpoints.baseUrl;               //BASEURL

//fetchCountriesList api call----------------------------------
  Future<CountriesModel?> fetchCountriesList() async {
    String url = UriEndpoints.countriesListUrl;

    try {
      final response = await http.get(
        Uri.https(_baseUrl, url),
      );
      dynamic data = _response(response);

      return data != null ? CountriesModel.fromJson(data) : null;
    } on SocketException {
      log('SocketException Occurred');
    } catch (e) {
      log('Error : ${e.toString()}');
    }
    return null;
  }

  //fetchSportsList api call-------------------------------------
  Future<SportsModel?> fetchSportsList() async {
    String url = UriEndpoints.allSportsListUrl;

    try {
      final response = await http.get(
        Uri.https(_baseUrl, url),
      );
      dynamic data = _response(response);

      return data != null ? SportsModel.fromJson(data) : null;
    } on SocketException {
      log('SocketException Occurred');
    } catch (e) {
      log('Error : ${e.toString()}');
    }
    return null;
  }

//fetchLeaguesListOfCountries api call -------------------------------------
  Future<LeaguesModel?> fetchLeaguesListOfCountries(
      {required String countryName}) async {
    String url = UriEndpoints.leaguesListUrl;

    try {
      Map<String, dynamic> queryParams = {'c': '$countryName'};

      final response = await http.get(
        Uri.https(_baseUrl, url, queryParams),
      );
      dynamic data = _response(response);

      return data != null ? LeaguesModel.fromJson(data) : null;
    } on SocketException {
      log('SocketException Occurred');
    } catch (e) {
      log('Error : ${e.toString()}');
    }
    return null;
  }

//fetchFilteredLeaguesListOfCountries api call------------------------------------
  Future<LeaguesModel?> fetchFilteredLeaguesListOfCountries(
      {required String countryName, required String league}) async {
    String url = UriEndpoints.leaguesListUrl;

    try {
      Map<String, dynamic> queryParams = {'c': '$countryName', 's': '$league'};

      final response = await http.get(
        Uri.https(_baseUrl, url, queryParams),
      );
      dynamic data = _response(response);

      return data != null ? LeaguesModel.fromJson(data) : null;
    } on SocketException {
      log('SocketException Occurred');
    } catch (e) {
      log('Error : ${e.toString()}');
    }
    return null;
  }

//reponse handling-----------------------------------------------
  dynamic _response(http.Response data) {
    log('Status Code :: ${data.statusCode}');
    if (data.statusCode == 200) {
      if (data.body.isNotEmpty) {
        log('Response From Api ${jsonDecode(data.body)}');
        return jsonDecode(data.body);
      }
    } else if (data.statusCode == 400)
      log('Error : ${data.statusCode.toString()}');
    else if (data.statusCode == 401)
      log('Error : ${data.statusCode.toString()}');
    else if (data.statusCode == 402)
      log('Error : ${data.statusCode.toString()}');
    else if (data.statusCode == 405)
      log('Error : ${data.statusCode.toString()}');
    else if (data.statusCode == 415)
      log('Error : ${data.statusCode.toString()}');
    else if (data.statusCode == 500)
      log('Error : ${data.statusCode.toString()}');
    return null;
  }
}
