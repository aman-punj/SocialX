import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_x/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:social_x/res/app_url/app_url.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController().obs;

  Future<NewsModel> getNewsApi() async {
    final response = await http.get(Uri.parse(AppUrl.baseUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return NewsModel.fromJson(data);
    } else {
      throw Exception("error.. (cannot call news api)");
    }
  }
}
