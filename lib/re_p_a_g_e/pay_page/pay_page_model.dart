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
import 'pay_page_widget.dart' show PayPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PayPageModel extends FlutterFlowModel<PayPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for cardmb widget.
  FocusNode? cardmbFocusNode;
  TextEditingController? cardmbController;
  final cardmbMask = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? cardmbControllerValidator;
  // State field(s) for timemb widget.
  FocusNode? timembFocusNode;
  TextEditingController? timembController;
  final timembMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? timembControllerValidator;
  // State field(s) for cvvmb widget.
  FocusNode? cvvmbFocusNode;
  TextEditingController? cvvmbController;
  final cvvmbMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? cvvmbControllerValidator;
  // Stores action output result for [Custom Action - forSplit] action in Button widget.
  List<String>? expyearmonth;
  // Stores action output result for [Backend Call - API (cloudTest)] action in Button widget.
  ApiCallResponse? apiResulthsm;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for WebNavLeft component.
  late WebNavLeftModel webNavLeftModel;
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
  List<String>? expyearmonthPC;
  // Stores action output result for [Backend Call - API (cloudTest)] action in Button widget.
  ApiCallResponse? apiResulthsmPafsadC;
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
    cardmbFocusNode?.dispose();
    cardmbController?.dispose();

    timembFocusNode?.dispose();
    timembController?.dispose();

    cvvmbFocusNode?.dispose();
    cvvmbController?.dispose();

    headerModel.dispose();
    webNavLeftModel.dispose();
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
