/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 6/29/19 9:44 PM
 */

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamDetailResponse _$TeamDetailResponseFromJson(Map<String, dynamic> json) {
  return TeamDetailResponse(
      listTeamDetails: (json['teams'] as List)
          ?.map((e) => e == null
              ? null
              : ItemTeamDetailResponse.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TeamDetailResponseToJson(TeamDetailResponse instance) =>
    <String, dynamic>{'teams': instance.listTeamDetails};

ItemTeamDetailResponse _$ItemTeamDetailResponseFromJson(
    Map<String, dynamic> json) {
  return ItemTeamDetailResponse(
      idTeam: json['idTeam'] as String,
      idSoccerXml: json['idSoccerXML'] as String,
      strTeam: json['strTeam'] as String,
      intFormedYear: json['intFormedYear'] as String,
      strLeague: json['strLeague'] as String,
      idLeague: json['idLeague'] as String,
      strManager: json['strManager'] as String,
      strStadium: json['strStadium'] as String,
      strStadiumThumb: json['strStadiumThumb'] as String,
      strStadiumLocation: json['strStadiumLocation'] as String,
      intStadiumCapacity: json['intStadiumCapacity'] as String,
      strWebsite: json['strWebsite'] as String,
      strDescription: json['strDescriptionEN'] as String,
      strCountry: json['strCountry'] as String,
      strTeamBadge: json['strTeamBadge'] as String,
      strTeamJersey: json['strTeamJersey'] as String,
      strTeamLogo: json['strTeamLogo'] as String,
      strTeamFanart1: json['strTeamFanart1'] as String,
      strTeamFanart2: json['strTeamFanart2'] as String,
      strTeamFanart3: json['strTeamFanart3'] as String,
      strTeamFanart4: json['strTeamFanart4'] as String,
      strTeamBanner: json['strTeamBanner'] as String);
}

Map<String, dynamic> _$ItemTeamDetailResponseToJson(
        ItemTeamDetailResponse instance) =>
    <String, dynamic>{
      'idTeam': instance.idTeam,
      'idSoccerXML': instance.idSoccerXml,
      'strTeam': instance.strTeam,
      'intFormedYear': instance.intFormedYear,
      'strLeague': instance.strLeague,
      'idLeague': instance.idLeague,
      'strManager': instance.strManager,
      'strStadium': instance.strStadium,
      'strStadiumThumb': instance.strStadiumThumb,
      'strStadiumLocation': instance.strStadiumLocation,
      'intStadiumCapacity': instance.intStadiumCapacity,
      'strWebsite': instance.strWebsite,
      'strDescriptionEN': instance.strDescription,
      'strCountry': instance.strCountry,
      'strTeamBadge': instance.strTeamBadge,
      'strTeamJersey': instance.strTeamJersey,
      'strTeamLogo': instance.strTeamLogo,
      'strTeamFanart1': instance.strTeamFanart1,
      'strTeamFanart2': instance.strTeamFanart2,
      'strTeamFanart3': instance.strTeamFanart3,
      'strTeamFanart4': instance.strTeamFanart4,
      'strTeamBanner': instance.strTeamBanner
    };
