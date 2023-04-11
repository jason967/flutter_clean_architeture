import '../model/display/collection/collection.model.dart';
import '../model/display/view_module/view_module.model.dart';

abstract class DisplayRepository {
  Future<List<Collection>> getCollections({
    required String path,
    Map<String, String>? queries,
  });
  Future<List<ViewModule>> getViewModules({
    required String path,
    Map<String, String>? queries,
  });
}
