import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/list_provider.dart';
import 'package:provider_statemanagement/resources/app_typography.dart';
import 'package:provider_statemanagement/second.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // when not using provider :
  // List<int> numbers = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      // here the middle one 'value' can be replaced with model
      builder: (context, numbersProviderModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // when not using Provider :
            // int last = numbers.last + 1;
            // setState(() {
            //   numbers.add(last);
            // });
            numbersProviderModel.add();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            child: Column(
              children: [
                Center(
                  child: Text(
                    numbersProviderModel.numbers.last.toString(),
                    style: AppTypography.kLight28,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: numbersProviderModel.numbers.length,
                    itemBuilder: (context, index) {
                      return Text(
                        numbersProviderModel.numbers[index].toString(),
                        style: AppTypography.kMedium20,
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Second(),
                      ),
                    );
                  },
                  child: const Text("Second"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
