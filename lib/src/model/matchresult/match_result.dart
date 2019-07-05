/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 6/29/19 7:50 PM
 */

import 'package:json_annotation/json_annotation.dart';
part 'match_result.g.dart';

@JsonSerializable()
class MatchResult {
  String strLeague;
  String strEvent;
  String strHomeTeam;
  String strAwayTeam;
  String intHomeScore;
  String intAwayScore;
  String strLogoHomeTeam;
  String strLogoAwayTeam;

  MatchResult(
      {this.strLeague,
      this.strEvent,
      this.strHomeTeam,
      this.strAwayTeam,
      this.intHomeScore,
      this.intAwayScore,
      this.strLogoHomeTeam,
      this.strLogoAwayTeam});

  @override
  String toString() {
    return 'MatchResult{strLeague: $strLeague, strEvent: $strEvent, strHomeTeam: $strHomeTeam, strAwayTeam: $strAwayTeam, intHomeScore: $intHomeScore, intAwayScore: $intAwayScore, strLogoHomeTeam: $strLogoHomeTeam, strLogoAwayTeam: $strLogoAwayTeam}';
  }

  factory MatchResult.fromJson(Map<String, dynamic> json) => _$MatchResultFromJson(json);

  Map<String, dynamic> toJson() => _$MatchResultToJson(this);
}
