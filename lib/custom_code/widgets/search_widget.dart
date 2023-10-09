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

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];

  Future<void> _search() async {
    final String query = _searchController.text;
    final List<DocumentSnapshot> documents = await queryCollections(query);
    setState(() {
      _searchResults = documents;
    });
  }

  Future<List<DocumentSnapshot>> queryCollections(String query) async {
    final List<String> collections = [
      // 'quizzes',
      'tournaments',
      // 'news',
      // 'courses',
      // 'tutors',
      // 'online_study',
      // 'study_abroad',
      // 'work_abroad',
      // 'promotions'
    ];
    final List<DocumentSnapshot> documents = [];

    for (String collection in collections) {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(collection)
          .where('name', isEqualTo: query)
          .get();
      documents.addAll(snapshot.docs);
    }

    return documents;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Fixed typo here
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // Fixed typo here
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'ArchitectsDaughter',
            ),
            decoration: InputDecoration(
              hintText: 'Search for a name...',
              hintStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.blue,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Fixed typo here
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Fixed typo here
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: IconButton(
                icon:
                    Icon(Icons.search, color: Colors.white), // Fixed typo here
                onPressed: _search,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _searchResults.length,
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot<Object?> result = _searchResults[index];
              final String collection = result.reference.parent.id;
              Widget leadingWidget;
              if (collection == 'tournaments') {
                leadingWidget = Text(
                  result.get('name'), // Fixed typo here
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ArchitectsDaughter',
                  ),
                );
              } else {
                leadingWidget = Text(
                  result.get('name'), // Fixed typo here
                  style: TextStyle(
                    color: Color.fromARGB(
                        255, 118, 255, 248), // Fixed color format
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ArchitectsDaughter', // Fixed typo here
                  ),
                );
              }
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 32, 39, 45), // Fixed color format
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                padding: EdgeInsets.all(16.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  tileColor: Colors.white,
                  leading: leadingWidget,
                  title: Text(
                    result.get('name'), // Fixed typo here
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Oswald',
                    ),
                  ),
                  subtitle: Text(
                    result.get('description'), // Fixed typo here
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 176, 255, 247), // Fixed color format
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Oswald',
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
