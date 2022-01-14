import 'package:calculator_task/bloc/operations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopCard extends StatelessWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationsBloc, OperationsState>(
      builder: (context, state) {
        if (state is OperationsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OperationsCompleted) {
         return buildContainer(text:Text(state.result.toString()));
        } else if (state is OperationsError) {
         return buildContainer(text:Text(state.message));
        } else {
         return buildContainer(text:const Text("No Action Has Been Selected Yet."));
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
        child: Center(child:text));
  }
}
