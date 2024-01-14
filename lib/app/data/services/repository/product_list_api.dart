import 'package:product_app/app/common_views/show_toast.dart';
import 'package:product_app/app/data/helper/common_header.dart';
import 'package:product_app/app/data/services/logs/log.dart';
import 'package:product_app/app/data/services/model/product_list_model.dart';
import 'package:product_app/app/data/utils/config_utils.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:to_curl/to_curl.dart';

Future<List<ProductListModel>?> productListApi() async {
  Uri url = Uri.parse('${Server.BASEURL}/Product');

  Log.info(info: 'Fetch Profile api ~ url ~ $url');

  Map<String, String> headers = await CommonHeader().commonHeader();

  var clients = http.Client();

  try {
    var response = await clients.get(url, headers: headers);

    Log.info(info: 'Fetch Profile api ~ status code ${response.statusCode}');
    Log.info(info: 'Fetch Profile api ~ response body ${response.body}');

    //? TO GET CURL ///////////////////////
    final req3 = http.Request('GET', url);
    req3.headers.addAll(headers);
    Log.info(info: 'Fetch Profile api ~ curl ~ ${toCurl(req3)}');

    //? ///////////////////////////////////////

    if (response.statusCode == 200) {
      final decodedRes = productListModelFromJson(response.body);
      return decodedRes;
    } else {
      showToast(message: 'Invalid Details');
      return null;
    }
  } on PlatformException catch (e) {
    Log.severe(severe: 'Fetch Profile api ~ platform exception ~ $e');
    showToast(message: 'Something Went Wrong');
    return null;
  } on http.ClientException catch (e) {
    Log.severe(severe: 'Fetch Profile api ~ platform exception ~ $e');
    showToast(message: 'Something Went Wrong');

    return null;
  } catch (e) {
    Log.severe(severe: 'Fetch Profile api ~ platform exception ~ $e');
    showToast(message: 'Something Went Wrong');

    return null;
  } finally {
    clients.close();
  }
}
