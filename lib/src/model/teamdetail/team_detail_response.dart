import 'package:json_annotation/json_annotation.dart';
part 'team_detail_response.g.dart';

@JsonSerializable()
class TeamDetailResponse {
  String idTeam;
  @JsonKey(name: "idSoccerXML")
  String idSoccerXml;
  String strTeam;
  String intFormedYear;
  String strLeague;
  String idLeague;
  String strManager;
  String strStadium;
  String strStadiumThumb;
  String strStadiumLocation;
  String intStadiumCapacity;
  String strWebsite;
  @JsonKey(name: "strDescriptionEN")
  String strDescription;
  String strCountry;
  String strTeamBadge;
  String strTeamJersey;
  String strTeamLogo;
  String strTeamFanart1;
  String strTeamFanart2;
  String strTeamFanart3;
  String strTeamFanart4;
  String strTeamBanner;

  TeamDetailResponse(
      {this.idTeam,
      this.idSoccerXml,
      this.strTeam,
      this.intFormedYear,
      this.strLeague,
      this.idLeague,
      this.strManager,
      this.strStadium,
      this.strStadiumThumb,
      this.strStadiumLocation,
      this.intStadiumCapacity,
      this.strWebsite,
      this.strDescription,
      this.strCountry,
      this.strTeamBadge,
      this.strTeamJersey,
      this.strTeamLogo,
      this.strTeamFanart1,
      this.strTeamFanart2,
      this.strTeamFanart3,
      this.strTeamFanart4,
      this.strTeamBanner});

  @override
  String toString() {
    return 'TeamDetail{idTeam: $idTeam, idSoccerXml: $idSoccerXml, strTeam: $strTeam, intFormedYear: $intFormedYear, strLeague: $strLeague, idLeague: $idLeague, strManager: $strManager, strStadium: $strStadium, strStadiumThumb: $strStadiumThumb, strStadiumLocation: $strStadiumLocation, intStadiumCapacity: $intStadiumCapacity, strWebsite: $strWebsite, strDescription: $strDescription, strCountry: $strCountry, strTeamBadge: $strTeamBadge, strTeamJersey: $strTeamJersey, strTeamLogo: $strTeamLogo, strTeamFanart1: $strTeamFanart1, strTeamFanart2: $strTeamFanart2, strTeamFanart3: $strTeamFanart3, strTeamFanart4: $strTeamFanart4, strTeamBanner: $strTeamBanner}';
  }

  factory TeamDetailResponse.fromJson(Map<String, dynamic> json) => _$TeamDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TeamDetailResponseToJson(this);

}
