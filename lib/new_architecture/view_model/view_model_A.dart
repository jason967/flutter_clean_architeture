import 'package:e_commerce_architecture_ver_1_0/new_architecture/view_model/view_model.dart';
import 'package:injectable/injectable.dart';

enum Status { initial, loading, loaded, fail }

//뷰 모델 의존성 주입
@Injectable(as: ViewModel)
//@viewModel <-- 이런식으로 해당 클래스는 viewModel이라는 것을 표시
class ViewModelAA extends ViewModel {
  final AAUsecase _aaUsecase;
  ViewModelAA(this._aaUsecase);

  // 생성된 모든 뷰 모델들이 현재 상태를 공유 해야 됌
  //@state
  static Status status = Status.initial;

  int variable_1 = 0;
  List<String> userData = [];

  //---> 이벤트 어노테이션이 달린 경우에는 저절로 값이 바뀐것을 감지하도록 혹은 상태를 바뀌도록 할수 있도록 자동화할 수있는 코드가 필요 함

  //@event
  void changeVariableOne(int number) {
    variable_1 = number;
  }

  // @event(type: remote)
  Future<void> getUserInfo() async {
    final response = await onFetchRemoteData<List<String>>(_aaUsecase);
    userData = response;
  }

  // @override
  // Future<T> onFetchRemoteData<T>() async {
  //   final data = await _aaUsecase.getNormal();

  //   return data;
  // }

  // @override
  // Future<T> onFetchLocalData<T>() async {
  //   final data = await _aaUsecase.getNormal();

  //   return data;
  // }
}
