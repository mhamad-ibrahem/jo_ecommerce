import '../api_links.dart';

mixin AuthLinks {
  String get login => '${ApiLinks.serverLink}/identity/token';
}
