// ignore_for_file: non_constant_identifier_names

class Environment {
  Uri BASE_URL({required String path}) {
    return Uri.parse('https://api.openweathermap.org/data/2.5/$path');
  }

  String API_KEY = '45865970ebbfbc127eb2a16dd7f753e7';  
}

Environment ENV = Environment();
