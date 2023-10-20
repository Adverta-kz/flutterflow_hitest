import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/header/header_widget.dart';
import '/components/web_nav_left/web_nav_left_widget.dart';
import '/components/web_nav_right/web_nav_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'balance_widget.dart' show BalanceWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BalanceModel extends FlutterFlowModel<BalanceWidget> {
  ///  Local state fields for this page.

  int? isSelected;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SURNAMEPC widget.
  FocusNode? surnamepcFocusNode;
  TextEditingController? surnamepcController;
  String? Function(BuildContext, String?)? surnamepcControllerValidator;
  // State field(s) for cardmb widget.
  FocusNode? cardmbFocusNode;
  TextEditingController? cardmbController;
  final cardmbMask = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? cardmbControllerValidator;
  // State field(s) for timemb widget.
  FocusNode? timembFocusNode;
  TextEditingController? timembController;
  late bool timembVisibility;
  final timembMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? timembControllerValidator;
  // State field(s) for cvvmb widget.
  FocusNode? cvvmbFocusNode;
  TextEditingController? cvvmbController;
  late bool cvvmbVisibility;
  final cvvmbMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? cvvmbControllerValidator;
  // Stores action output result for [Custom Action - forSplit] action in Button widget.
  List<String>? expyearmonthsel;
  // Stores action output result for [Backend Call - API (cloudTest)] action in Button widget.
  ApiCallResponse? apiResulthsmselmb;
  // Stores action output result for [Custom Action - forSplit] action in Button widget.
  List<String>? expyearmonthmb;
  // Stores action output result for [Backend Call - API (cloudTest)] action in Button widget.
  ApiCallResponse? apiResulthsmmb;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for WebNavLeft component.
  late WebNavLeftModel webNavLeftModel;
  // State field(s) for money widget.
  FocusNode? moneyFocusNode;
  TextEditingController? moneyController;
  String? Function(BuildContext, String?)? moneyControllerValidator;
  // State field(s) for cardPC widget.
  FocusNode? cardPCFocusNode;
  TextEditingController? cardPCController;
  final cardPCMask = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? cardPCControllerValidator;
  // State field(s) for timePC widget.
  FocusNode? timePCFocusNode;
  TextEditingController? timePCController;
  final timePCMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? timePCControllerValidator;
  // State field(s) for cvvPC widget.
  FocusNode? cvvPCFocusNode;
  TextEditingController? cvvPCController;
  final cvvPCMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? cvvPCControllerValidator;
  // Stores action output result for [Custom Action - forSplit] action in Button widget.
  List<String>? expyearmonthselPC;
  // Stores action output result for [Backend Call - API (cloudTest)] action in Button widget.
  ApiCallResponse? apiResulthsmselPC;
  // Stores action output result for [Custom Action - forSplit] action in Button widget.
  List<String>? expyearmonthPC;
  // Stores action output result for [Backend Call - API (cloudTest)] action in Button widget.
  ApiCallResponse? apiResulthsmPC;
  // Model for WebNavRight component.
  late WebNavRightModel webNavRightModel;
  // Model for footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    timembVisibility = false;
    cvvmbVisibility = false;
    headerModel = createModel(context, () => HeaderModel());
    webNavLeftModel = createModel(context, () => WebNavLeftModel());
    webNavRightModel = createModel(context, () => WebNavRightModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    surnamepcFocusNode?.dispose();
    surnamepcController?.dispose();

    cardmbFocusNode?.dispose();
    cardmbController?.dispose();

    timembFocusNode?.dispose();
    timembController?.dispose();

    cvvmbFocusNode?.dispose();
    cvvmbController?.dispose();

    headerModel.dispose();
    webNavLeftModel.dispose();
    moneyFocusNode?.dispose();
    moneyController?.dispose();

    cardPCFocusNode?.dispose();
    cardPCController?.dispose();

    timePCFocusNode?.dispose();
    timePCController?.dispose();

    cvvPCFocusNode?.dispose();
    cvvPCController?.dispose();

    webNavRightModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
