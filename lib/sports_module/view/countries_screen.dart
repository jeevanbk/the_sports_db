import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_sports_db/sports_module/viewModel/sports_module_view_model.dart';
import 'package:the_sports_db/utils/app_constants/constants.dart';
import 'package:the_sports_db/utils/resources/color_constants.dart';
import 'package:the_sports_db/utils/services/navigation_handler_service.dart';

class CountriesScreen extends StatefulWidget {
  final String appName;

  CountriesScreen({Key? key, required this.appName}) : super(key: key);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  late SportsModuleViewModel _viewModel;
  var _mainHeight;
  var _mainWidth;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<SportsModuleViewModel>(context, listen: false);
    _viewModel.getCountriesList();
  }

  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height;
    _mainWidth = MediaQuery.of(context).size.width;

    return Scaffold(body: Consumer<SportsModuleViewModel>(
      builder: (context, value, child) {
        return value.apiStateTracker == ApiStateTracker.Loading
            ? Center(child: CircularProgressIndicator())
            : value.apiStateTracker == ApiStateTracker.HasData
                ? Container(
                    padding: EdgeInsets.only(
                        left: _mainWidth * 0.08, right: _mainWidth * 0.08),
                    height: _mainHeight,
                    width: _mainWidth,
                    color: AppColor.themeColor,
                    child: SingleChildScrollView(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: _mainHeight * 0.15),
                            child: Text(
                              widget.appName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _mainHeight * 0.1,
                          ),
                          Container(

                            height: _mainHeight * 0.8,
                            padding: EdgeInsets.only(bottom:_mainHeight*0.12),
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                var data =
                                    value.countriesModel!.countries![index];
                                return GestureDetector(
                                  onTap: () async{

                                    Navigator.of(context).pushNamed(
                                        AppRoutes.countriesScreen,
                                        arguments: data.nameEn);
                                  },
                                  child: Container(
                                    height: _mainHeight * 0.05,

                                    decoration:
                                        BoxDecoration(
                                            color: AppColor.countryColor,
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: _mainWidth*0.74,
                                           padding: EdgeInsets.only(
                                              left: _mainWidth * 0.02),
                                          child: Text(
                                            data.nameEn.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22,

                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: _mainWidth * 0.02,
                                          ),
                                          child: SvgPicture.asset(
                                            'assets/images/arrow_right.svg',
                                            height: _mainHeight * 0.030,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: value.countriesModel!.countries!.length ,
                              separatorBuilder: (context, index) => SizedBox(
                                height: _mainHeight * 0.04,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      child: Text('No Data Found...'),
                    ),
                  );
      },
    ));
  }
}
