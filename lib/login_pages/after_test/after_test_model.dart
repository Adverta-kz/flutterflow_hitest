import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/footer/footer_widget.dart';
import '/components/header/header_widget.dart';
import '/components/web_nav_left/web_nav_left_widget.dart';
import '/components/web_nav_right/web_nav_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'after_test_widget.dart' show AfterTestWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AfterTestModel extends FlutterFlowModel<AfterTestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for header component.
  late HeaderModel headerModel1;
  // Model for WebNavLeft component.
  late WebNavLeftModel webNavLeftModel1;
  // Model for WebNavRight component.
  late WebNavRightModel webNavRightModel1;
  // Model for footer component.
  late FooterModel footerModel1;
  // Model for header component.
  late HeaderModel headerModel2;
  // Model for WebNavLeft component.
  late WebNavLeftModel webNavLeftModel2;
  // Model for WebNavRight component.
  late WebNavRightModel webNavRightModel2;
  // Model for footer component.
  late FooterModel footerModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel1 = createModel(context, () => HeaderModel());
    webNavLeftModel1 = createModel(context, () => WebNavLeftModel());
    webNavRightModel1 = createModel(context, () => WebNavRightModel());
    footerModel1 = createModel(context, () => FooterModel());
    headerModel2 = createModel(context, () => HeaderModel());
    webNavLeftModel2 = createModel(context, () => WebNavLeftModel());
    webNavRightModel2 = createModel(context, () => WebNavRightModel());
    footerModel2 = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel1.dispose();
    webNavLeftModel1.dispose();
    webNavRightModel1.dispose();
    footerModel1.dispose();
    headerModel2.dispose();
    webNavLeftModel2.dispose();
    webNavRightModel2.dispose();
    footerModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
