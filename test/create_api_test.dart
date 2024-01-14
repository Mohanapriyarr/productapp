import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:product_app/app/data/functions/field_validator.dart';
import 'package:product_app/app/data/services/model/product_list_model.dart';

void main() {
  group('getProductList', () {
    test('returns number trivia string when http response is successful',
        () async {
      var clients = http.Client();

      // Mock the API call to return a json response with http status 200 Ok //

      expect(await FieldValidator().getProductList(clients),
          isA<List<ProductListModel>?>());
    });

    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      var clients = http.Client();

      expect(await FieldValidator().getProductList(clients),
          isA<List<ProductListModel>?>());
    });
  });
}
