import 'package:product_app/app/data/services/logs/log.dart';
import 'package:http/http.dart' as http;
import 'package:product_app/app/data/services/model/product_list_model.dart';
import 'package:product_app/app/data/utils/config_utils.dart';

class FieldValidator {
  String? emptyValidation(String? value, String fieldName) {
    Log.info(info: 'received value $value');
    if (value == null || value.trim().isEmpty) {
      return 'Please Enter $fieldName';
    }

    return 'Successfully';
  }

  Future<List<ProductListModel>?> getProductList(http.Client http) async {
    Uri numberAPIURL = Uri.parse('${Server.BASEURL}/Product');
    final response = await http.get(numberAPIURL);
    if (response.statusCode == 200) {
      final res = productListModelFromJson(response.body);
      return res;
    } else {
      return null;
    }
  }
}
