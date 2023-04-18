import 'package:bloc_architecture/data/models/data_home.dart';
import 'package:bloc_architecture/logic/bloc/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RandomBloc randomBloc = context.read<RandomBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
          child: BlocBuilder<RandomBloc, RandomState>(
        bloc: randomBloc,
        builder: (context, state) {
          if (state is RandomLoading) {
            return CircularProgressIndicator();
          }

          if (state is RandomError) {
            return Text("Terjadi Kesalahan");
          }

          if (state is RandomInitial) {
            return Text("Tidak Ada data");
          }

          DataHomeModel dataHome = state.data;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 75,
                height: 75,
                child: Container(
                  child: Image.network("${dataHome.profile}"),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "${dataHome.fullname}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text("${dataHome.email}"),
              SizedBox(height: 20),
              Text("============== Pokemon =============="),
              SizedBox(height: 20),
              Text("${dataHome.nameAnimal}"),
              SizedBox(height: 20),
            ],
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          randomBloc.add(GetRandomEvent());
          print(randomBloc.state.data.toJson());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
