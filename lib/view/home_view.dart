import 'package:calculator_task/bloc/calculator/calculator_bloc.dart';
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
                    ActionButton(icon: Icons.add, title: 'Add',operator:"+", selected:false,),
                    ActionButton(icon: Icons.remove, title: 'Subtract',operator:"-", selected: false,),
                    ActionButton(icon: Icons.close, title: 'Multiply',operator:"*", selected: false,),
                    ActionButton(icon: Icons.keyboard_arrow_up_outlined, title: 'Divide',operator:"/", selected: false,),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: CustomButton(
                                text: "Clear",
                                function: () {
                                  context.read<CalculatorBloc>().add(CalculatorClear());
                                  _firstNumber.clear();
                                  _secondNumber.clear();
                                })),
                        Spacer(),
                        Expanded(
                            flex: 2,
                            child: CustomButton(
                              text: "Calculate",
                              function: () {
                                context.read<CalculatorBloc>().add(CalculatorResult(int.parse(_firstNumber.text),int.parse(_secondNumber.text)));

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
