import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class EnquiryService {
  static const String hostIp = '192.168.0.174';

  static String get baseUrl {
    if (kIsWeb) {
      final host = (Uri.base.host.isNotEmpty && Uri.base.host != '0.0.0.0')
          ? Uri.base.host
          : hostIp;
      return 'http://$host:5000/api/v1';
    }
    return 'http://$hostIp:5000/api/v1';
  }

  late final Dio _dio;

  EnquiryService() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  Future<bool> submitEnquiry({
    required String name,
    required String phone,
    required String brand,
    required String model,
    required String partName,
    String message = '',
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/enquiries',
        data: {
          'name': name.trim(),
          'phone': phone.trim(),
          'brand': brand.trim(),
          'model': model.trim(),
          'partName': partName.trim(),
          'message': message.trim(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        final data = response.data;
        if (data is Map && data.containsKey('message')) {
          throw Exception(data['message']);
        }
        throw Exception('Failed to submit enquiry (${response.statusCode})');
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          throw Exception(data['message']);
        }
      }
      throw Exception(e.message ?? 'Network error submitting enquiry');
    } catch (e) {
      rethrow;
    }
  }
}
