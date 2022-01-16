import 'package:calculator_task/bloc/button/button_bloc.dart';
import 'package:calculator_task/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_task/widget/operator_button_widget.dart';
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
      body: BlocListener<CalculatorBloc, CalculatorState>(
        listener: (context, state) {
          if (state is CalculatorError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message, style: TextStyle(color: state.textColors)), backgroundColor: state.backgroundColors, duration: state.duration));
          }
        },
        child: Padding(
          padding: context.horizontalPaddingLow,
          child: Column(
            children: [
              const Expanded(flex: 3, child: TopCard()),
              Expanded(flex: 7, child: _buildSingleChildScrollView(context)),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _buildSingleChildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        CustomInput(controller: _firstNumber, label: "Firs Number"),
        CustomInput(controller: _secondNumber, label: "Second Number"),
        BlocBuilder<ButtonBloc, ButtonState>(builder: (context, state) {
          return _buildOperatorButtonColumn(state);
        }),
        Row(
          children: [Expanded(flex: 2, child: _buildClearButton(context)), const Spacer(), Expanded(flex: 2, child: _buildCalculateButton(context))],
        )
      ]),
    );
  }

  CustomButton _buildCalculateButton(BuildContext context) {
    return CustomButton(
      text: "Calculate",
      function: () {
        if (_firstNumber.text.isNotNullOrNoEmpty & _secondNumber.text.isNotNullOrNoEmpty) {
          context.read<CalculatorBloc>().add(CalculatorResult(int.parse(_firstNumber.text), int.parse(_secondNumber.text)));
        } else {
          context.read<CalculatorBloc>().add(CalculatorNullValue());
        }
      },
    );
  }

  CustomButton _buildClearButton(BuildContext context) {
    return CustomButton(
        text: "Clear",
        function: () {
          context.read<CalculatorBloc>().add(CalculatorClear());
          context.read<ButtonBloc>().add(ButtonClear());
          _firstNumber.clear();
          _secondNumber.clear();
        });
  }

  Column _buildOperatorButtonColumn(ButtonState state) {
    return Column(
      children: [
        OperatorButton(icon: Icons.add, title: 'Add', operator: "+", selected: state.buttonAdd ?? false),
        OperatorButton(icon: Icons.remove, title: 'Subtract', operator: "-", selected: state.buttonSubtract ?? false),
        OperatorButton(icon: Icons.close, title: 'Multiply', operator: "*", selected: state.buttonMultiply ?? false),
        OperatorButton(icon: Icons.keyboard_arrow_up_outlined, title: 'Divide', operator: "/", selected: state.buttonDivide ?? false),
      ],
    );
  }
}
