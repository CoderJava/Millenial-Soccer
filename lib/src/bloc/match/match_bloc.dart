import 'package:millenial_soccer/src/model/matchresult/match_result.dart';
import 'package:millenial_soccer/src/model/matchresult/match_result_response.dart';
import 'package:millenial_soccer/src/resources/sport/sport_api_repository.dart';

class MatchBloc {
  final _sportApiRepository = SportApiRepository();

  dispose() {
    // TODO: do something in here
  }

  Future<List<MatchResult>> getMatchToday(String strDate) async {
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
    return listMatchResult;
  }
}
