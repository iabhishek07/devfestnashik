import 'package:equatable/equatable.dart';
import 'package:gdg_nashik/config/index.dart';
import 'package:gdg_nashik/utils/devfest.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigEvent extends Equatable {
  ConfigEvent([List props = const <dynamic>[]]) : super(props);
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

class DarkModeEvent extends ConfigEvent{
  final bool darkOn;

  DarkModeEvent(this.darkOn);

  @override
  String toString() => 'DarkModeEvent';
  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async {
    try{
      bloc.darkMode = darkOn;
      DevFest.prefs.setBool(DevFest.darkModePref, darkOn);
      return InConfigState();
    }catch(_,stackTrace){
      print('$_ $stackTrace');
      return ErrorConfigState(_?.toString());
    }
  }
}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() => 'LoadConfigEvent';
  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async {
    try{
      await Future.delayed(Duration(seconds: 2));
      return InConfigState();
    }catch(_,stackTrace){
      print('$_ $stackTrace');
      return ErrorConfigState(_?.toString());
    }
  }
}