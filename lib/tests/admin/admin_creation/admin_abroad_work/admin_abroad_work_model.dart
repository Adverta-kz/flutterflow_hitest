import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'admin_abroad_work_widget.dart' show AdminAbroadWorkWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAbroadWorkModel extends FlutterFlowModel<AdminAbroadWorkWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode1;
  TextEditingController? phoneNumberController1;
  String? Function(BuildContext, String?)? phoneNumberController1Validator;
  String? _phoneNumberController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vhebjj78' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2jwnlg14' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode2;
  TextEditingController? phoneNumberController2;
  String? Function(BuildContext, String?)? phoneNumberController2Validator;
  String? _phoneNumberController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vqtord1a' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode3;
  TextEditingController? phoneNumberController3;
  String? Function(BuildContext, String?)? phoneNumberController3Validator;
  String? _phoneNumberController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ehou11c4' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode4;
  TextEditingController? phoneNumberController4;
  String? Function(BuildContext, String?)? phoneNumberController4Validator;
  String? _phoneNumberController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vm3nckj7' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode5;
  TextEditingController? phoneNumberController5;
  String? Function(BuildContext, String?)? phoneNumberController5Validator;
  String? _phoneNumberController5Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cmmu07bk' /* Field is required */,
      );
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    phoneNumberController1Validator = _phoneNumberController1Validator;
    textController2Validator = _textController2Validator;
    phoneNumberController2Validator = _phoneNumberController2Validator;
    phoneNumberController3Validator = _phoneNumberController3Validator;
    phoneNumberController4Validator = _phoneNumberController4Validator;
    phoneNumberController5Validator = _phoneNumberController5Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    phoneNumberFocusNode1?.dispose();
    phoneNumberController1?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    phoneNumberFocusNode2?.dispose();
    phoneNumberController2?.dispose();

    phoneNumberFocusNode3?.dispose();
    phoneNumberController3?.dispose();

    phoneNumberFocusNode4?.dispose();
    phoneNumberController4?.dispose();

    phoneNumberFocusNode5?.dispose();
    phoneNumberController5?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
