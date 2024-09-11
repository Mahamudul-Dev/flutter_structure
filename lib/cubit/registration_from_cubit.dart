import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_from_state.dart';

class RegistrationFromCubit extends Cubit<RegistrationFromState> {
  RegistrationFromCubit() : super(RegistrationFromInitial());
  var defaultRole = 'user';



  void roleSelection(String? role){
    if(role != null){
      defaultRole = role;
    emit(RoleUpdated(defaultRole));
    }
  }
}
