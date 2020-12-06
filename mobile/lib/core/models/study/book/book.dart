import 'package:json_annotation/json_annotation.dart';
part 'book.g.dart';
@JsonSerializable(nullable: true, explicitToJson: true)
class ListBook{
  List<Book> items;
  ListBook({this.items});
  factory ListBook.fromJson(Map<String, dynamic> json) => _$ListBookFromJson(json);

  Map<String, dynamic> toJson() => _$ListBookToJson(this);
}
@JsonSerializable(nullable: true, explicitToJson: true)
class Book {
  String name;
  String description;
  String bookColor;
  String bookImage;
  int grade;
  int totalWord;
  int totalSentence;
  int totalUnit;
  int id;

  Book(
      {this.name,
        this.description,
        this.bookColor,
        this.bookImage,
        this.grade,
        this.totalWord,
        this.totalSentence,
        this.totalUnit,
        this.id});
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}