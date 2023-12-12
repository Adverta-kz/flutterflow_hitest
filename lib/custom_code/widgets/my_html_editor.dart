// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/services.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class MyHtmlEditor extends StatefulWidget {
  const MyHtmlEditor({
    Key? key,
    this.width,
    this.height,
    this.currentHtml,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? currentHtml;

  @override
  _MyHtmlEditorState createState() => _MyHtmlEditorState();
}

class _MyHtmlEditorState extends State<MyHtmlEditor> {
  HtmlEditorController controller = HtmlEditorController();

  // Get a reference to the Firestore database
  final firestore = FirebaseFirestore.instance;

  // Get a reference to the collection
  late final CollectionReference<Object?> collectionRef;

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text))
        .then((_) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Text copied to clipboard'),
              ),
            ))
        .catchError((error) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to copy text'),
              ),
            ));
  }

  @override
  void initState() {
    super.initState();
    // Initialize the collection reference
    collectionRef = firestore.collection('htmleditor');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        HtmlEditor(
          controller: controller, //required
          htmlEditorOptions: HtmlEditorOptions(
            hint: "Type your Text here",
            initialText: widget.currentHtml,
          ),
          htmlToolbarOptions: HtmlToolbarOptions(
            toolbarType: ToolbarType.nativeGrid,
          ),
          otherOptions: OtherOptions(
            height: 400,
          ),
        ),
        FFButtonWidget(
          onPressed: () async {
            String data = await controller.getText();
            // save to Firebase
            final doc = {'htmltext': data};
            _copyToClipboard('Text to copy');
            collectionRef.limit(1).get().then((snapshot) {
              if (snapshot.docs.isNotEmpty) {
                // update document
                final docRef = snapshot.docs[0].reference;
                docRef.update(doc);
              } else {
                // create document
                collectionRef.add(doc);
              }

              // nav to a new page
              //   context.pushNamed(
              //     'actions',
              //     queryParams: {
              //       // TODO: Change the name of the parameter - 'id'
              //       'id': serializeParam(
              //         33,
              //         ParamType.String,
              //       ),
              //     }.withoutNulls,
              //   );
              // });

              // Update local state
              Clipboard.setData(ClipboardData(text: data));
              FFAppState().update(() {
                setState(() => FFAppState().textFromHtmlEditor = data);
              });
            });
          },
          text: 'Сохранить текст',
          options: FFButtonOptions(
            width: 130,
            height: 40,
            color: Color(0xFF0043A4),
            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    ));
  }
}
