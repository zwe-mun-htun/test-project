import 'package:dio/dio.dart';
import 'package:test_project/src/domain/entities/data.dart';
import '../../config/constants/constants.dart';
import '../../core/service/auth_service.dart';
import '../../domain/datasources/home_datasource.dart';
import 'package:http/http.dart' as http;

class HomeDataSource extends HomeDataSources {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.kBaseURL,
    ),
  );

  @override
  Future<Data> getHomeData() async {
    String? token = await AuthService().getToken();
    try {
      final response = await http.get(
        Uri.parse(AppConstants.dataPath),
        headers: {
          'Authorization': token ?? '',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return Data(text: response.body);
      } else {
        throw Exception('Error fetching data: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
