// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CalculatorModel extends Equatable {
   int? firstNumber;
   int? secondNumber;
   String? operator;
   dynamic result;

   CalculatorModel({ this.firstNumber, this.secondNumber, this.result, this.operator});


  CalculatorModel copyWith(
      {int? firstNumber, String? operator, int? secondNumber, dynamic result}) {
    return CalculatorModel(
      firstNumber: firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      operator: operator ?? this.operator,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    firstNumber,
    operator,
    secondNumber,
    result,
  ];
}
