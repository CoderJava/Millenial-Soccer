/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 7/5/19 12:11 PM
 */

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  DateTime _selectedDate = DateTime.now();
  MatchBloc _matchBloc;

  @override
  void initState() {
    _matchBloc = MatchBloc();
    _doLoadDataMatch();
    super.initState();
  }

  void _doLoadDataMatch() {
    String strDate = DateFormat("yyyy-MM-dd").format(_selectedDate);
    _matchBloc.getMatchResultByDate(strDate);
  }

  @override
  void dispose() {
    _matchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Match"),
        ),
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: StreamBuilder(
          stream: _matchBloc.matchResult,
          builder: (BuildContext context,
              AsyncSnapshot<List<MatchResult>> snapshot) {
            if (snapshot.hasData) {
              var matchResultResponse = snapshot.data;
              DateFormat("dd MMMM yyyy").format(DateTime.now());
              return _buildWidgetContent(context, matchResultResponse);
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

  Widget _buildWidgetContent(
      BuildContext context, List<MatchResult> matchResultResponse) {
    return Column(
      children: <Widget>[
        _buildWidgetPanelCalendar(context),
        Expanded(
          child: ListView.builder(
            itemCount: matchResultResponse.length,
            itemBuilder: (context, index) {
              var matchResultItem = matchResultResponse[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          matchResultItem.strEvent,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: ColorAssets.primaryTextColor),
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
  }

  Widget _buildWidgetPanelCalendar(BuildContext context) {
    String strDateTitle = DateFormat("EEEE, dd MMM yyyy").format(_selectedDate);
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              strDateTitle,
              style: Theme.of(context).textTheme.title.merge(
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
            ),
            GestureDetector(
              onTap: () {
                _buildCalendar(context);
              },
              child: Icon(FontAwesomeIcons.calendarAlt),
            ),
          ],
        ),
      ),
    );
  }

  _buildCalendar(BuildContext context) async {
    if (Platform.isAndroid) {
      DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2018),
        lastDate: DateTime(_selectedDate.year + 1),
      );
      if (picked != null) {
        _selectedDate = picked;
        setState(() {});
        _doLoadDataMatch();
      }
    } else {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 380.0,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300.0,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: _selectedDate,
                      minimumDate: DateTime(2018),
                      maximumDate: DateTime(2019),
                      onDateTimeChanged: (dateTime) {
                        _selectedDate = dateTime;
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: CupertinoButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {});
                        _doLoadDataMatch();
                      },
                    ),
                  ),
                ],
              ),
            );
          });
    }
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
        child: Text(
          matchResultItem.intHomeScore + " - " + matchResultItem.intAwayScore,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}
