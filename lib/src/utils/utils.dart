/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 6/29/19 11:28 AM
 */

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

const pathImageNotFound = "http://api.bengkelrobot.net:8001/assets/images/img_not_found.jpg";

Widget buildCircularProgressIndicator() {
  if (Platform.isIOS) {
    return CupertinoActivityIndicator();
  } else {
    return CircularProgressIndicator();
  }
}

Future<bool> launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
    return true;
  } else {
    return false;
  }
}