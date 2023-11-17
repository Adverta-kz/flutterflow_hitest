import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _textFromHtmlEditor =
          prefs.getString('ff_textFromHtmlEditor') ?? _textFromHtmlEditor;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _showFullList = true;
  bool get showFullList => _showFullList;
  set showFullList(bool _value) {
    _showFullList = _value;
  }

  String _textFromHtmlEditor = '';
  String get textFromHtmlEditor => _textFromHtmlEditor;
  set textFromHtmlEditor(String _value) {
    _textFromHtmlEditor = _value;
    prefs.setString('ff_textFromHtmlEditor', _value);
  }

  List<String> _rightAnswers = [];
  List<String> get rightAnswers => _rightAnswers;
  set rightAnswers(List<String> _value) {
    _rightAnswers = _value;
  }

  void addToRightAnswers(String _value) {
    _rightAnswers.add(_value);
  }

  void removeFromRightAnswers(String _value) {
    _rightAnswers.remove(_value);
  }

  void removeAtIndexFromRightAnswers(int _index) {
    _rightAnswers.removeAt(_index);
  }

  void updateRightAnswersAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _rightAnswers[_index] = updateFn(_rightAnswers[_index]);
  }

  void insertAtIndexInRightAnswers(int _index, String _value) {
    _rightAnswers.insert(_index, _value);
  }

  List<String> _userAnswers = [];
  List<String> get userAnswers => _userAnswers;
  set userAnswers(List<String> _value) {
    _userAnswers = _value;
  }

  void addToUserAnswers(String _value) {
    _userAnswers.add(_value);
  }

  void removeFromUserAnswers(String _value) {
    _userAnswers.remove(_value);
  }

  void removeAtIndexFromUserAnswers(int _index) {
    _userAnswers.removeAt(_index);
  }

  void updateUserAnswersAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _userAnswers[_index] = updateFn(_userAnswers[_index]);
  }

  void insertAtIndexInUserAnswers(int _index, String _value) {
    _userAnswers.insert(_index, _value);
  }

  int _timerMs = 0;
  int get timerMs => _timerMs;
  set timerMs(int _value) {
    _timerMs = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
