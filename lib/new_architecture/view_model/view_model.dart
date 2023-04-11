abstract class ViewModel {
  // remote (ex.api)에서 데이터를 가져오는 경우
  Future<T> onFetchRemoteData<T>(ApiUsecase usecase) async {
    final data = await usecase.getRemote();

    return data;
  }

  // local storage에서 데이터를 가져오는 경우
  Future<T> onFetchLocalData<T>(LocalUsecase usecase) async {
    final data = await usecase.getLocal();

    return data;
  }
}
