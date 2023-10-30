import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/header/header_widget.dart';
import '/components/web_nav_left/web_nav_left_widget.dart';
import '/components/web_nav_right/web_nav_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_question_details_model.dart';
export 'quiz_question_details_model.dart';

class QuizQuestionDetailsWidget extends StatefulWidget {
  const QuizQuestionDetailsWidget({
    Key? key,
    required this.quizRef,
    required this.quizResult,
    required this.index,
    this.score,
    this.timer,
  }) : super(key: key);

  final QuizzesRecord? quizRef;
  final QuizResultRecord? quizResult;
  final int? index;
  final int? score;
  final int? timer;

  @override
  _QuizQuestionDetailsWidgetState createState() =>
      _QuizQuestionDetailsWidgetState();
}

class _QuizQuestionDetailsWidgetState extends State<QuizQuestionDetailsWidget> {
  late QuizQuestionDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizQuestionDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.answerCorrect = false;
        _model.answerWrong = false;
        _model.selectedAnswer = 'none';
      });
      if (widget.timer != null) {
        _model.timerPCController.timer.setPresetTime(
          mSec: widget.timer!,
          add: false,
        );
        _model.timerPCController.onResetTimer();

        _model.timerPCController.onStartTimer();
        _model.timerMbController.timer.setPresetTime(
          mSec: widget.timer!,
          add: false,
        );
        _model.timerMbController.onResetTimer();

        _model.timerMbController.onStartTimer();
      } else {
        _model.timerPCController.onStartTimer();
        _model.timerMbController.onStartTimer();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<QuestionsRecord>>(
      stream: queryQuestionsRecord(
        parent: widget.quizRef?.reference,
        queryBuilder: (questionsRecord) => questionsRecord.where(
          'index',
          isEqualTo: widget.index,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: LinearProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<QuestionsRecord> quizQuestionDetailsQuestionsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final quizQuestionDetailsQuestionsRecord =
            quizQuestionDetailsQuestionsRecordList.isNotEmpty
                ? quizQuestionDetailsQuestionsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      desktop: false,
                    ))
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.65),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 25.0, 0.0, 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                            ),
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.safePop();
                                              },
                                              child: Icon(
                                                Icons.arrow_back,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: SvgPicture.network(
                                                getCORSProxyUrl(
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hi-test-jv4537/assets/1yxwi0m6afsx/undraw_male_avatar_g98d.svg',
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    currentUserDisplayName,
                                                    'Гость',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (loggedIn)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 4.0, 0.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context
                                                          .pushNamed('Balance');
                                                    },
                                                    child: Text(
                                                      'Баланс: ${valueOrDefault<String>(
                                                        valueOrDefault(
                                                                currentUserDocument
                                                                    ?.balance,
                                                                0.0)
                                                            .toString(),
                                                        '0',
                                                      )} тг.',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            fontSize: 14.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (!loggedIn)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 4.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context
                                                        .pushNamed('HomePage');
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'pm6as7r9' /* Зарегистрироваться/войти */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 24.0, 0.0),
                                        child: RichText(
                                          textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  widget.index?.toString(),
                                                  '0',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'yaje1yv5' /* / */,
                                                ),
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: widget.quizRef!
                                                    .listQuestions.length
                                                    .toString(),
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.00, 0.00),
                                              child: RichText(
                                                textScaleFactor:
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        widget.index
                                                            ?.toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xgvkisbv' /* / */,
                                                      ),
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: widget.quizRef!
                                                          .listQuestions.length
                                                          .toString(),
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Text(
                                      widget.quizRef!.quizName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    if (false)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'i3etbi8e' /* Текущий результат:  */,
                                                  ),
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    widget.score?.toString(),
                                                    '0',
                                                  ),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    FlutterFlowTimer(
                                      initialTime: _model.timerMbMilliseconds,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        milliSecond: false,
                                      ),
                                      controller: _model.timerMbController,
                                      updateStateInterval:
                                          Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timerMbMilliseconds = value;
                                        _model.timerMbValue = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: LinearPercentIndicator(
                                              percent:
                                                  functions
                                                      .progressBarValueDemo(
                                                          widget
                                                              .quizRef
                                                              ?.listQuestions
                                                              ?.length,
                                                          widget.index),
                                              width: 360.0,
                                              lineHeight: 12.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              barRadius: Radius.circular(12.0),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 32.0,
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            quizQuestionDetailsQuestionsRecord!
                                                .question,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              quizQuestionDetailsQuestionsRecord!
                                                  .description,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final options =
                                                    quizQuestionDetailsQuestionsRecord
                                                            ?.options
                                                            ?.toList() ??
                                                        [];
                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: options.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 16.0),
                                                  itemBuilder:
                                                      (context, optionsIndex) {
                                                    final optionsItem =
                                                        options[optionsIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.selectedAnswer =
                                                              optionsItem
                                                                  .optionName;
                                                        });
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        curve: Curves.easeInOut,
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: optionsItem
                                                                      .optionName ==
                                                                  _model
                                                                      .selectedAnswer
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: optionsItem
                                                                        .optionName ==
                                                                    _model
                                                                        .selectedAnswer
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      12.0,
                                                                      12.0,
                                                                      12.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    optionsItem
                                                                        .optionName,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color: optionsItem.optionName == _model.selectedAnswer
                                                                              ? Colors.white
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              17.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ].addToEnd(SizedBox(height: 44.0)),
                                      ),
                                    ),
                                    if (false)
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 12.0, 12.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'lsqjlvg8' /* Отличная работа */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '28r2p366' /* Вы ответили правильно */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          's7lbcixt' /* +100 Points */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons
                                                    .check_circle_outline_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 32.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (false)
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0x4DEE6262),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 12.0,
                                                          12.0, 12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'fz6kybhu' /* Неправильно */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'gau5krdk' /* Вы ответили неправильно */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.error_outline_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                size: 32.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ]
                                      .divide(SizedBox(height: 4.0))
                                      .addToEnd(SizedBox(height: 24.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.selectedAnswer ==
                                            quizQuestionDetailsQuestionsRecord
                                                ?.correctAnswer) {
                                          setState(() {
                                            _model.answerCorrect = true;
                                          });
                                          // updateQuizRef

                                          await widget.quizResult!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'currentQuestion':
                                                    FieldValue.increment(1),
                                                'answers':
                                                    FieldValue.arrayUnion([
                                                  _model.selectedAnswer
                                                ]),
                                                'score':
                                                    FieldValue.increment(100.0),
                                              },
                                            ),
                                          });
                                          await Future.delayed(const Duration(
                                              milliseconds: 1200));
                                          if (widget.index ==
                                              widget.quizRef?.listQuestions
                                                  ?.length) {
                                            // updateQuiz_WithFinalScore

                                            await widget.quizRef!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'overallscore':
                                                      FieldValue.increment(
                                                          widget.score! + 100),
                                                },
                                              ),
                                            });

                                            await widget.quizResult!.reference
                                                .update(
                                                    createQuizResultRecordData(
                                              time: _model.timerMbValue,
                                              timeinms:
                                                  _model.timerMbMilliseconds,
                                            ));

                                            context.pushNamed(
                                              'quizCompleteSummary',
                                              queryParameters: {
                                                'quizRef': serializeParam(
                                                  widget.quizRef,
                                                  ParamType.Document,
                                                ),
                                                'totalPoints': serializeParam(
                                                  widget.score! + 100,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'quizRef': widget.quizRef,
                                              },
                                            );
                                          } else {
                                            context.pushNamed(
                                              'quiz_QuestionDetails',
                                              queryParameters: {
                                                'quizRef': serializeParam(
                                                  widget.quizRef,
                                                  ParamType.Document,
                                                ),
                                                'quizResult': serializeParam(
                                                  widget.quizResult,
                                                  ParamType.Document,
                                                ),
                                                'index': serializeParam(
                                                  functions.increaseIndex(
                                                      widget.index),
                                                  ParamType.int,
                                                ),
                                                'score': serializeParam(
                                                  widget.score! + 100,
                                                  ParamType.int,
                                                ),
                                                'timer': serializeParam(
                                                  _model.timerMbMilliseconds,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'quizRef': widget.quizRef,
                                                'quizResult': widget.quizResult,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        } else {
                                          setState(() {
                                            _model.answerWrong = true;
                                          });
                                          // updateQuizRef

                                          await widget.quizResult!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'currentQuestion':
                                                    FieldValue.increment(1),
                                                'answers':
                                                    FieldValue.arrayUnion([
                                                  _model.selectedAnswer
                                                ]),
                                              },
                                            ),
                                          });
                                          await Future.delayed(const Duration(
                                              milliseconds: 1200));
                                          if (widget.index ==
                                              widget.quizRef?.listQuestions
                                                  ?.length) {
                                            // updateQuiz_WithFinalScore

                                            await widget.quizRef!.reference
                                                .update(createQuizzesRecordData(
                                              overallscore: widget.score,
                                            ));

                                            await widget.quizResult!.reference
                                                .update(
                                                    createQuizResultRecordData(
                                              time: _model.timerMbValue,
                                              timeinms:
                                                  _model.timerMbMilliseconds,
                                            ));

                                            context.pushNamed(
                                              'quizCompleteSummary',
                                              queryParameters: {
                                                'quizRef': serializeParam(
                                                  widget.quizRef,
                                                  ParamType.Document,
                                                ),
                                                'totalPoints': serializeParam(
                                                  widget.score,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'quizRef': widget.quizRef,
                                              },
                                            );
                                          } else {
                                            context.pushNamed(
                                              'quiz_QuestionDetails',
                                              queryParameters: {
                                                'quizRef': serializeParam(
                                                  widget.quizRef,
                                                  ParamType.Document,
                                                ),
                                                'quizResult': serializeParam(
                                                  widget.quizResult,
                                                  ParamType.Document,
                                                ),
                                                'index': serializeParam(
                                                  functions.increaseIndex(
                                                      widget.index),
                                                  ParamType.int,
                                                ),
                                                'score': serializeParam(
                                                  widget.score,
                                                  ParamType.int,
                                                ),
                                                'timer': serializeParam(
                                                  _model.timerMbMilliseconds,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'quizRef': widget.quizRef,
                                                'quizResult': widget.quizResult,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        }

                                        setState(() {
                                          FFAppState().addToUserAnswers(
                                              _model.selectedAnswer!);
                                        });
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '9d49jpk9' /* Дальше */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 44.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        hoverColor: Color(0x4C422CE5),
                                        hoverTextColor: Colors.white,
                                        hoverElevation: 0.0,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.headerModel,
                              updateCallback: () => setState(() {}),
                              child: HeaderWidget(),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: wrapWithModel(
                                      model: _model.webNavLeftModel,
                                      updateCallback: () => setState(() {}),
                                      child: WebNavLeftWidget(),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 10.0, 16.0, 0.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          child: RichText(
                                                            textScaleFactor:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaleFactor,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    widget.index
                                                                        ?.toString(),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'm16q5twx' /* / */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text: widget
                                                                      .quizRef!
                                                                      .listQuestions
                                                                      .length
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        widget
                                                            .quizRef!.quizName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                      if (false)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.00, 0.00),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: RichText(
                                                              textScaleFactor:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaleFactor,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'nnv0nu6m' /* Текущий результат:  */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(),
                                                                  ),
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .score
                                                                          ?.toString(),
                                                                      '0',
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      FlutterFlowTimer(
                                                        initialTime: _model
                                                            .timerPCMilliseconds,
                                                        getDisplayTime: (value) =>
                                                            StopWatchTimer
                                                                .getDisplayTime(
                                                          value,
                                                          hours: false,
                                                          milliSecond: false,
                                                        ),
                                                        controller: _model
                                                            .timerPCController,
                                                        updateStateInterval:
                                                            Duration(
                                                                milliseconds:
                                                                    1000),
                                                        onChanged: (value,
                                                            displayTime,
                                                            shouldUpdate) {
                                                          _model.timerPCMilliseconds =
                                                              value;
                                                          _model.timerPCValue =
                                                              displayTime;
                                                          if (shouldUpdate)
                                                            setState(() {});
                                                        },
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall,
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  LinearPercentIndicator(
                                                                percent: functions.progressBarValueDemo(
                                                                    widget
                                                                        .quizRef
                                                                        ?.listQuestions
                                                                        ?.length,
                                                                    widget
                                                                        .index),
                                                                lineHeight:
                                                                    12.0,
                                                                animation: true,
                                                                animateFromLastPercent:
                                                                    true,
                                                                progressColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                barRadius: Radius
                                                                    .circular(
                                                                        12.0),
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                        height: 32.0,
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              quizQuestionDetailsQuestionsRecord!
                                                                  .question,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                quizQuestionDetailsQuestionsRecord!
                                                                    .description,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final options =
                                                                      quizQuestionDetailsQuestionsRecord
                                                                              ?.options
                                                                              ?.toList() ??
                                                                          [];
                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        options
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                16.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            optionsIndex) {
                                                                      final optionsItem =
                                                                          options[
                                                                              optionsIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            _model.selectedAnswer =
                                                                                optionsItem.optionName;
                                                                          });
                                                                        },
                                                                        child:
                                                                            AnimatedContainer(
                                                                          duration:
                                                                              Duration(milliseconds: 200),
                                                                          curve:
                                                                              Curves.easeInOut,
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: optionsItem.optionName == _model.selectedAnswer
                                                                                ? FlutterFlowTheme.of(context).secondary
                                                                                : FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: optionsItem.optionName == _model.selectedAnswer ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).primaryBackground,
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                12.0,
                                                                                12.0,
                                                                                12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                    child: Text(
                                                                                      optionsItem.optionName,
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: optionsItem.optionName == _model.selectedAnswer ? Colors.white : FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 20.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ].addToEnd(SizedBox(
                                                              height: 44.0)),
                                                        ),
                                                      ),
                                                      if (false)
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'nojhjir5' /* Отличная работа */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '6xpdm324' /* Вы ответили правильно */,
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'blc0fjmg' /* +100 Points */,
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).headlineLarge,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .check_circle_outline_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 32.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      if (false)
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x4DEE6262),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '1hjurq8w' /* Неправильно */,
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).headlineSmall,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'oy3j7qel' /* Вы ответили неправильно */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .error_outline_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  size: 32.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 4.0))
                                                        .addToEnd(SizedBox(
                                                            height: 24.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (_model
                                                              .selectedAnswer ==
                                                          quizQuestionDetailsQuestionsRecord
                                                              ?.correctAnswer) {
                                                        setState(() {
                                                          _model.answerCorrect =
                                                              true;
                                                        });
                                                        // updateQuizRef

                                                        await widget.quizResult!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'currentQuestion':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                              'answers': FieldValue
                                                                  .arrayUnion([
                                                                _model
                                                                    .selectedAnswer
                                                              ]),
                                                              'score': FieldValue
                                                                  .increment(
                                                                      100.0),
                                                            },
                                                          ),
                                                        });
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1200));
                                                        if (widget.index ==
                                                            widget
                                                                .quizRef
                                                                ?.listQuestions
                                                                ?.length) {
                                                          // updateQuiz_WithFinalScore

                                                          await widget.quizRef!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'overallscore':
                                                                    FieldValue.increment(
                                                                        widget.score! +
                                                                            100),
                                                              },
                                                            ),
                                                          });

                                                          await widget
                                                              .quizResult!
                                                              .reference
                                                              .update(
                                                                  createQuizResultRecordData(
                                                            time: _model
                                                                .timerPCValue,
                                                            timeinms: _model
                                                                .timerPCMilliseconds,
                                                          ));

                                                          context.pushNamed(
                                                            'quizCompleteSummary',
                                                            queryParameters: {
                                                              'quizRef':
                                                                  serializeParam(
                                                                widget.quizRef,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'totalPoints':
                                                                  serializeParam(
                                                                widget.score! +
                                                                    100,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'quizRef': widget
                                                                  .quizRef,
                                                            },
                                                          );
                                                        } else {
                                                          context.pushNamed(
                                                            'quiz_QuestionDetails',
                                                            queryParameters: {
                                                              'quizRef':
                                                                  serializeParam(
                                                                widget.quizRef,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'quizResult':
                                                                  serializeParam(
                                                                widget
                                                                    .quizResult,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'index':
                                                                  serializeParam(
                                                                functions
                                                                    .increaseIndex(
                                                                        widget
                                                                            .index),
                                                                ParamType.int,
                                                              ),
                                                              'score':
                                                                  serializeParam(
                                                                widget.score! +
                                                                    100,
                                                                ParamType.int,
                                                              ),
                                                              'timer':
                                                                  serializeParam(
                                                                _model
                                                                    .timerPCMilliseconds,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'quizRef': widget
                                                                  .quizRef,
                                                              'quizResult': widget
                                                                  .quizResult,
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );
                                                        }
                                                      } else {
                                                        setState(() {
                                                          _model.answerWrong =
                                                              true;
                                                        });
                                                        // updateQuizRef

                                                        await widget.quizResult!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'currentQuestion':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                              'answers': FieldValue
                                                                  .arrayUnion([
                                                                _model
                                                                    .selectedAnswer
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1200));
                                                        if (widget.index ==
                                                            widget
                                                                .quizRef
                                                                ?.listQuestions
                                                                ?.length) {
                                                          // updateQuiz_WithFinalScore

                                                          await widget.quizRef!
                                                              .reference
                                                              .update(
                                                                  createQuizzesRecordData(
                                                            overallscore:
                                                                widget.score,
                                                          ));

                                                          await widget
                                                              .quizResult!
                                                              .reference
                                                              .update(
                                                                  createQuizResultRecordData(
                                                            time: _model
                                                                .timerPCValue,
                                                            timeinms: _model
                                                                .timerPCMilliseconds,
                                                          ));

                                                          context.pushNamed(
                                                            'quizCompleteSummary',
                                                            queryParameters: {
                                                              'quizRef':
                                                                  serializeParam(
                                                                widget.quizRef,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'totalPoints':
                                                                  serializeParam(
                                                                widget.score,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'quizRef': widget
                                                                  .quizRef,
                                                            },
                                                          );
                                                        } else {
                                                          context.pushNamed(
                                                            'quiz_QuestionDetails',
                                                            queryParameters: {
                                                              'quizRef':
                                                                  serializeParam(
                                                                widget.quizRef,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'quizResult':
                                                                  serializeParam(
                                                                widget
                                                                    .quizResult,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'index':
                                                                  serializeParam(
                                                                functions
                                                                    .increaseIndex(
                                                                        widget
                                                                            .index),
                                                                ParamType.int,
                                                              ),
                                                              'score':
                                                                  serializeParam(
                                                                widget.score,
                                                                ParamType.int,
                                                              ),
                                                              'timer':
                                                                  serializeParam(
                                                                _model
                                                                    .timerPCMilliseconds,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'quizRef': widget
                                                                  .quizRef,
                                                              'quizResult': widget
                                                                  .quizResult,
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );
                                                        }
                                                      }

                                                      setState(() {
                                                        FFAppState()
                                                            .addToUserAnswers(_model
                                                                .selectedAnswer!);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'ndv4jzgt' /* Дальше */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 44.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 24.0,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      hoverColor:
                                                          Color(0x4C422CE5),
                                                      hoverTextColor:
                                                          Colors.white,
                                                      hoverElevation: 0.0,
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.12,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: wrapWithModel(
                                      model: _model.webNavRightModel,
                                      updateCallback: () => setState(() {}),
                                      child: WebNavRightWidget(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            wrapWithModel(
                              model: _model.footerModel,
                              updateCallback: () => setState(() {}),
                              child: FooterWidget(),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
