import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:huda_clinic_mobile/constants.dart';
import 'package:huda_clinic_mobile/model/alldepts_model.dart';
import 'package:huda_clinic_mobile/model/allproviders_model.dart';
import 'package:huda_clinic_mobile/model/apptconf_model.dart';
import 'package:huda_clinic_mobile/model/athena_json_model.dart';
import 'package:huda_clinic_mobile/model/labanalytes_model.dart';
import 'package:huda_clinic_mobile/model/problemlist_model.dart';

class ApiService {
  Future<List<Appointments>?> getAppts() async {
    // calls patient appointments endpoint from api!
    try {
      final url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      final Map<String, String> headers = {
        // required headers in order for GET call to work properly and be authorized!
        'accept': 'application/json',
        'Authorization':
            'Bearer aSoms6POjVgvPTpeQHwCOAaPZR2a' // must be generated on postman using OAuth 2.0 and your client credentials along with your secret!
      };
      var response = await http.get(url, headers: headers);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        // if API call is SUCCESSFUL it will display 200!
        log(response.body);
        final result = AthenaOneJSON.fromJson(jsonDecode(response.body))
            .appointments
            ?.toList(); // add to list for parsing!
        return result;
      } else {
        throw Exception(
            'Failed to get list of all appointments!'); // error handling!
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<ApptConf> getCStatus() async {
    // calls patient appointment confirmation status endpoint from api!
    try {
      final url =
          Uri.parse(ApiConstants2.baseUrl + ApiConstants2.usersEndpoint);
      final Map<String, String> headers = {
        // required headers in order for GET call to work properly and be authorized!
        'accept': 'application/json',
        'Authorization':
            'Bearer aSoms6POjVgvPTpeQHwCOAaPZR2a' // must be generated on postman using OAuth 2.0 and your client credentials along with your secret!
      };
      var response = await http.get(url, headers: headers);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        // if API call is SUCCESSFUL it will display 200!
        log(response.body);
        final jsonBody = json.decode(response.body);
        final apptConf = ApptConf.fromJson(jsonBody);
        return apptConf;
      } else {
        throw Exception(
            'Failed to get appointment confirmation status!'); // error handling!
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Departments>?> getAllDepts() async {
    // calls list of departments endpoint from api!
    try {
      final url =
          Uri.parse(ApiConstants3.baseUrl + ApiConstants3.usersEndpoint);
      final Map<String, String> headers = {
        // required headers in order for GET call to work properly and be authorized!
        'accept': 'application/json',
        'Authorization':
            'Bearer aSoms6POjVgvPTpeQHwCOAaPZR2a' // must be generated on postman using OAuth 2.0 and your client credentials along with your secret!
      };
      var response = await http.get(url, headers: headers);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        // if API call is SUCCESSFUL it will display 200!
        log(response.body);
        final result = AllDepts.fromJson(jsonDecode(response.body))
            .departments
            ?.toList(); // add to list for parsing!
        return result;
      } else {
        throw Exception(
            'Failed to get list of all departments!'); // error handling!
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Providers>?> getAllProviders() async {
    // calls list of providers endpoint from api!
    try {
      final url =
          Uri.parse(ApiConstants4.baseUrl + ApiConstants4.usersEndpoint);
      final Map<String, String> headers = {
        // required headers in order for GET call to work properly and be authorized!
        'content-type': 'application/json',
        'Authorization':
            'Bearer aSoms6POjVgvPTpeQHwCOAaPZR2a' // must be generated on postman using OAuth 2.0 and your client credentials along with your secret!
      };
      var response = await http.get(url, headers: headers);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        // if API call is SUCCESSFUL it will display 200!
        log(response.body);
        final result = AllProviders.fromJson(jsonDecode(response.body))
            .providers
            ?.toList(); // add to list for parsing!
        return result;
      } else {
        throw Exception(
            'Failed to get list of all providers!'); // error handling!
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Analytes>?> getLabAnalytes() async {
    // calls lab analytes endpoint from api!
    try {
      final url =
          Uri.parse(ApiConstants5.baseUrl + ApiConstants5.usersEndpoint);
      final Map<String, String> headers = {
        // required headers in order for GET call to work properly and be authorized!
        'content-type': 'application/json',
        'Authorization':
            'Bearer aSoms6POjVgvPTpeQHwCOAaPZR2a' // must be generated on postman using OAuth 2.0 and your client credentials along with your secret!
      };
      var response = await http.get(url, headers: headers);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        // if API call is SUCCESSFUL it will display 200!
        log(response.body);
        final result = LabAnalytes.fromJson(jsonDecode(response.body))
            .analytes
            ?.toList(); // add to list for parsing!
        return result;
      } else {
        throw Exception('Failed to get lab analytes!'); // error handling!
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Problems>?> getProblemList() async {
    // calls problem list endpoint from api!
    try {
      final url =
          Uri.parse(ApiConstants6.baseUrl + ApiConstants6.usersEndpoint);
      final Map<String, String> headers = {
        // required headers in order for GET call to work properly and be authorized!
        'content-type': 'application/json',
        'Authorization':
            'Bearer aSoms6POjVgvPTpeQHwCOAaPZR2a' // must be generated on postman using OAuth 2.0 and your client credentials along with your secret!
      };
      var response = await http.get(url, headers: headers);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        // if API call is SUCCESSFUL it will display 200!
        log(response.body);
        final result = ProblemList.fromJson(jsonDecode(response.body))
            .problems
            ?.toList(); // add to list for parsing!
        return result;
      } else {
        throw Exception('Failed to get problem list!'); // error handling!
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
