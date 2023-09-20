import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminCoursesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController1;
  String? Function(BuildContext, String?)? phoneNumberController1Validator;
  String? _phoneNumberController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cnx0a787' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController2;
  String? Function(BuildContext, String?)? phoneNumberController2Validator;
  String? _phoneNumberController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mjumb5dm' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController3;
  String? Function(BuildContext, String?)? phoneNumberController3Validator;
  String? _phoneNumberController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lrwztacy' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController4;
  String? Function(BuildContext, String?)? phoneNumberController4Validator;
  String? _phoneNumberController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9o86sr3e' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController5;
  String? Function(BuildContext, String?)? phoneNumberController5Validator;
  String? _phoneNumberController5Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '43cxoilb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController6;
  String? Function(BuildContext, String?)? phoneNumberController6Validator;
  String? _phoneNumberController6Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hv93oj13' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController7;
  String? Function(BuildContext, String?)? phoneNumberController7Validator;
  String? _phoneNumberController7Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '07ggezbn' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  String? _textController8Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '859soknn' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    phoneNumberController1Validator = _phoneNumberController1Validator;
    phoneNumberController2Validator = _phoneNumberController2Validator;
    phoneNumberController3Validator = _phoneNumberController3Validator;
    phoneNumberController4Validator = _phoneNumberController4Validator;
    phoneNumberController5Validator = _phoneNumberController5Validator;
    phoneNumberController6Validator = _phoneNumberController6Validator;
    phoneNumberController7Validator = _phoneNumberController7Validator;
    textController8Validator = _textController8Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    phoneNumberController1?.dispose();
    phoneNumberController2?.dispose();
    phoneNumberController3?.dispose();
    phoneNumberController4?.dispose();
    phoneNumberController5?.dispose();
    phoneNumberController6?.dispose();
    phoneNumberController7?.dispose();
    textController8?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
