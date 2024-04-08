


import '../../services/app_services.dart';
import 'sub_links/auth_links.dart';

class ApiLinks with AuthLinks {
  static Map<String, String> header = {
   'Content-Type': 'application/json',
  };
  static Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    'Authorization': "Bearer ${AppServices.accessToken}",
  };
  static const String apiVersion = 'v1';
  static const String serverLink = 'http://.../api';

}
