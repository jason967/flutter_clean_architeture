import 'package:injectable/injectable.dart';

import '../../model/common/request.model.dart';
import '../../model/display/collection/collection.model.dart';
import '../../repository/display.repository.dart';
import '../base/api_usecase.dart';

@Injectable(as: ApiUsecase)
class GetCollections implements ApiUsecase {
  GetCollections(this.request);
  final Request request;

  @override
  Future<List<Collection>> execute(DisplayRepository displayRepository) async {
    final path = request.path;
    Map<String, String> queries = {...request.params};
    final response =
        await displayRepository.getCollections(path: path, queries: queries);

    return response;
  }
}
