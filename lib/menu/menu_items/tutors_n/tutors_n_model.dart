import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/header/header_widget.dart';
import '/components/web_nav_left/web_nav_left_widget.dart';
import '/components/web_nav_right/web_nav_right_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'tutors_n_widget.dart' show TutorsNWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class TutorsNModel extends FlutterFlowModel<TutorsNWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<TutorsRecord> simpleSearchResults = [];
  // State field(s) for ChoiceChipsmb widget.
  String? choiceChipsmbValue;
  FormFieldController<List<String>>? choiceChipsmbValueController;
  // State field(s) for ChoiceChipsMbfORMAT widget.
  String? choiceChipsMbfORMATValue;
  FormFieldController<List<String>>? choiceChipsMbfORMATValueController;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for WebNavLeft component.
  late WebNavLeftModel webNavLeftModel;
  // State field(s) for ChoiceChipsPC widget.
  String? choiceChipsPCValue;
  FormFieldController<List<String>>? choiceChipsPCValueController;
  // State field(s) for ChoiceChipsPCfORMAT widget.
  String? choiceChipsPCfORMATValue;
  FormFieldController<List<String>>? choiceChipsPCfORMATValueController;
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
    textController?.dispose();
    headerModel.dispose();
    webNavLeftModel.dispose();
    webNavRightModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
