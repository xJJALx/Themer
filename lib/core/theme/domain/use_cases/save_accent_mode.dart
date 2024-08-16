import 'package:themer/core/theme/domain/repositories/local_storage_color_themer_repository.dart';

class SaveAccentModeUseCase {
  final LocalStorageColorThemerRepository repository;

  SaveAccentModeUseCase({required this.repository});

  Future<void> call<T>(String key, T value) {
    return repository.setKeyValue(key, value);
  }
}
