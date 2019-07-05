/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 6/29/19 10:26 PM
 */

import 'package:dio/dio.dart';
import 'package:millenial_soccer/src/model/matchresult/match_result_response.dart';
import 'package:millenial_soccer/src/model/teamdetail/team_detail_response.dart';

class SportApiProvider {
  Dio dio = Dio();
  final _baseUrl = "https://www.thesportsdb.com/api/v1/json";

  Future<MatchResultResponse> getMatchResultByDate(String strDate) async {
    String url = "$_baseUrl/1/eventsday.php?d=$strDate&s=soccer";
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return MatchResultResponse.fromJson(response.data);
    } else {
      throw Exception("Failed to get match result by date");
    }
  }

  Future<TeamDetailResponse> getTeamDetailById(String id) async {
    String url = "$_baseUrl/1/lookupteam.php?id=$id";
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return TeamDetailResponse.fromJson(response.data);
    } else {
      throw Exception("Failed to get team detail by id");
    }
  }
}