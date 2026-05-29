import 'package:e_wast_app/api/endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  // ==========================================
  // REGISTER API
  // ==========================================
  static Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
    required String number,

  }) async {
    try {
      final response = await http.post(
        Uri.parse(API_Endpoint.base_url+API_Endpoint.registration),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "number":number,
        }),
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return responseData; // Success response
      } else {

        String errorMessage = responseData['message'] ?? responseData['error'] ?? 'Registration failed. Please try again.';

        return {"success": false, "message": errorMessage};
      }
    } catch (e) {
      return {"success": false, "message": "Connection Failed. Check your network or server."};
    }
  }

  // ==========================================
  // LOGIN API
  // ==========================================
  static Future<Map<String, dynamic>> loginUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(API_Endpoint.base_url+API_Endpoint.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
        }),
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return responseData; // Success response
      } else {
        String errorMessage = responseData['message'] ?? responseData['error'] ?? 'Invalid email or password.';

        return {"success": false, "message": errorMessage};
      }
    } catch (e) {
      return {"success": false, "message": "Connection Failed. Check your network or server."};
    }
  }
}