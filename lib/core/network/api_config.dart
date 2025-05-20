import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alice/alice.dart';
import 'package:talent_insider/utils/config.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ApiConfig {
  Alice alice = Alice(showNotification: true, navigatorKey: navigatorKey);

  Future<T> getApi<T>(
    String path, {
    Map<String, String>? headers,
    required T Function(dynamic) decoder,
  }) async {
    final Map<String, String> authHeaders = {
      'Authorization': 'Bearer ${Configuration.token}',
      'Content-Type': 'application/json',
    };
    headers?.forEach((key, value) => authHeaders[key] = value);

    try {
      final response = await http.get(
          Uri.parse('${Configuration.baseUrl}$path'),
          headers: authHeaders);

      alice.onHttpResponse(response);

      if (response.statusCode == 200) {
        final jsonResult = json.decode(response.body);
        return decoder(jsonResult);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString(), name: 'ApiConfig');
      rethrow;
    }
  }

  Future<T> postApi<T>(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required T Function(dynamic) decoder,
  }) async {
    final Map<String, String> authHeaders = {
      'Authorization': 'Bearer ${Configuration.token}',
      'Content-Type': 'application/json',
    };
    headers?.forEach((key, value) => authHeaders[key] = value);

    try {
      final response = await http.post(
        Uri.parse('${Configuration.baseUrl}$path'),
        headers: authHeaders,
        body: jsonEncode(body),
      );

      alice.onHttpResponse(response);

      if (response.statusCode == 200) {
        final jsonResult = json.decode(response.body);
        return decoder(jsonResult);
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString(), name: 'ApiConfig');
      rethrow;
    }
  }

  Future<T> putApi<T>(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required T Function(dynamic) decoder,
  }) async {
    final Map<String, String> authHeaders = {
      'Authorization': 'Bearer ${Configuration.token}',
      'Content-Type': 'application/json',
    };
    headers?.forEach((key, value) => authHeaders[key] = value);

    try {
      final response = await http.put(
        Uri.parse('${Configuration.baseUrl}$path'),
        headers: authHeaders,
        body: jsonEncode(body),
      );

      alice.onHttpResponse(response);

      if (response.statusCode == 200) {
        final jsonResult = json.decode(response.body);

        if (jsonResult == null || jsonResult is! Map<String, dynamic>) {
          throw Exception('Unexpected response format: $jsonResult');
        }

        return decoder(jsonResult);
      } else {
        throw Exception('Failed to update data: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString(), name: 'ApiConfig');
      rethrow;
    }
  }

  Future<T> deleteApi<T>(
    String path, {
    Map<String, String>? headers,
    T Function(dynamic)? decoder,
  }) async {
    final Map<String, String> authHeaders = {
      'Authorization': 'Bearer ${Configuration.token}',
      'Content-Type': 'application/json',
    };
    headers?.forEach((key, value) => authHeaders[key] = value);

    try {
      final response = await http.delete(
          Uri.parse('${Configuration.baseUrl}$path'),
          headers: authHeaders);

      alice.onHttpResponse(response);

      if (response.statusCode == 200) {
        if (decoder != null) {
          final jsonResult = json.decode(response.body);
          return decoder(jsonResult);
        } else {
          return null as T;
        }
      } else {
        throw Exception('Failed to delete data: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString(), name: 'ApiConfig');
      rethrow;
    }
  }
}
