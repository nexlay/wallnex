import 'dart:io';

String jsonReader(String name) {
  String json = File('test/resources/$name').readAsStringSync();

  return json;
}
