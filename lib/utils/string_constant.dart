// ignore_for_file: non_constant_identifier_names

class StringConstant {
  Map<String, String> HEADERS() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
}

StringConstant STRING_CONSTANT = StringConstant();
