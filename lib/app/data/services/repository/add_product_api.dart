import 'dart:convert';

import 'package:product_app/app/common_views/show_toast.dart';
import 'package:product_app/app/data/helper/common_header.dart';
import 'package:product_app/app/data/services/logs/log.dart';
import 'package:product_app/app/data/utils/config_utils.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:to_curl/to_curl.dart';

Future<bool?> addProductApi(
    {required String productName,
    required int quantity,
    required String id}) async {
  Uri url = Uri.parse('${Server.BASEURL}/Product');

  Log.info(info: 'add product api ~ url ~ $url');

  Map<String, String> headers = await CommonHeader().commonHeader();

  var clients = http.Client();

  String body = jsonEncode(<String, dynamic>{
    'productName': productName,
    'availableQuantity': quantity,
    'productId': id
  });

  try {
    var response = await clients.post(url, body: body, headers: headers);

    Log.info(info: 'add product api ~ status code ${response.statusCode}');
    Log.info(info: 'add product api ~ response body ${response.body}');

    //? TO GET CURL ///////////////////////
    final req3 = http.Request('POST', url);
    req3.headers.addAll(headers);
    Log.info(info: 'add product api ~ curl ~ ${toCurl(req3)}');

    //? ///////////////////////////////////////

    if (response.statusCode == 200) {
      final decodedRes = jsonEncode(response.body);
      return true;
    } else {
      showToast(message: 'Invalid Details');
      return null;
    }
  } on PlatformException catch (e) {
    Log.severe(severe: 'add product api ~ platform exception ~ $e');
    showToast(message: 'Something Went Wrong');
    return null;
  } on http.ClientException catch (e) {
    Log.severe(severe: 'add product api ~ platform exception ~ $e');
    showToast(message: 'Something Went Wrong');

    return null;
  } catch (e) {
    Log.severe(severe: 'add product api ~ platform exception ~ $e');
    showToast(message: 'Something Went Wrong');

    return null;
  } finally {
    clients.close();
  }
}
