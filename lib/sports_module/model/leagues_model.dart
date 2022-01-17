class LeaguesModel {
  List<Countrys>? countrys;

  LeaguesModel({this.countrys});

  LeaguesModel.fromJson(Map<String, dynamic> json) {
    if (json['countrys'] != null) {
      countrys = <Countrys>[];
      json['countrys'].forEach((v) {
        countrys!.add(new Countrys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countrys != null) {
      data['countrys'] = this.countrys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countrys {
  String? idLeague;
  String? idSoccerXML;
  String? idAPIfootball;
  String? strSport;
  String? strLeague;
  String? strLeagueAlternate;
  String? strDivision;
  String? idCup;
  String? strCurrentSeason;
  String? intFormedYear;
  String? dateFirstEvent;
  String? strGender;
  String? strCountry;
  String? strWebsite;
  String? strFacebook;
  String? strInstagram;
  String? strTwitter;
  String? strYoutube;
  String? strRSS;
  String? strDescriptionEN;
  String? strDescriptionDE;
  String? strDescriptionFR;
  String? strDescriptionIT;
  String? strDescriptionCN;
  String? strDescriptionJP;
  String? strDescriptionRU;
  String? strDescriptionES;
  String? strDescriptionPT;
  String? strDescriptionSE;
  String? strDescriptionNL;
  String? strDescriptionHU;
  String? strDescriptionNO;
  String? strDescriptionPL;
  String? strDescriptionIL;
  String? strTvRights;
  String? strFanart1;
  String? strFanart2;
  String? strFanart3;
  String? strFanart4;
  String? strBanner;
  String? strBadge;
  String? strLogo;
  String? strPoster;
  String? strTrophy;
  String? strNaming;
  String? strComplete;
  String? strLocked;

  Countrys(
      {this.idLeague,
        this.idSoccerXML,
        this.idAPIfootball,
        this.strSport,
        this.strLeague,
        this.strLeagueAlternate,
        this.strDivision,
        this.idCup,
        this.strCurrentSeason,
        this.intFormedYear,
        this.dateFirstEvent,
        this.strGender,
        this.strCountry,
        this.strWebsite,
        this.strFacebook,
        this.strInstagram,
        this.strTwitter,
        this.strYoutube,
        this.strRSS,
        this.strDescriptionEN,
        this.strDescriptionDE,
        this.strDescriptionFR,
        this.strDescriptionIT,
        this.strDescriptionCN,
        this.strDescriptionJP,
        this.strDescriptionRU,
        this.strDescriptionES,
        this.strDescriptionPT,
        this.strDescriptionSE,
        this.strDescriptionNL,
        this.strDescriptionHU,
        this.strDescriptionNO,
        this.strDescriptionPL,
        this.strDescriptionIL,
        this.strTvRights,
        this.strFanart1,
        this.strFanart2,
        this.strFanart3,
        this.strFanart4,
        this.strBanner,
        this.strBadge,
        this.strLogo,
        this.strPoster,
        this.strTrophy,
        this.strNaming,
        this.strComplete,
        this.strLocked});

  Countrys.fromJson(Map<String, dynamic> json) {
    idLeague = json['idLeague'];
    idSoccerXML = json['idSoccerXML'];
    idAPIfootball = json['idAPIfootball'];
    strSport = json['strSport'];
    strLeague = json['strLeague'];
    strLeagueAlternate = json['strLeagueAlternate'];
    strDivision = json['strDivision'];
    idCup = json['idCup'];
    strCurrentSeason = json['strCurrentSeason'];
    intFormedYear = json['intFormedYear'];
    dateFirstEvent = json['dateFirstEvent'];
    strGender = json['strGender'];
    strCountry = json['strCountry'];
    strWebsite = json['strWebsite'];
    strFacebook = json['strFacebook'];
    strInstagram = json['strInstagram'];
    strTwitter = json['strTwitter'];
    strYoutube = json['strYoutube'];
    strRSS = json['strRSS'];
    strDescriptionEN = json['strDescriptionEN'];
    strDescriptionDE = json['strDescriptionDE'];
    strDescriptionFR = json['strDescriptionFR'];
    strDescriptionIT = json['strDescriptionIT'];
    strDescriptionCN = json['strDescriptionCN'];
    strDescriptionJP = json['strDescriptionJP'];
    strDescriptionRU = json['strDescriptionRU'];
    strDescriptionES = json['strDescriptionES'];
    strDescriptionPT = json['strDescriptionPT'];
    strDescriptionSE = json['strDescriptionSE'];
    strDescriptionNL = json['strDescriptionNL'];
    strDescriptionHU = json['strDescriptionHU'];
    strDescriptionNO = json['strDescriptionNO'];
    strDescriptionPL = json['strDescriptionPL'];
    strDescriptionIL = json['strDescriptionIL'];
    strTvRights = json['strTvRights'];
    strFanart1 = json['strFanart1'];
    strFanart2 = json['strFanart2'];
    strFanart3 = json['strFanart3'];
    strFanart4 = json['strFanart4'];
    strBanner = json['strBanner'];
    strBadge = json['strBadge'];
    strLogo = json['strLogo'];
    strPoster = json['strPoster'];
    strTrophy = json['strTrophy'];
    strNaming = json['strNaming'];
    strComplete = json['strComplete'];
    strLocked = json['strLocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLeague'] = this.idLeague;
    data['idSoccerXML'] = this.idSoccerXML;
    data['idAPIfootball'] = this.idAPIfootball;
    data['strSport'] = this.strSport;
    data['strLeague'] = this.strLeague;
    data['strLeagueAlternate'] = this.strLeagueAlternate;
    data['strDivision'] = this.strDivision;
    data['idCup'] = this.idCup;
    data['strCurrentSeason'] = this.strCurrentSeason;
    data['intFormedYear'] = this.intFormedYear;
    data['dateFirstEvent'] = this.dateFirstEvent;
    data['strGender'] = this.strGender;
    data['strCountry'] = this.strCountry;
    data['strWebsite'] = this.strWebsite;
    data['strFacebook'] = this.strFacebook;
    data['strInstagram'] = this.strInstagram;
    data['strTwitter'] = this.strTwitter;
    data['strYoutube'] = this.strYoutube;
    data['strRSS'] = this.strRSS;
    data['strDescriptionEN'] = this.strDescriptionEN;
    data['strDescriptionDE'] = this.strDescriptionDE;
    data['strDescriptionFR'] = this.strDescriptionFR;
    data['strDescriptionIT'] = this.strDescriptionIT;
    data['strDescriptionCN'] = this.strDescriptionCN;
    data['strDescriptionJP'] = this.strDescriptionJP;
    data['strDescriptionRU'] = this.strDescriptionRU;
    data['strDescriptionES'] = this.strDescriptionES;
    data['strDescriptionPT'] = this.strDescriptionPT;
    data['strDescriptionSE'] = this.strDescriptionSE;
    data['strDescriptionNL'] = this.strDescriptionNL;
    data['strDescriptionHU'] = this.strDescriptionHU;
    data['strDescriptionNO'] = this.strDescriptionNO;
    data['strDescriptionPL'] = this.strDescriptionPL;
    data['strDescriptionIL'] = this.strDescriptionIL;
    data['strTvRights'] = this.strTvRights;
    data['strFanart1'] = this.strFanart1;
    data['strFanart2'] = this.strFanart2;
    data['strFanart3'] = this.strFanart3;
    data['strFanart4'] = this.strFanart4;
    data['strBanner'] = this.strBanner;
    data['strBadge'] = this.strBadge;
    data['strLogo'] = this.strLogo;
    data['strPoster'] = this.strPoster;
    data['strTrophy'] = this.strTrophy;
    data['strNaming'] = this.strNaming;
    data['strComplete'] = this.strComplete;
    data['strLocked'] = this.strLocked;
    return data;
  }
}