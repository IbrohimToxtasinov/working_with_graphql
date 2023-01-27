import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_example/data/models/country_model/country_model.dart';
import 'package:flutter_graphql_example/state_managers/cubit/country_cubit.dart';

class CountryScreen extends StatelessWidget {
  final CountryModel countryModel;
  const CountryScreen({required this.countryModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Country Screen"),
        ),
        body: Center(
          child: BlocBuilder<CountryCubit, CountryState>(
            builder: (context, state) {
              if (state.status == Status.PURE) {
                print("${countryModel.code}");
                context.read<CountryCubit>().getCountry(countryModel.code);
              }
              if (state.status == Status.SUCCESS) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Country:  ${state.country!.name}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Langiage:  ${state.country!.native}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Phone code:  ${state.country!.phone}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
