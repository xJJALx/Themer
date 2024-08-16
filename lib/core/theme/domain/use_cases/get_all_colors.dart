import 'package:themer/core/theme/domain/entities/color_themer.dart';
import 'package:themer/core/theme/domain/repositories/color_themer_repository.dart';

class GetAllColorsUseCase {
  final ColorThemerRepository repository;

  GetAllColorsUseCase({required this.repository});

  Future<List<ColorThemer>> call() {
    return repository.getAllColors();
  }
}
