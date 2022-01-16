import 'package:calculator_task/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopCard extends StatelessWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (state is CalculatorCompleted) {
          return buildContainerResultList(list: state.history!.reversed.toList());
        } else if (state is CalculatorState) {
          return buildContainerText(text: const Text("No Action Has Been Selected Yet."));
        } else {
          return buildContainer();
        }
      },
    );
  }

  Container buildContainer() {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[900],
      ),);
  }
  Container buildContainerText({required Text text}) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[900],
        ),
        child: Center(child: text));
  }

  Container buildContainerResultList({required List<dynamic>? list}) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[900],
        ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: list!.length > 5 ? 5 : list.length,
              itemBuilder: (context, index) {
                return Center(child: Text(list[index].toString()));
              },
            ),
          ),
        ));
  }
}
