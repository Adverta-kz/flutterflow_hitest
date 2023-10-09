import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/footer/footer_widget.dart';
import '/components/header/header_widget.dart';
import '/components/web_nav_left/web_nav_left_widget.dart';
import '/components/web_nav_right/web_nav_right_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'profile_info_widget.dart' show ProfileInfoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ProfileInfoModel extends FlutterFlowModel<ProfileInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController;
  final phoneNumberMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  final textFieldMask1 = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  final textFieldMask2 = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  final textFieldMask3 = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  final textFieldMask4 = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for email widget.
  TextEditingController? emailController1;
  String? Function(BuildContext, String?)? emailController1Validator;
  // State field(s) for email widget.
  TextEditingController? emailController2;
  String? Function(BuildContext, String?)? emailController2Validator;
  // State field(s) for email widget.
  TextEditingController? emailController3;
  String? Function(BuildContext, String?)? emailController3Validator;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for WebNavLeft component.
  late WebNavLeftModel webNavLeftModel;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextField widget.
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController17;
  String? Function(BuildContext, String?)? textController17Validator;
  // Model for WebNavRight component.
  late WebNavRightModel webNavRightModel;
  // Model for footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    webNavLeftModel = createModel(context, () => WebNavLeftModel());
    webNavRightModel = createModel(context, () => WebNavRightModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    phoneNumberController?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    emailController1?.dispose();
    emailController2?.dispose();
    emailController3?.dispose();
    headerModel.dispose();
    webNavLeftModel.dispose();
    textController9?.dispose();
    textController10?.dispose();
    textController11?.dispose();
    textController12?.dispose();
    textController13?.dispose();
    textController14?.dispose();
    textController15?.dispose();
    textController16?.dispose();
    textController17?.dispose();
    webNavRightModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
