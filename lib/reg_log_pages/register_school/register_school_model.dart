import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/footer_widget.dart';
import '/components/header_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'register_school_widget.dart' show RegisterSchoolWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterSchoolModel extends FlutterFlowModel<RegisterSchoolWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? passwordTextController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? confirmPasswordTextController0;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)?
      confirmPasswordTextController0Validator;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for WebNav component.
  late WebNavModel webNavModel;
  // State field(s) for NAMEPC widget.
  TextEditingController? namepcController;
  String? Function(BuildContext, String?)? namepcControllerValidator;
  String? _namepcControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'puo7uoic' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for SURNAMEPC widget.
  TextEditingController? surnamepcController;
  String? Function(BuildContext, String?)? surnamepcControllerValidator;
  String? _surnamepcControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9msoo7w5' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for NUBMERPC widget.
  TextEditingController? nubmerpcController;
  String? Function(BuildContext, String?)? nubmerpcControllerValidator;
  String? _nubmerpcControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e7gbl4lh' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for EMAILPC widget.
  TextEditingController? emailpcController;
  String? Function(BuildContext, String?)? emailpcControllerValidator;
  String? _emailpcControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rp3vqjaf' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for PASSWORDPC widget.
  TextEditingController? passwordpcController;
  late bool passwordpcVisibility;
  String? Function(BuildContext, String?)? passwordpcControllerValidator;
  String? _passwordpcControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5nk0utqb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for PASSWORDCONFIRMPC widget.
  TextEditingController? passwordconfirmpcController;
  late bool passwordconfirmpcVisibility;
  String? Function(BuildContext, String?)? passwordconfirmpcControllerValidator;
  String? _passwordconfirmpcControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9e46m3m9' /* Field is required */,
      );
    }

    return null;
  }

  // Model for footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
    headerModel = createModel(context, () => HeaderModel());
    webNavModel = createModel(context, () => WebNavModel());
    namepcControllerValidator = _namepcControllerValidator;
    surnamepcControllerValidator = _surnamepcControllerValidator;
    nubmerpcControllerValidator = _nubmerpcControllerValidator;
    emailpcControllerValidator = _emailpcControllerValidator;
    passwordpcVisibility = false;
    passwordpcControllerValidator = _passwordpcControllerValidator;
    passwordconfirmpcVisibility = false;
    passwordconfirmpcControllerValidator =
        _passwordconfirmpcControllerValidator;
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    emailTextController1?.dispose();
    textController1?.dispose();
    textController2?.dispose();
    passwordTextController1?.dispose();
    confirmPasswordTextController0?.dispose();
    headerModel.dispose();
    webNavModel.dispose();
    namepcController?.dispose();
    surnamepcController?.dispose();
    nubmerpcController?.dispose();
    emailpcController?.dispose();
    passwordpcController?.dispose();
    passwordconfirmpcController?.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
