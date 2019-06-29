import 'package:json_annotation/json_annotation.dart';
part 'match_result_response.g.dart';

@JsonSerializable()
class MatchResultResponse {
  @JsonKey(name: "events")
  List<MatchResultItem> listMatchResults;

  MatchResultResponse({this.listMatchResults});

  @override
  String toString() {
    return 'MatchResultResponse{listMatchResults: $listMatchResults}';
  }

  factory MatchResultResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MatchResultResponseToJson(this);
}

@JsonSerializable()
class MatchResultItem {
  String idEvent;
  String idSoccerXml;
  String strEvent;
  String strFilename;
  String strSport;
  String idLeague;
  String strLeague;
  String strSeason;
  @JsonKey(name: "strDescriptionEN")
  String strDescriptionEn;
  String strHomeTeam;
  String strAwayTeam;
  String intHomeScore;
  String intRound;
  String intAwayScore;
  String idHomeTeam;
  String idAwayTeam;

  MatchResultItem(
      {this.idEvent,
      this.idSoccerXml,
      this.strEvent,
      this.strFilename,
      this.strSport,
      this.idLeague,
      this.strLeague,
      this.strSeason,
      this.strDescriptionEn,
      this.strHomeTeam,
      this.strAwayTeam,
      this.intHomeScore,
      this.intRound,
      this.intAwayScore,
      this.idHomeTeam,
      this.idAwayTeam});

  @override
  String toString() {
    return 'MatchResultItem{idEvent: $idEvent, idSoccerXml: $idSoccerXml, strEvent: $strEvent, strFilename: $strFilename, strSport: $strSport, idLeague: $idLeague, strLeague: $strLeague, strSeason: $strSeason, strDescriptionEn: $strDescriptionEn, strHomeTeam: $strHomeTeam, strAwayTeam: $strAwayTeam, intHomeScore: $intHomeScore, intRound: $intRound, intAwayScore: $intAwayScore, idHomeTeam: $idHomeTeam, idAwayTeam: $idAwayTeam}';
  }

  factory MatchResultItem.fromJson(Map<String, dynamic> json) => _$MatchResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$MatchResultItemToJson(this);
}
