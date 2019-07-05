import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:millenial_soccer/src/bloc/match/match_bloc.dart';
import 'package:millenial_soccer/src/model/matchresult/match_result.dart';
import 'package:millenial_soccer/src/utils/utils.dart';
import 'package:millenial_soccer/values/color_assets.dart';

class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  MatchBloc _matchBloc;

  @override
  void initState() {
    _matchBloc = MatchBloc();
    super.initState();
  }

  @override
  void dispose() {
    _matchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Match"),
        ),
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: FutureBuilder(
          future: _matchBloc.getMatchToday(strDate),
          builder: (BuildContext context,
              AsyncSnapshot<List<MatchResult>> snapshot) {
            if (snapshot.hasData) {
              var matchResultResponse = snapshot.data;
              String strDateTitle =
                  DateFormat("dd MMMM yyyy").format(DateTime.now());
              return Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        strDateTitle,
                        style: Theme.of(context).textTheme.title.merge(
                              TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: matchResultResponse.length,
                      itemBuilder: (context, index) {
                        var matchResultItem = matchResultResponse[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    matchResultItem.strLeague,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    matchResultItem.strEvent,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorAssets.primaryTextColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16.0,
                                      top: 12.0,
                                      right: 16.0,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        FadeInImage(
                                          placeholder: AssetImage(
                                              "assets/image/img_placeholder.jpg"),
                                          image: NetworkImage(
                                              matchResultItem.strLogoHomeTeam),
                                          fit: BoxFit.fill,
                                          width: 48.0,
                                          height: 48.0,
                                        ),
                                        _buildWidgetTextScore(matchResultItem),
                                        FadeInImage(
                                          placeholder: AssetImage(
                                              "assets/image/img_placeholder.jpg"),
                                          image: NetworkImage(
                                              matchResultItem.strLogoAwayTeam),
                                          fit: BoxFit.fill,
                                          width: 48.0,
                                          height: 48.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }
            return Center(child: buildCircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildWidgetTextScore(MatchResult matchResultItem) {
    if (matchResultItem.intHomeScore.isEmpty ||
        matchResultItem.intAwayScore.isEmpty) {
      return Expanded(
        child: Text(
          "Coming soon",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Expanded(
          child: Text(matchResultItem.intHomeScore +
              " - " +
              matchResultItem.intAwayScore));
    }
  }
}
