import 'package:injectable/injectable.dart';

import '../repository/display.repository.dart';
import 'base/api_usecase.dart';

@injectable
class DisplayUsecase {
  DisplayUsecase(this._displayRepository);
  final DisplayRepository _displayRepository;

  Future<List<T>> call<T>(ApiUsecase apiUsecase) async {
    return await apiUsecase.execute(_displayRepository);
  }
}
