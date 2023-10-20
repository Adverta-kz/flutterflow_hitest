import '/auth/firebase_auth/auth_util.dart';
import '/components/footer/footer_widget.dart';
import '/components/header/header_widget.dart';
import '/components/web_nav_left/web_nav_left_widget.dart';
import '/components/web_nav_right/web_nav_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? passwordTextController1;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for WebNavLeft component.
  late WebNavLeftModel webNavLeftModel;
  // State field(s) for TextFieldPC widget.
  FocusNode? textFieldPCFocusNode;
  TextEditingController? textFieldPCController;
  String? Function(BuildContext, String?)? textFieldPCControllerValidator;
  // State field(s) for TextFieldPCPASS widget.
  FocusNode? textFieldPCPASSFocusNode;
  TextEditingController? textFieldPCPASSController;
  late bool textFieldPCPASSVisibility;
  String? Function(BuildContext, String?)? textFieldPCPASSControllerValidator;
  // Model for WebNavRight component.
  late WebNavRightModel webNavRightModel;
  // Model for footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    headerModel = createModel(context, () => HeaderModel());
    webNavLeftModel = createModel(context, () => WebNavLeftModel());
    textFieldPCPASSVisibility = false;
    webNavRightModel = createModel(context, () => WebNavRightModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    emailTextController1?.dispose();

    textFieldFocusNode2?.dispose();
    passwordTextController1?.dispose();

    headerModel.dispose();
    webNavLeftModel.dispose();
    textFieldPCFocusNode?.dispose();
    textFieldPCController?.dispose();

    textFieldPCPASSFocusNode?.dispose();
    textFieldPCPASSController?.dispose();

    webNavRightModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
