
// import 'package:badges/badges.dart' as badges;
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:greensage/graph_all.dart';
import 'graph_all.dart' show Screen2Widget;
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

class Screen2Model extends FlutterFlowModel<Screen2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
