import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wrapper/models/user_summary.dart';

class UserSummaryService {
  Future<UserSummary> getUserSummary(String id) async {
    // TODO: Replace with Unique Id based API
    final response = await Dio().get(
      'https://api.cherryko.tk/api/v1/roundup',
      queryParameters: {
        'iecu_id': id,
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      final json = Map<String, dynamic>.from(response.data['roundup']);
      return UserSummary.fromJson(json);
    } else {
      throw Exception('Could not fetch data!');
    }
  }
}
