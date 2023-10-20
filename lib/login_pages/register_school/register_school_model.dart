import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/header/header_widget.dart';
import '/components/web_nav_left/web_nav_left_widget.dart';
import '/components/web_nav_right/web_nav_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'register_school_widget.dart' show RegisterSchoolWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterSchoolModel extends FlutterFlowModel<RegisterSchoolWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? passwordTextController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? confirmPasswordTextController0;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)?
      confirmPasswordTextController0Validator;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for WebNavLeft component.
  late WebNavLeftModel webNavLeftModel;
  // State field(s) for NAMEPC widget.
  FocusNode? namepcFocusNode;
  TextEditingController? namepcController;
  String? Function(BuildContext, String?)? namepcControllerValidator;
  // State field(s) for SURNAMEPC widget.
  FocusNode? surnamepcFocusNode;
  TextEditingController? surnamepcController;
  String? Function(BuildContext, String?)? surnamepcControllerValidator;
  // State field(s) for NUBMERPC widget.
  FocusNode? nubmerpcFocusNode;
  TextEditingController? nubmerpcController;
  String? Function(BuildContext, String?)? nubmerpcControllerValidator;
  // State field(s) for EMAILPC widget.
  FocusNode? emailpcFocusNode;
  TextEditingController? emailpcController;
  String? Function(BuildContext, String?)? emailpcControllerValidator;
  // State field(s) for PASSWORDPC widget.
  FocusNode? passwordpcFocusNode;
  TextEditingController? passwordpcController;
  late bool passwordpcVisibility;
  String? Function(BuildContext, String?)? passwordpcControllerValidator;
  // State field(s) for PASSWORDCONFIRMPC widget.
  FocusNode? passwordconfirmpcFocusNode;
  TextEditingController? passwordconfirmpcController;
  late bool passwordconfirmpcVisibility;
  String? Function(BuildContext, String?)? passwordconfirmpcControllerValidator;
  // Model for WebNavRight component.
  late WebNavRightModel webNavRightModel;
  // Model for footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
    headerModel = createModel(context, () => HeaderModel());
    webNavLeftModel = createModel(context, () => WebNavLeftModel());
    passwordpcVisibility = false;
    passwordconfirmpcVisibility = false;
    webNavRightModel = createModel(context, () => WebNavRightModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    emailTextController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController1?.dispose();

    textFieldFocusNode3?.dispose();
    textController2?.dispose();

    textFieldFocusNode4?.dispose();
    passwordTextController1?.dispose();

    textFieldFocusNode5?.dispose();
    confirmPasswordTextController0?.dispose();

    headerModel.dispose();
    webNavLeftModel.dispose();
    namepcFocusNode?.dispose();
    namepcController?.dispose();

    surnamepcFocusNode?.dispose();
    surnamepcController?.dispose();

    nubmerpcFocusNode?.dispose();
    nubmerpcController?.dispose();

    emailpcFocusNode?.dispose();
    emailpcController?.dispose();

    passwordpcFocusNode?.dispose();
    passwordpcController?.dispose();

    passwordconfirmpcFocusNode?.dispose();
    passwordconfirmpcController?.dispose();

    webNavRightModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
