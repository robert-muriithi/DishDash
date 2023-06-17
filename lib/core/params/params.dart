import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Params extends Equatable {
  final String? id;
  final String? category;

  const Params({this.id, this.category});

  @override
  List<Object> get props => [
        id ?? '',
       category ?? '',
  ];
}