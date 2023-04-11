import 'package:injectable/injectable.dart';

import '../../model/common/request.model.dart';
import '../../model/display/view_module/view_module.model.dart';
import '../../repository/display.repository.dart';
import '../base/api_usecase.dart';

@injectable
class GetViewModules implements ApiUsecase {
  GetViewModules(this.request);
  final Request request;

  @override
  Future<List<ViewModule>> execute(DisplayRepository displayRepository) async {
    final path = request.path;
    final quries = {...request.params};
    final result =
        await displayRepository.getViewModules(path: path, queries: quries);

    return result;
  }
}
