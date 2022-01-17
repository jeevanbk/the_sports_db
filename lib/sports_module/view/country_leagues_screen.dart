import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_sports_db/sports_module/viewModel/sports_module_view_model.dart';
import 'package:the_sports_db/utils/app_constants/constants.dart';
import 'package:the_sports_db/utils/resources/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CountryLeaguesScreen extends StatefulWidget {
  late final String countryName;

  CountryLeaguesScreen({Key? key, required this.countryName}) : super(key: key);

  @override
  _CountryLeaguesScreenState createState() => _CountryLeaguesScreenState();
}

class _CountryLeaguesScreenState extends State<CountryLeaguesScreen> {
  late SportsModuleViewModel _viewModel;
  var _mainHeight;
  var _mainWidth;
  final _leagueNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<SportsModuleViewModel>(context, listen: false);
    _viewModel.getLeaguesListOfCountries(countryName: widget.countryName);
  }

  @override
  void dispose() {
    super.dispose();
    _leagueNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height;
    _mainWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        height: _mainHeight,
        width: _mainWidth,
        padding: EdgeInsets.only(
          left: _mainWidth * 0.04,
          right: _mainWidth * 0.04,
          top: _mainHeight * 0.025,
        ),
        child: ListView(
          children: [
            getSearchBox(),
            SizedBox(
              height: _mainHeight * 0.02,
            ),
            Consumer<SportsModuleViewModel>(
              builder: (context, value, child) {
                return value.apiStateTracker == ApiStateTracker.Loading
                    ? Center(child: CircularProgressIndicator())
                    : value.apiStateTracker == ApiStateTracker.HasData
                        ? Container(
                            child: getLeaguesList(viewModel: value),
                          )
                        : Center(
                            child: Text('No Data Found'),
                          );
              },
            )
          ],
        ),
      ),
    );
  }

  //appBar--------------------------------
  AppBar getAppBar() {
    return AppBar(
      toolbarHeight: _mainHeight * 0.1,
      backgroundColor: AppColor.themeColor,
      title: Padding(
        padding: EdgeInsets.only(top: _mainHeight * 0.05),
        child: Text(widget.countryName),
      ),
      titleSpacing: 2,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Padding(
          padding: EdgeInsets.only(
              top: _mainHeight * 0.058, bottom: _mainHeight * 0.01),
          child: SvgPicture.asset(
            'assets/images/arrow_left.svg',
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  //SearchBar----------------------------
  Widget getSearchBox() {
    return Container(
      width: _mainWidth,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: _mainWidth * 0.78,
            height: _mainHeight * 0.06,
            padding: EdgeInsets.only(
              top: _mainHeight * 0.02,
              left: _mainWidth * 0.02,
            ),
            child: TextFormField(
              controller: _leagueNameController,
              decoration: InputDecoration.collapsed(
                hintText: 'Search leagues...',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey.shade500),
              ),
              onChanged: (value) async {
                if (_leagueNameController.text == " ") {
                  _leagueNameController.clear();
                }
                if (_leagueNameController.text.length == 0) {
                  _viewModel.getLeaguesListOfCountries(
                      countryName: widget.countryName);
                } else {
                  _viewModel.getFilteredLeaguesListOfCountries(
                      countryName: widget.countryName,
                      league: _leagueNameController.text);
                  setState(() {});
                }
              },
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            ),
          ),
          _leagueNameController.text.trim().isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    _leagueNameController.clear();

                    _viewModel.getLeaguesListOfCountries(
                        countryName: widget.countryName);
                    setState(() {});
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : Container(),
        ],
      ),
    );
  }

  //LeaguesList----------------------------
  Widget getLeaguesList({required SportsModuleViewModel viewModel}) {
    return Container(
      height: _mainHeight * 0.70,
      child: ListTileTheme.merge(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var data = viewModel.leaguesModel!.countrys![index];
            return Container(
              height: _mainHeight * 0.13,
              width: _mainWidth,
              padding: EdgeInsets.only(
                  left: _mainWidth * 0.035, top: _mainHeight * 0.02),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: _viewModel.getBackgroundImage(
                                strSport: data.strSport) !=
                            null
                        ? NetworkImage(
                            _viewModel
                                .getBackgroundImage(strSport: data.strSport)
                                .toString(),
                          )
                        : NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/12/29/18/44/background-1939128_1280.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      data.strLeague.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: _mainWidth,

                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: _mainWidth * 0.04),
                      //color: Colors.yellow,
                      child: data.strLogo != null && data.strLogo!.isNotEmpty
                          ? Image.network(
                              data.strLogo.toString(),
                              height: _mainHeight * 0.05,
                              width: _mainWidth * 0.2,
                              // fit: BoxFit.fitWidth,
                            )
                          : SizedBox(
                              height: _mainHeight * 0.05,
                            ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: _mainHeight * 0.005),
                      width: _mainWidth * 0.25,
                      child: Row(
                        children: [
                          data.strTwitter != null && data.strTwitter!.isNotEmpty
                              ? GestureDetector(
                                  onTap: () async {
                                    bool canLaunchTwitter = await canLaunch(
                                        "https://" +
                                            data.strTwitter.toString());
                                    log(canLaunchTwitter.toString());
                                    try {
                                      await launch("https://" +
                                          data.strTwitter.toString());
                                    } catch (e) {
                                      log("Error While Launching :: ${e.toString()}");
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/twitter.svg',
                                    height: _mainHeight * 0.03,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            width: _mainWidth * 0.03,
                          ),
                          data.strFacebook != null &&
                                  data.strFacebook!.isNotEmpty
                              ? GestureDetector(
                                  onTap: () async {
                                    bool canLaunchFacebook = await canLaunch(
                                        "https://" +
                                            data.strFacebook.toString());
                                    log(canLaunchFacebook.toString());
                                    try {
                                      await launch("https://" +
                                          data.strFacebook.toString());
                                    } catch (e) {
                                      log("Error While Launching :: ${e.toString()}");
                                    }
                                  },
                                  child: SvgPicture.asset(
                                      'assets/images/facebook.svg',
                                      height: _mainHeight * 0.03,
                                      color: Colors.white),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: viewModel.leaguesModel!.countrys!.length,
          separatorBuilder: (context, index) => SizedBox(
            height: _mainHeight * 0.025,
          ),
        ),
      ),
    );
  }
}
