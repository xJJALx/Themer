import 'package:themer/core/theme/domain/repositories/local_storage_color_themer_repository.dart';

class SaveAppColorUseCase {
  final LocalStorageColorThemerRepository repository;

  SaveAppColorUseCase({required this.repository});

  Future<void> call<T>(String key, T value) {
    return repository.setKeyValue(key, value);
  }
}
