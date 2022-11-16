import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xedu/core/error/failures.dart';
import 'package:xedu/features/login/domain/entity/user.dart';
import 'package:xedu/features/login/domain/usecases/post_login.dart';

part 'login_event.dart';
part 'login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.postLogin}) : super(LoginInitial()) {
    on<PostLoginEvent>(_onPostLoginEvent);
  }

  final PostLogin postLogin;

  LoginState get initialState => LoginInitial();

  _onPostLoginEvent(
    PostLoginEvent event,
    Emitter<LoginState> emit
  ) async {
    emit(LoginLoading());
    final result = await postLogin.call(Params(email: event.email, password: event.password));
    result!.fold(
      (l) => emit(LoginFailed(message: _mapFailureToMessage(l))), 
      (r) => emit(LoginSuccess(user: r))
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'UnexpectedError';
    }
  }
}
