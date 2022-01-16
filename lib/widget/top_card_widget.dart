import 'package:calculator_task/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopCard extends StatelessWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (state is CalculatorCompleted) {
          return buildContainer(text: Text(state.model!.result.toString()));
        } else if (state is CalculatorError) {
          return buildContainer(text: Text(state.message));
        } else if (state is CalculatorState) {
          return  buildContainer(text: const Text("No Action Has Been Selected Yet."));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Container buildContainer({required Text text}) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[900],
        ),
        child: Center(child: text));
  }
}
