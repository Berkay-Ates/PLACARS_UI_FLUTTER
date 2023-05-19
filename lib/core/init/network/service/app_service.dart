import 'package:dio/dio.dart';

class AppService {
  static AppService? _instance;
  static AppService? get instance {
    _instance ??= AppService._init();
    return _instance;
  }

  AppService._init() {
    _dio = Dio(BaseOptions());
  }

  late final Dio _dio;

  Dio get dio => _dio;
}
