/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 6/29/19 7:50 PM
 */

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchResult _$MatchResultFromJson(Map<String, dynamic> json) {
  return MatchResult(
      strLeague: json['strLeague'] as String,
      strEvent: json['strEvent'] as String,
      strHomeTeam: json['strHomeTeam'] as String,
      strAwayTeam: json['strAwayTeam'] as String,
      intHomeScore: json['intHomeScore'] as String,
      intAwayScore: json['intAwayScore'] as String,
      strLogoHomeTeam: json['strLogoHomeTeam'] as String,
      strLogoAwayTeam: json['strLogoAwayTeam'] as String);
}

Map<String, dynamic> _$MatchResultToJson(MatchResult instance) =>
    <String, dynamic>{
      'strLeague': instance.strLeague,
      'strEvent': instance.strEvent,
      'strHomeTeam': instance.strHomeTeam,
      'strAwayTeam': instance.strAwayTeam,
      'intHomeScore': instance.intHomeScore,
      'intAwayScore': instance.intAwayScore,
      'strLogoHomeTeam': instance.strLogoHomeTeam,
      'strLogoAwayTeam': instance.strLogoAwayTeam
    };
