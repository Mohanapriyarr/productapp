import 'package:flutter_test/flutter_test.dart';
import 'package:product_app/app/data/functions/field_validator.dart';

void main() {
  group('Add Product', () {
    test('empty product name test', () {
      final fieldValidator = FieldValidator();
      var result = fieldValidator.emptyValidation('', 'Product Name');
      expect(result, 'Please Enter Product Name');
    });

    test('empty product name test', () {
      final fieldValidator = FieldValidator();
      var result = fieldValidator.emptyValidation('test', 'Product Name');
      expect(result, 'Successfully');
    });
  });
}
