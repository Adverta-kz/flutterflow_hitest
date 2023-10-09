import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/footer/footer_widget.dart';
import '/components/header/header_widget.dart';
import '/components/web_nav_left/web_nav_left_widget.dart';
import '/components/web_nav_right/web_nav_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'balance_widget.dart' show BalanceWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BalanceModel extends FlutterFlowModel<BalanceWidget> {
  ///  Local state fields for this page.

  int? isSelected;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SURNAMEPC widget.
  TextEditingController? surnamepcController;
  String? Function(BuildContext, String?)? surnamepcControllerValidator;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for WebNavLeft component.
  late WebNavLeftModel webNavLeftModel;
  // State field(s) for money widget.
  TextEditingController? moneyController;
  String? Function(BuildContext, String?)? moneyControllerValidator;
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
    surnamepcController?.dispose();
    headerModel.dispose();
    webNavLeftModel.dispose();
    moneyController?.dispose();
    webNavRightModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
