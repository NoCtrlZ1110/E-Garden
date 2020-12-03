import 'package:flutter/material.dart';

class LearnModel extends ChangeNotifier {
  List<String> _words = ['Tree', "Sun", 'Sleep', 'Car', 'Hot'];

  get words => _words;
  List<String> _meaningWords = ['Cái cây', "Mặt trời", 'Đi ngủ', 'Ô tô', 'Nóng'];

  get meaningWords => _meaningWords;
  List<String> _exampleWords = [
    "This is a tree.",
    "The sun rises at 5.am.",
    "The girl is sleeping",
    'My brother has a black car.',
    "It's hot today"
  ];
  List <String> wordImages = [
    'assets/images/tree.jpg',
    'assets/images/sun.png',
    'assets/images/sleep.jpg',
    'assets/images/car.jpg',
    'assets/images/hot.jpg'
  ];

  get exampleWords => _exampleWords;
  List<String> _exampleSentences = [
    "If water is frozen, it expands. ",
    "If he says 'I love you', she will feel extremely happy.",
    "If I were you, I would follow her advice.",
    "If I had studied the lessons, I could have answered the questions.",
    "I wish I would be a teacher in the future."
  ];

  get exampleSentences => _exampleSentences;
  List<String> _grammar = [
    "If + S + V(s,es), S+ V(s,es)/câu mệnh lệnh",
    "IF + S + V (present), S + will + V-inf ...",
    "If + S + V2/ Ved, S +would/ Could/ Should…+ V",
    "If + S + Had + V(pp)/Ved, S + would/ could…+ have + V(pp)/Ved",
    "S + wish (es) + S + would / could + V1"
  ];

  get meaningSentences => _meaningSentences;
  List<String> _meaningSentences = [
    "Câu điều kiện loại 0",
    "Câu điều kiện loại I",
    "Câu điều kiện loại II",
    "Câu điều kiện loại III",
    "Câu cầu ước."
  ];

  get grammar => _grammar;

  List<String> _typeWords = ['Noun', "Noun", 'Verb', 'Noun', 'Adjective'];

  get typeWords => _typeWords;
  List<String> _typeSentences = ['Example', "Example", 'Example', 'Example', 'Example'];

  get typeSentences => _typeSentences;
  int _index = 0;
  get index => _index;

  void increase(index) {
    if (index < 4) {
      index++;
    } else
      index = 0;
    _index = index;
    notifyListeners();
  }

  void decrease(index) {
    if (index > 0) {
      index--;
    } else
      index = 4;
    _index = index;
    notifyListeners();
  }

  void initModel() {
    _index = 0;
  }
  bool _isFrontCard = true;
  get isFrontCard => _isFrontCard;
  void flipCard(){
    _isFrontCard = ! _isFrontCard;
    notifyListeners();
  }
}
