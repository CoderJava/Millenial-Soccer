/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 6/29/19 9:47 PM
 */

import 'package:millenial_soccer/src/model/matchresult/match_result_response.dart';
import 'package:millenial_soccer/src/model/teamdetail/team_detail_response.dart';

import 'sport_api_provider.dart';

class SportApiRepository {
  final _sportApiProvider = SportApiProvider();

  Future<MatchResultResponse> getMatchResultByDate(String strDate) =>
      _sportApiProvider.getMatchResultByDate(strDate);

  Future<TeamDetailResponse> getTeamDetailById(String id) => _sportApiProvider.getTeamDetailById(id);
}
