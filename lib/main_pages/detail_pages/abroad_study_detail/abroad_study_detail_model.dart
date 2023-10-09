import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/consult_form/consult_form_widget.dart';
import '/components/consult_form_mobile/consult_form_mobile_widget.dart';
import '/components/footer/footer_widget.dart';
import '/components/header/header_widget.dart';
import '/components/web_nav_left/web_nav_left_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'abroad_study_detail_widget.dart' show AbroadStudyDetailWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AbroadStudyDetailModel extends FlutterFlowModel<AbroadStudyDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for header component.
  late HeaderModel headerModel;
  // Model for WebNavLeft component.
  late WebNavLeftModel webNavLeftModel;
  // Model for consultForm component.
  late ConsultFormModel consultFormModel;
  // Model for footer component.
  late FooterModel footerModel;
  // Model for consultFormMobile component.
  late ConsultFormMobileModel consultFormMobileModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    webNavLeftModel = createModel(context, () => WebNavLeftModel());
    consultFormModel = createModel(context, () => ConsultFormModel());
    footerModel = createModel(context, () => FooterModel());
    consultFormMobileModel =
        createModel(context, () => ConsultFormMobileModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    webNavLeftModel.dispose();
    consultFormModel.dispose();
    footerModel.dispose();
    consultFormMobileModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
