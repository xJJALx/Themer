import 'package:themer/core/theme/domain/datasources/local_storage_color_themer_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageColorThemerDatasourceImpl implements LocalStorageColorThemerDatasource {
  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPrefs();

    switch (T) {
      case int:
        return prefs.getInt(key) as T?;

      case String:
        return prefs.getString(key) as T?;

      case bool:
        return prefs.getBool(key) as T?;

      default:
        throw UnimplementedError('GET not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPrefs();

    switch (T) {
      case int:
        return prefs.setInt(key, value as int);

      case String:
        return prefs.setString(key, value as String);

      case bool:
        return prefs.setBool(key, value as bool);

      default:
        throw UnimplementedError('Set not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharedPrefs();
    return await prefs.remove(key);
  }
}
