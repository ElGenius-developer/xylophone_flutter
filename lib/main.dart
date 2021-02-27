import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xylophone_flutter/data/constants.dart';
import 'package:xylophone_flutter/logic/player_bloc.dart';

void main() =>
    runApp(BlocProvider(create: (context) => PlayerCubit(), child: MyApp()));

class MyApp extends StatelessWidget {
  final colorData = ConstantData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.red.shade900,
          appBar: AppBar(
            backgroundColor: Colors.red.shade900,
            title: Text('Xylophone'),
            centerTitle: true,
          ),
          body: Column(
            children: List.generate(
              colorData.colorsList.length,
              (index) => Expanded(
                child: GestureDetector(
                  child: Container(
                    color: colorData.colorsList[index],
                  ),
                  onTap: () =>
                      context.read<PlayerCubit>().changeTone(index + 1),
                ),
              ),
            ),
          )),
    );
  }
}
