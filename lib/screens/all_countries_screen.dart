import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_example/data/models/country_model/country_model.dart';
import 'package:flutter_graphql_example/screens/country_screen.dart';
import 'package:flutter_graphql_example/state_managers/bloc/countries_bloc.dart';

class AllCountriesScreen extends StatelessWidget {
  const AllCountriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Countries"),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          context.read<CountriesBloc>().add(GetAllCountries());
        },
      ),
      body: Center(
        child: BlocBuilder<CountriesBloc, CountriesState>(
          builder: (context, state) {
            if (state is GettingCountriesInProgress) {
              return const CircularProgressIndicator();
            }
            if (state is GettingCountriesInSuccess) {
              List<CountryModel> countries = state.countries;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: countries.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryScreen(
                          countryModel: countries[index],
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(countries[index].name),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
