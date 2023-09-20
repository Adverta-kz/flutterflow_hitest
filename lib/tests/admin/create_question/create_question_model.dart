import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateQuestionModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<OptionsStruct> questionOptions = [];
  void addToQuestionOptions(OptionsStruct item) => questionOptions.add(item);
  void removeFromQuestionOptions(OptionsStruct item) =>
      questionOptions.remove(item);
  void removeAtIndexFromQuestionOptions(int index) =>
      questionOptions.removeAt(index);
  void updateQuestionOptionsAtIndex(
          int index, Function(OptionsStruct) updateFn) =>
      questionOptions[index] = updateFn(questionOptions[index]);

  String? correctAnswer = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for optionName widget.
  TextEditingController? optionNameController;
  String? Function(BuildContext, String?)? optionNameControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuestionsRecord? question;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController1?.dispose();
    textController2?.dispose();
    optionNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
