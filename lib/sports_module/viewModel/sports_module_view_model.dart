import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:the_sports_db/sports_module/model/countries_model.dart';
import 'package:the_sports_db/sports_module/model/leagues_model.dart';
import 'package:the_sports_db/sports_module/model/sports_model.dart';
import 'package:the_sports_db/sports_module/service/sports_module_api_service.dart';
import 'package:the_sports_db/utils/app_constants/constants.dart';

class SportsModuleViewModel extends ChangeNotifier {
  CountriesModel? countriesModel;
  LeaguesModel? leaguesModel;
  SportsModel? sportsModel;
  ApiStateTracker apiStateTracker = ApiStateTracker.Loading;
  SportsModuleApiService _sportsModuleApiService = SportsModuleApiService();

  //Method to getCountriesList viewmodel----------------------
  void getCountriesList() async {
    apiStateTracker = ApiStateTracker.Loading;
    final _data = await _sportsModuleApiService.fetchCountriesList();

    if (_data != null &&
        _data.countries != null &&
        _data.countries!.isNotEmpty) {
      this.countriesModel = _data;
      apiStateTracker = ApiStateTracker.HasData;
    } else {
      apiStateTracker = ApiStateTracker.NoData;
    }

    notifyListeners();
  }

  //Method to getSportsListList viewmodel--------------------------------
  Future<void> getSportsListList() async {
    final _data = await _sportsModuleApiService.fetchSportsList();

    if (_data != null && _data.sports != null && _data.sports!.isNotEmpty) {
      sportsModel = _data;
    }
  }

  //Method to getLeaguesListOfCountries viewmodel----------------------------
  void getLeaguesListOfCountries({required String countryName}) async {
    apiStateTracker = ApiStateTracker.Loading;
    await this.getSportsListList();

    final _data = await _sportsModuleApiService.fetchLeaguesListOfCountries(
        countryName: countryName);
    if (_data != null && _data.countrys != null && _data.countrys!.isNotEmpty) {
      this.leaguesModel = _data;
      apiStateTracker = ApiStateTracker.HasData;
    } else {
      apiStateTracker = ApiStateTracker.NoData;
    }

    notifyListeners();
  }

  //Method to getBackgroundImage viewmodel------------------------------------------
  String? getBackgroundImage({String? strSport}) {
    if (this.sportsModel != null && this.sportsModel!.sports!.isNotEmpty) {
      Sports sports = this
          .sportsModel!
          .sports!
          .firstWhere((element) => element.strSport == strSport);
      return sports.strSportThumb;
    } else {
      return null;
    }
  }

  //Method to getFilteredLeaguesListOfCountries viewmodel------------------------
  void getFilteredLeaguesListOfCountries(
      {required String countryName, required String league}) async {
    apiStateTracker = ApiStateTracker.Loading;
    final _data =
        await _sportsModuleApiService.fetchFilteredLeaguesListOfCountries(
            countryName: countryName, league: league);
    if (_data != null && _data.countrys != null && _data.countrys!.isNotEmpty) {
      this.leaguesModel = _data;
      print("leaguesModel");
      print(leaguesModel);
      apiStateTracker = ApiStateTracker.HasData;
    } else {
      apiStateTracker = ApiStateTracker.NoData;
    }

    notifyListeners();
  }
}
