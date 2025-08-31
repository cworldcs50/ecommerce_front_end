import 'package:equatable/equatable.dart';

class OnBoardingModel extends Equatable {
  const OnBoardingModel({this.title, this.imageUrl, this.body});

  final String? title, imageUrl, body;

  @override
  List<Object?> get props => [title, imageUrl, body];
}
