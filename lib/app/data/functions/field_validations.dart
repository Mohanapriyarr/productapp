mixin FieldValidaion {
  String? emptyValidation(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Please Enter $fieldName';
    }

    return null;
  }
}
