import 'package:themer/core/theme/domain/repositories/local_storage_color_themer_repository.dart';

class SaveDarkModeUseCase {
  final LocalStorageColorThemerRepository repository;

  SaveDarkModeUseCase({required this.repository});

  Future<void> call<T>(String key, T value) {
    return repository.setKeyValue(key, value);
  }
}
