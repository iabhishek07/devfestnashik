import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_nashik/config/config_bloc.dart';
import 'package:gdg_nashik/utils/devfest.dart';
import 'index.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp(){
    configBloc = ConfigBloc();
    configBloc.darkMode = DevFest.prefs.getBool(Devfest.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context)=> configBloc,
      child: BlocBuilder<ConfigBloc,ConfigState>(
      ),
    );  
  }
}