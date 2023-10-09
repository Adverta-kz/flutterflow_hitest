import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/header/header_widget.dart';
import '/components/web_nav_left/web_nav_left_widget.dart';
import '/components/web_nav_right/web_nav_right_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_details_model.dart';
export 'quiz_details_model.dart';

class QuizDetailsWidget extends StatefulWidget {
  const QuizDetailsWidget({
    Key? key,
    required this.quizRef,
  }) : super(key: key);

  final QuizzesRecord? quizRef;

  @override
  _QuizDetailsWidgetState createState() => _QuizDetailsWidgetState();
}

class _QuizDetailsWidgetState extends State<QuizDetailsWidget> {
  late QuizDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!((currentUserDocument?.paiedQuizes?.toList() ?? [])
              .contains(widget.quizRef?.reference) ||
          (currentUserReference == widget.quizRef?.createdBy))) {
        context.goNamed(
          'buyQuiz',
          queryParameters: {
            'quizRef': serializeParam(
              widget.quizRef,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'quizRef': widget.quizRef,
          },
        );
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
    context.watch<FFAppState>();

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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                color: FlutterFlowTheme.of(context).secondary,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.safePop();
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              currentUserDisplayName,
                                              'Гость',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      if (loggedIn)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 4.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('Balance');
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 4.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('HomePage');
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'avnqah5m' /* Зарегистрироваться/войти */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                      Align(
                        alignment: AlignmentDirectional(0.00, -1.00),
                        child: FutureBuilder<int>(
                          future: queryQuestionsRecordCount(
                            parent: widget.quizRef?.reference,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: LinearProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              );
                            }
                            int maxWidthCount = snapshot.data!;
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  widget.quizRef!.quizName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (valueOrDefault(
                                                      currentUserDocument?.role,
                                                      '') ==
                                                  'admin')
                                                AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        'createQuestion',
                                                        queryParameters: {
                                                          'quizRef':
                                                              serializeParam(
                                                            widget.quizRef,
                                                            ParamType.Document,
                                                          ),
                                                          'index':
                                                              serializeParam(
                                                            maxWidthCount + 1,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'quizRef':
                                                              widget.quizRef,
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'gt9byck0' /* Прохождение олимпиады */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.network(
                                                  getCORSProxyUrl(
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hi-test-jv4537/assets/tp5xxdc3xo7o/undraw_location_search_re_ttoj_(1).svg',
                                                  ),
                                                  width: 400.0,
                                                  height: 300.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                decoration: BoxDecoration(),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ],
                                      ),
                                      if (valueOrDefault(
                                              currentUserDocument?.role, '') ==
                                          'admin')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => StreamBuilder<
                                                List<QuestionsRecord>>(
                                              stream: queryQuestionsRecord(
                                                parent:
                                                    widget.quizRef?.reference,
                                                queryBuilder:
                                                    (questionsRecord) =>
                                                        questionsRecord
                                                            .orderBy('index'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child:
                                                        LinearProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  );
                                                }
                                                List<QuestionsRecord>
                                                    listViewQuestionsRecordList =
                                                    snapshot.data!;
                                                return ListView.separated(
                                                  padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    0,
                                                    0,
                                                    44.0,
                                                  ),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewQuestionsRecordList
                                                          .length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 12.0),
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewQuestionsRecord =
                                                        listViewQuestionsRecordList[
                                                            listViewIndex];
                                                    return FutureBuilder<int>(
                                                      future:
                                                          queryQuestionsRecordCount(
                                                        parent:
                                                            listViewQuestionsRecord
                                                                .parentReference,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child:
                                                                LinearProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          );
                                                        }
                                                        int containerCount =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (widget.quizRef
                                                                    ?.createdBy ==
                                                                currentUserReference) {
                                                              context.pushNamed(
                                                                'editQuestion',
                                                                queryParameters:
                                                                    {
                                                                  'questionRef':
                                                                      serializeParam(
                                                                    listViewQuestionsRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'questionRef':
                                                                      listViewQuestionsRecord,
                                                                },
                                                              );
                                                            }
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
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
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            226.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          listViewQuestionsRecord
                                                                              .question,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).titleLarge,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewQuestionsRecord.index.toString(),
                                                                            textAlign:
                                                                                TextAlign.end,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if ((listViewQuestionsRecord.index ==
                                                                              containerCount) &&
                                                                          (valueOrDefault(currentUserDocument?.role, '') ==
                                                                              'admin'))
                                                                        InkWell(
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
                                                                            await widget.quizRef!.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'listQuestions': FieldValue.arrayRemove([
                                                                                    listViewQuestionsRecord.reference
                                                                                  ]),
                                                                                  'numberQuestions': FieldValue.increment(-(1)),
                                                                                },
                                                                              ),
                                                                            });
                                                                            await listViewQuestionsRecord.reference.delete();
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.delete_outline,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        226.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        listViewQuestionsRecord
                                                                            .description,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
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
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                    ]
                                        .divide(SizedBox(height: 4.0))
                                        .addToStart(SizedBox(height: 12.0)),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          constraints: BoxConstraints(
                            maxWidth: 770.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 24.0, 16.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (widget.quizRef?.status == 'Published')
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        // create_QuizResults

                                        var quizResultRecordReference =
                                            QuizResultRecord.collection.doc();
                                        await quizResultRecordReference
                                            .set(createQuizResultRecordData(
                                          quizId:
                                              '${widget.quizRef?.reference.id}-${random_data.randomInteger(0, 200).toString()}',
                                          userRef: currentUserReference,
                                          score: 0.0,
                                          currentQuestion: 1,
                                          quizRef: widget.quizRef?.reference,
                                          createdAt: getCurrentTimestamp,
                                        ));
                                        _model.quizResult = QuizResultRecord
                                            .getDocumentFromData(
                                                createQuizResultRecordData(
                                                  quizId:
                                                      '${widget.quizRef?.reference.id}-${random_data.randomInteger(0, 200).toString()}',
                                                  userRef: currentUserReference,
                                                  score: 0.0,
                                                  currentQuestion: 1,
                                                  quizRef:
                                                      widget.quizRef?.reference,
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                ),
                                                quizResultRecordReference);
                                        // addQuizResult_ToList

                                        await widget.quizRef!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'results': FieldValue.arrayUnion([
                                                _model.quizResult?.reference
                                              ]),
                                              'usersList':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });

                                        context.pushNamed(
                                          'quiz_QuestionDetails',
                                          queryParameters: {
                                            'quizRef': serializeParam(
                                              widget.quizRef,
                                              ParamType.Document,
                                            ),
                                            'quizResult': serializeParam(
                                              _model.quizResult,
                                              ParamType.Document,
                                            ),
                                            'index': serializeParam(
                                              _model
                                                  .quizResult?.currentQuestion,
                                              ParamType.int,
                                            ),
                                            'score': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'quizRef': widget.quizRef,
                                            'quizResult': _model.quizResult,
                                          },
                                        );

                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '3833p9oo' /* Начать */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 44.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        hoverBorderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        hoverTextColor:
                                            FlutterFlowTheme.of(context).info,
                                        hoverElevation: 3.0,
                                      ),
                                    ),
                                  ),
                                if (valueOrDefault(
                                        currentUserDocument?.role, '') ==
                                    'admin')
                                  Expanded(
                                    child: AuthUserStreamWidget(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          await widget.quizRef!.reference
                                              .update(createQuizzesRecordData(
                                            status: 'Published',
                                            lastModifiedAt: getCurrentTimestamp,
                                            numberQuestions: widget
                                                .quizRef?.listQuestions?.length,
                                            totalPoints: widget.quizRef!
                                                    .listQuestions.length *
                                                100,
                                          ));

                                          context.goNamed(
                                            'quizPage',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .leftToRight,
                                                duration:
                                                    Duration(milliseconds: 250),
                                              ),
                                            },
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'csv0mhyz' /* Опубликовать */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 44.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall,
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          hoverBorderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          hoverTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          hoverElevation: 0.0,
                                        ),
                                      ),
                                    ),
                                  ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FutureBuilder<int>(
                                      future: queryQuestionsRecordCount(
                                        parent: widget.quizRef?.reference,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: LinearProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          );
                                        }
                                        int maxWidthCount = snapshot.data!;
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            widget.quizRef!
                                                                .quizName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.role,
                                                                  '') ==
                                                              'admin')
                                                            AuthUserStreamWidget(
                                                              builder: (context) =>
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'createQuestion',
                                                                    queryParameters:
                                                                        {
                                                                      'quizRef':
                                                                          serializeParam(
                                                                        widget
                                                                            .quizRef,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'index':
                                                                          serializeParam(
                                                                        maxWidthCount +
                                                                            1,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'quizRef':
                                                                          widget
                                                                              .quizRef,
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'hblp6yeu' /* Прохождение олимпиады */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge,
                                                    ),
                                                  ),
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.role,
                                                          '') ==
                                                      'admin')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            StreamBuilder<
                                                                List<
                                                                    QuestionsRecord>>(
                                                          stream:
                                                              queryQuestionsRecord(
                                                            parent: widget
                                                                .quizRef
                                                                ?.reference,
                                                            queryBuilder:
                                                                (questionsRecord) =>
                                                                    questionsRecord
                                                                        .orderBy(
                                                                            'index'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child:
                                                                    LinearProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              );
                                                            }
                                                            List<QuestionsRecord>
                                                                listViewQuestionsRecordList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                0,
                                                                0,
                                                                44.0,
                                                              ),
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewQuestionsRecordList
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          12.0),
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewQuestionsRecord =
                                                                    listViewQuestionsRecordList[
                                                                        listViewIndex];
                                                                return FutureBuilder<
                                                                    int>(
                                                                  future:
                                                                      queryQuestionsRecordCount(
                                                                    parent: listViewQuestionsRecord
                                                                        .parentReference,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            LinearProgressIndicator(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                      );
                                                                    }
                                                                    int containerCount =
                                                                        snapshot
                                                                            .data!;
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (widget.quizRef?.createdBy ==
                                                                            currentUserReference) {
                                                                          context
                                                                              .pushNamed(
                                                                            'editQuestion',
                                                                            queryParameters:
                                                                                {
                                                                              'questionRef': serializeParam(
                                                                                listViewQuestionsRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'questionRef': listViewQuestionsRecord,
                                                                            },
                                                                          );
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                1.0,
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
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 226.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Text(
                                                                                      listViewQuestionsRecord.question,
                                                                                      style: FlutterFlowTheme.of(context).titleLarge,
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewQuestionsRecord.index.toString(),
                                                                                        textAlign: TextAlign.end,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  if ((listViewQuestionsRecord.index == containerCount) && (valueOrDefault(currentUserDocument?.role, '') == 'admin'))
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await widget.quizRef!.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'listQuestions': FieldValue.arrayRemove([
                                                                                                listViewQuestionsRecord.reference
                                                                                              ]),
                                                                                              'numberQuestions': FieldValue.increment(-(1)),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                        await listViewQuestionsRecord.reference.delete();
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.delete_outline,
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              Container(
                                                                                width: 226.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    listViewQuestionsRecord.description,
                                                                                    style: FlutterFlowTheme.of(context).labelMedium,
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
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: SvgPicture
                                                                .network(
                                                              getCORSProxyUrl(
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hi-test-jv4537/assets/tp5xxdc3xo7o/undraw_location_search_re_ttoj_(1).svg',
                                                              ),
                                                              width: 500.0,
                                                              height: 500.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 4.0))
                                                    .addToStart(
                                                        SizedBox(height: 12.0)),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 1.00),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        constraints: BoxConstraints(
                                          maxWidth: 770.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 16.0, 16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (widget.quizRef?.status ==
                                                  'Published')
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      // create_QuizResults

                                                      var quizResultRecordReference =
                                                          QuizResultRecord
                                                              .collection
                                                              .doc();
                                                      await quizResultRecordReference
                                                          .set(
                                                              createQuizResultRecordData(
                                                        quizId:
                                                            '${widget.quizRef?.reference.id}-${random_data.randomInteger(0, 200).toString()}',
                                                        userRef:
                                                            currentUserReference,
                                                        score: 0.0,
                                                        currentQuestion: 1,
                                                        quizRef: widget
                                                            .quizRef?.reference,
                                                        createdAt:
                                                            getCurrentTimestamp,
                                                      ));
                                                      _model.quizResultPC =
                                                          QuizResultRecord
                                                              .getDocumentFromData(
                                                                  createQuizResultRecordData(
                                                                    quizId:
                                                                        '${widget.quizRef?.reference.id}-${random_data.randomInteger(0, 200).toString()}',
                                                                    userRef:
                                                                        currentUserReference,
                                                                    score: 0.0,
                                                                    currentQuestion:
                                                                        1,
                                                                    quizRef: widget
                                                                        .quizRef
                                                                        ?.reference,
                                                                    createdAt:
                                                                        getCurrentTimestamp,
                                                                  ),
                                                                  quizResultRecordReference);
                                                      // addQuizResult_ToList

                                                      await widget
                                                          .quizRef!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'usersList':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });

                                                      context.pushNamed(
                                                        'quiz_QuestionDetails',
                                                        queryParameters: {
                                                          'quizRef':
                                                              serializeParam(
                                                            widget.quizRef,
                                                            ParamType.Document,
                                                          ),
                                                          'quizResult':
                                                              serializeParam(
                                                            _model.quizResultPC,
                                                            ParamType.Document,
                                                          ),
                                                          'index':
                                                              serializeParam(
                                                            _model.quizResultPC
                                                                ?.currentQuestion,
                                                            ParamType.int,
                                                          ),
                                                          'score':
                                                              serializeParam(
                                                            0,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'quizRef':
                                                              widget.quizRef,
                                                          'quizResult': _model
                                                              .quizResultPC,
                                                        },
                                                      );

                                                      setState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'ahtsyu78' /* Начать */,
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
                                                              .secondary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      hoverBorderSide:
                                                          BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      hoverTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      hoverElevation: 3.0,
                                                    ),
                                                  ),
                                                ),
                                              if (valueOrDefault(
                                                      currentUserDocument?.role,
                                                      '') ==
                                                  'admin')
                                                Expanded(
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        await widget
                                                            .quizRef!.reference
                                                            .update(
                                                                createQuizzesRecordData(
                                                          status: 'Published',
                                                          lastModifiedAt:
                                                              getCurrentTimestamp,
                                                          numberQuestions: widget
                                                              .quizRef
                                                              ?.listQuestions
                                                              ?.length,
                                                          totalPoints: widget
                                                                  .quizRef!
                                                                  .listQuestions
                                                                  .length *
                                                              100,
                                                        ));

                                                        context.goNamed(
                                                          'quizPage',
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .leftToRight,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      250),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7x73y96c' /* Опубликовать */,
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
                                                                  fontSize:
                                                                      18.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        hoverBorderSide:
                                                            BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        hoverTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        hoverElevation: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.12,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
