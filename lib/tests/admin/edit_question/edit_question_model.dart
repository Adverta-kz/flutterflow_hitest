import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'edit_question_widget.dart' show EditQuestionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditQuestionModel extends FlutterFlowModel<EditQuestionWidget> {
  ///  Local state fields for this page.

  List<OptionsStruct> questionOptions = [];
  void addToQuestionOptions(OptionsStruct item) => questionOptions.add(item);
  void removeFromQuestionOptions(OptionsStruct item) =>
      questionOptions.remove(item);
  void removeAtIndexFromQuestionOptions(int index) =>
      questionOptions.removeAt(index);
  void insertAtIndexInQuestionOptions(int index, OptionsStruct item) =>
      questionOptions.insert(index, item);
  void updateQuestionOptionsAtIndex(
          int index, Function(OptionsStruct) updateFn) =>
      questionOptions[index] = updateFn(questionOptions[index]);

  String? correctAnswer = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for optionName widget.
  FocusNode? optionNameFocusNode;
  TextEditingController? optionNameController;
  String? Function(BuildContext, String?)? optionNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    optionNameFocusNode?.dispose();
    optionNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
