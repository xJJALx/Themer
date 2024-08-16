import 'package:themer/core/theme/domain/datasources/local_storage_color_themer_datasource.dart';
import 'package:themer/core/theme/domain/repositories/local_storage_color_themer_repository.dart';

class LocalStorageColorThemerRepositoryImpl implements LocalStorageColorThemerRepository {
  final LocalStorageColorThemerDatasource datasource;

  LocalStorageColorThemerRepositoryImpl({required this.datasource});

  @override
  Future<T?> getValue<T>(String key) {
    return datasource.getValue(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) {
    return datasource.setKeyValue(key, value);
  }

  @override
  Future<bool> removeKey(String key) {
    return datasource.removeKey(key);
  }
}
