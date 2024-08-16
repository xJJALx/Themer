import 'package:themer/core/theme/domain/repositories/local_storage_color_themer_repository.dart';

class GetDarkModeUseCase {
  final LocalStorageColorThemerRepository repository;

  GetDarkModeUseCase({required this.repository});

  Future<T?> call<T>(String key) {
    return repository.getValue(key);
  }
}
