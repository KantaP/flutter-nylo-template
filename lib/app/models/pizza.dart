import 'package:equatable/equatable.dart';

class Pizza extends Equatable{

  final int id;
  final String name;

  Pizza({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  static List<Pizza> pizzas = [
    Pizza(id: 1, name: 'Pepper Roni') ,
    Pizza(id: 2, name: 'Seafood Ireland'),
    Pizza(id: 3, name: 'Seafood Delux')
  ];
}
