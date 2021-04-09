// Skip to content
// Search or jump to…
//
// Pull requests
// Issues
// Marketplace
// Explore
//
// @zenisoc
// Learn Git and GitHub without any code!
// Using the Hello World guide, you’ll start a branch, write comments, and open a pull request.
//
//
// Nandi-Space
// /
// mahajodi
// Private
// 1
// 00
// Code
// Issues
// 12
// Pull requests
// Actions
// Projects
// 1
// Security
// Insights
// mahajodi/lib/repository/remote_services.dart
// @Sagar-KC-3082
// Sagar-KC-3082 Api integration in Edit Profile
// Latest commit d54d94d 3 days ago
// History
// 2 contributors
// @Sagar-KC-3082@ArjunDahal864
// 361 lines (321 sloc)  9.87 KB
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:mahajodi_app/authentication/login/login_model.dart';
// import 'package:mahajodi_app/models/sign_up_model.dart';
// import 'package:mahajodi_app/repository/local_repository.dart';
// import 'package:mahajodi_app/utils/ExceptionAndStatusCodeHnadling.dart';
//
// const BASE_URL = "http://192.168.1.172:8000/";
//
// class RemoteService {
//   LocalRepository localRepository = Get.put(LocalRepository());
//
//   Future<http.Response> login({LoginModel loginModel}) async {
//     return await http.post(
//       BASE_URL + "auth/login/",
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(
//         <String, String>{
//           "email": loginModel.email,
//           "password": loginModel.password
//         },
//       ),
//     );
//   }
//
//   Future<http.Response> fetchMe() async {
//     var tokens = await localRepository.getTokens();
//     return await http.get(BASE_URL + "auth/users/me/",
//         headers: {HttpHeaders.authorizationHeader: "Bearer $tokens"});
//   }
//
//   Future<http.Response> fetchProfiles() async {
//     var tokens = await localRepository.getTokens();
//     return await http.get(
//         BASE_URL + "profile/",
//         headers: {HttpHeaders.authorizationHeader: "Bearer $tokens"});
//   }
//
//   Future<http.Response> refreshToken() async {
//     var refreshToken = await localRepository.getRefreshToken();
//     return await http.get(BASE_URL + "auth/jwt/refresh/",
//         headers: {HttpHeaders.authorizationHeader: "Bearer $refreshToken"});
//   }
//
//   Future<http.Response> resetPasswordRequest(String email) async {
//     return await http.post(BASE_URL + "auth/request-reset-email/",
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{"email": email}));
//   }
//
//   Future<http.Response> registerUser({SignUp user}) async {
//     return await http.post(
//       BASE_URL + "auth/register/",
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(
//         <String, String>{
//           "username": user.fullName,
//           "email": user.email,
//           "password": user.password,
//         },
//       ),
//     );
//   }
//
//   Future<http.Response> reSendEmailActivation({String email}) async {
//     return await http.post(
//       BASE_URL + "auth/re-send-email/",
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(
//         <String, String>{
//           "email": email,
//         },
//       ),
//     );
//   }
//
//
//   Future<http.Response> changePassword({String newPassword,
//     String confirmNewPassword,
//     String currentPassword}) async {
//     var tokens = await localRepository.getTokens();
//     return await http.post(
//       BASE_URL + "auth/users/set_password/",
//       headers: {
//         HttpHeaders.authorizationHeader: "Bearer $tokens",
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(
//         <String, String>{
//           "new_password": newPassword,
//           "re_new_password": confirmNewPassword,
//           "current_password": currentPassword,
//         },
//       ),
//     );
//   }
//
//   Future<http.Response> addDevices({String registrationID,
//     String name,
//     String active,
//     String user,
//     String deviceID,
//     String type}) async {
//     return await http.post(BASE_URL + "devices",
//         body: jsonEncode(<String, String>{
//           "registration_id": registrationID,
//           "name": name,
//           "active": active,
//           "user": user,
//           "device_id": deviceID,
//           "type": type
//         }));
//   }
//
//   Future<http.Response> deleteAccount({String password}) async {
//     var tokens = await localRepository.getTokens();
//     return await http.delete(
//       BASE_URL + "auth/users/me/",
//       headers: {
//         HttpHeaders.authorizationHeader: "Bearer $tokens",
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//   }
//
//
//   Future<http.Response> isEmailVerified({String email}) async {
//     return await http.post(
//         BASE_URL + "auth/check-verified-user/",
//         headers: <String, String>{
//           'Content-Type': 'application/json; character=UTF-8'
//         },
//         body: jsonEncode(
//             <String, String>{
//               "email": email
//             }
//         )
//     );
//   }
//
//
//   Future<http.Response> passwordReset(String password, String token,
//       String uidb64) async {
//     return await http.patch(
//         BASE_URL + "auth/password-reset-complete/",
//         headers: <String, String>{
//           'Content-Type': 'application/json; character=UTF-8'
//         },
//         body: jsonEncode(
//             <String, String>{
//               "password": password,
//               "token": token,
//               "uidb64": uidb64
//             }
//         )
//     );
//   }
//
//
//   Future<http.Response> basicGetApiCall(String otherUrl) async {
//     var accessToken = await localRepository.getTokens();
//     try {
//       var response = await http.get(
//         BASE_URL + otherUrl,
//         headers: {
//           HttpHeaders.authorizationHeader: "Bearer $accessToken",
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       print(otherUrl);
//       print(response.statusCode);
//       print(response.body);
//
//       if (response.statusCode == 401) {
//         print("Access Token Expired!!!");
//         String refreshToken = await localRepository.getRefreshToken();
//
//         var newAccessToken = await http.post(
//             BASE_URL + "auth/token/refresh/",
//             headers: {
//               'Content-Type': 'application/json; charset=UTF-8',
//             },
//             body: jsonEncode(
//                 <String, String>{"refresh": refreshToken}
//             )
//         );
//
//         var decodedInfo = jsonDecode(newAccessToken.body);
//         localRepository.setTokens(decodedInfo["access"], refreshToken);
//         var updatedAccessToken = await localRepository.getTokens();
//
//         var newResponse = await http.get(
//           BASE_URL + otherUrl,
//           headers: {
//             HttpHeaders.authorizationHeader: "Bearer $updatedAccessToken",
//           },
//         );
//
//         return newResponse;
//       }
//       else if (response.statusCode == 200) {
//         return response;
//       }
//       else {
//         StatusCodeHandling(response);
//       }
//     }
//     on SocketException {
//       SocketExceptions();
//     }
//     on HttpException {
//       HttpExceptions();
//     }
//     on FormatException {
//       FormatExceptions();
//     }
//
//     catch (e) {
//       OtherExceptions();
//     }
//   }
//
//
//   Future<http.Response> basicPostApiCall(String otherUrl, Map body) async {
//     var accessToken = await localRepository.getTokens();
//
//     try {
//       var response = await http.post(
//           BASE_URL + otherUrl,
//           headers: {
//             HttpHeaders.authorizationHeader: "Bearer $accessToken",
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: jsonEncode(body)
//       );
//       print(otherUrl);
//       print(response.statusCode);
//       print(response.body);
//       if (response.statusCode == 401) {
//         var refreshToken = await localRepository.getRefreshToken();
//         var newAccessToken = await http.post(
//             BASE_URL + "auth/token/refresh/",
//             headers: {
//               'Content-Type': 'application/json; charset=UTF-8',
//             },
//             body: jsonEncode(
//                 {"refresh": refreshToken}
//             )
//         );
//
//         localRepository.setTokens(
//             jsonDecode(newAccessToken.body), refreshToken);
//         var updatedAccessToken = await localRepository.getTokens();
//
//         var newResponse = await http.post(
//             BASE_URL + otherUrl,
//             headers: {
//               HttpHeaders.authorizationHeader: "Bearer $updatedAccessToken",
//               'Content-Type': 'application/json; charset=UTF-8',
//             },
//             body: jsonEncode(body)
//         );
//         return newResponse;
//       }
//       else if (response.statusCode == 200 || response.statusCode==400) {
//         return response;
//       }
//       else {
//         StatusCodeHandling(response);
//         return response;
//       }
//     }
//     on SocketException {
//       SocketExceptions();
//     }
//     on HttpException {
//       HttpExceptions();
//     }
//     on FormatException {
//       FormatExceptions();
//     }
//
//     catch (e) {
//       OtherExceptions();
//     }
//   }
//
//
//   Future<http.Response> basicDeleteApiCall(String otherUrl) async {
//     var accessToken = await localRepository.getTokens();
//
//     try {
//       var response = await http.delete(
//         BASE_URL + otherUrl,
//         headers: {
//           HttpHeaders.authorizationHeader: "Bearer $accessToken",
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       print(otherUrl);
//       print(response.statusCode);
//
//       if (response.statusCode == 401) {
//         var refreshToken = await localRepository.getRefreshToken();
//         var newAccessToken = await http.post(
//             BASE_URL + "auth/token/refresh/",
//             headers: {
//               'Content-Type': 'application/json; charset=UTF-8',
//             },
//             body: jsonEncode(
//                 {"refresh": refreshToken}
//             )
//         );
//
//         localRepository.setTokens(
//             jsonDecode(newAccessToken.body), refreshToken);
//         var updatedAccessToken = await localRepository.getTokens();
//
//         var newResponse = await http.post(
//           BASE_URL + otherUrl,
//           headers: {
//             HttpHeaders.authorizationHeader: "Bearer $updatedAccessToken",
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//
//         );
//         return newResponse;
//       }
//       else if (response.statusCode == 200) {
//         return response;
//       }
//       else {
//         StatusCodeHandling(response);
//       }
//     }
//     on SocketException {
//       SocketExceptions();
//     }
//     on HttpException {
//       HttpExceptions();
//     }
//     on FormatException {
//       FormatExceptions();
//     }
//
//     catch (e) {
//       OtherExceptions();
//     }
//   }
// }
//
