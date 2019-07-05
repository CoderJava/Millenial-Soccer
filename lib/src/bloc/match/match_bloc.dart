/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 7/5/19 11:53 AM
 */

import 'package:millenial_soccer/src/model/matchresult/match_result.dart';
import 'package:millenial_soccer/src/model/matchresult/match_result_response.dart';
import 'package:millenial_soccer/src/resources/sport/sport_api_repository.dart';
import 'package:rxdart/rxdart.dart';

class MatchBloc {
  final _sportApiRepository = SportApiRepository();
  final _publishSubjectMatchResult = PublishSubject<List<MatchResult>>();

  dispose() {
    _publishSubjectMatchResult.close();
  }

  Observable<List<MatchResult>> get matchResult => _publishSubjectMatchResult.stream;

  getMatchResultByDate(String strDate) async {
    _publishSubjectMatchResult.sink.add(null);
    List<MatchResult> listMatchResult = [];
    MatchResultResponse matchResultResponse =
        await _sportApiRepository.getMatchResultByDate(strDate);
    int counter = 0;
    for (MatchResultItem matchResultItem in matchResultResponse.listMatchResults) {
      if (counter == 10) {
        break;
      }
      String idHomeTeam = matchResultItem.idHomeTeam;
      String idAwayTeam = matchResultItem.idAwayTeam;
      String strHomeTeam = matchResultItem.strHomeTeam;
      String strAwayTeam = matchResultItem.strAwayTeam;
      if (idHomeTeam == null || idAwayTeam == null || idHomeTeam.isEmpty || idAwayTeam.isEmpty) {
        continue;
      } else if (strHomeTeam == null || strAwayTeam == null || strHomeTeam.isEmpty || strAwayTeam.isEmpty) {
        continue;
      }
      var teamDetailHomeResponse = await _sportApiRepository.getTeamDetailById(idHomeTeam);
      var teamDetailAwayResponse = await _sportApiRepository.getTeamDetailById(idAwayTeam);
      var matchResult = MatchResult(
        strLeague: matchResultItem.strLeague,
        strEvent: matchResultItem.strEvent,
        strHomeTeam: strHomeTeam,
        strAwayTeam: strAwayTeam,
        intHomeScore: matchResultItem.intHomeScore ?? "",
        intAwayScore: matchResultItem.intAwayScore ?? "",
        strLogoHomeTeam: teamDetailHomeResponse.listTeamDetails[0].strTeamBadge ?? "",
        strLogoAwayTeam: teamDetailAwayResponse.listTeamDetails[0].strTeamBadge ?? "",
      );
      listMatchResult.add(matchResult);
      counter++;
    }
    _publishSubjectMatchResult.sink.add(listMatchResult);
  }
}
