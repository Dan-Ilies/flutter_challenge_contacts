
import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String name;
  //final String phoneNumber;

  const Contact({
    required this.name,
    //required this.phoneNumber
  });

  @override
  List<Object?> get props => [name];

}