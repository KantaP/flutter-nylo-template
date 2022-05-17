import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/pizza.dart';
import 'package:flutter_app/bloc/pizza_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PizzaPage extends StatefulWidget {
  PizzaPage({Key? key}) : super(key: key);

  @override
  _PizzaPageState createState() => _PizzaPageState();
}

class _PizzaPageState extends State<PizzaPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final random = Random();

    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child:
                BlocBuilder<PizzaBloc, PizzaState>(builder: (context, state) {
              if (state is PizzaInitial) {
                print('pizza init');
                return CircularProgressIndicator(
                  color: Colors.amber,
                );
              }
              if (state is PizzaLoaded) {
                return ListView(
                  children: [
                    Center(
                      child: Text(
                        '${state.pizzas.length}',
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          for (int index = 0;
                              index < state.pizzas.length;
                              index++)
                            Positioned(
                              left: random.nextInt(250).toDouble(),
                              top: random.nextInt(400).toDouble(),
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Text(state.pizzas[index].name),
                              ),
                            )
                        ],
                      ),
                    )
                  ],
                );
              }
              return Text('Something went wrong');
            }),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.local_activity_outlined),
            backgroundColor: Colors.amber,
            onPressed: () {
              context.read<PizzaBloc>().add(PlusPizza(pizza: Pizza.pizzas[0]));
            }
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            backgroundColor: Colors.amber,
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizza(pizza: Pizza.pizzas[0]));
            }
          ),
        ],
      ),
    );
  }
}
