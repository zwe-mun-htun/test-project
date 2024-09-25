
import 'package:test_project/src/domain/entities/data.dart';

abstract class HomeRepository {
  
  Future<Data> getHomeData();
}