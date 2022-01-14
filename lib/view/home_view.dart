import 'package:calculator_task/bloc/operations_bloc.dart';
import 'package:calculator_task/models/math_operations_model.dart';
import 'package:calculator_task/widget/action_button_widget.dart';
import 'package:calculator_task/widget/custom_button_widget.dart';
import 'package:calculator_task/widget/input_widget.dart';
import 'package:calculator_task/widget/top_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _firstNumber = TextEditingController();
  final TextEditingController _secondNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: context.horizontalPaddingLow,
        child: Column(
          children: [
            const Expanded(flex: 3, child: TopCard()),
            Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(children: [
                    CustomInput(controller: _firstNumber, label: "Firs Number"),
                    CustomInput(controller: _secondNumber, label: "Second Number"),
                    ActionButton(selected: false, icon: Icons.add, title: 'Add'),
                    ActionButton(selected: false, icon: Icons.remove, title: 'Subtract'),
                    ActionButton(selected: false, icon: Icons.close, title: 'Multiply'),
                    ActionButton(selected: false, icon: Icons.keyboard_arrow_up_outlined, title: 'Divide'),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: CustomButton(
                                text: "Clear",
                                function: () {
                                  context.read<OperationsBloc>().add(OperationsNoAction());
                                  _firstNumber.clear();
                                  _secondNumber.clear();
                                })),
                        Spacer(),
                        Expanded(
                            flex: 2,
                            child: CustomButton(
                              text: "Calculate",
                              function: () {
                                BlocProvider.of<OperationsBloc>(context).add(OperationsAdd(MathOperationsModel(secondNumber: int.parse(_secondNumber.text), firstNumber: int.parse(_firstNumber.text))));
                              },
                            ))
                      ],
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
