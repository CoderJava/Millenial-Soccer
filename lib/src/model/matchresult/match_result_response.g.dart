// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchResultResponse _$MatchResultResponseFromJson(Map<String, dynamic> json) {
  return MatchResultResponse(
      listMatchResults: (json['events'] as List)
          ?.map((e) => e == null
              ? null
              : MatchResultItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MatchResultResponseToJson(
        MatchResultResponse instance) =>
    <String, dynamic>{'events': instance.listMatchResults};

MatchResultItem _$MatchResultItemFromJson(Map<String, dynamic> json) {
  return MatchResultItem(
      idEvent: json['idEvent'] as String,
      idSoccerXml: json['idSoccerXml'] as String,
      strEvent: json['strEvent'] as String,
      strFilename: json['strFilename'] as String,
      strSport: json['strSport'] as String,
      idLeague: json['idLeague'] as String,
      strLeague: json['strLeague'] as String,
      strSeason: json['strSeason'] as String,
      strDescriptionEn: json['strDescriptionEN'] as String,
      strHomeTeam: json['strHomeTeam'] as String,
      strAwayTeam: json['strAwayTeam'] as String,
      intHomeScore: json['intHomeScore'] as String,
      intRound: json['intRound'] as String,
      intAwayScore: json['intAwayScore'] as String,
      idHomeTeam: json['idHomeTeam'] as String,
      idAwayTeam: json['idAwayTeam'] as String);
}

Map<String, dynamic> _$MatchResultItemToJson(MatchResultItem instance) =>
    <String, dynamic>{
      'idEvent': instance.idEvent,
      'idSoccerXml': instance.idSoccerXml,
      'strEvent': instance.strEvent,
      'strFilename': instance.strFilename,
      'strSport': instance.strSport,
      'idLeague': instance.idLeague,
      'strLeague': instance.strLeague,
      'strSeason': instance.strSeason,
      'strDescriptionEN': instance.strDescriptionEn,
      'strHomeTeam': instance.strHomeTeam,
      'strAwayTeam': instance.strAwayTeam,
      'intHomeScore': instance.intHomeScore,
      'intRound': instance.intRound,
      'intAwayScore': instance.intAwayScore,
      'idHomeTeam': instance.idHomeTeam,
      'idAwayTeam': instance.idAwayTeam
    };
