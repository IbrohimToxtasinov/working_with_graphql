import 'package:bloc/bloc.dart';
import 'package:flutter_graphql_example/data/services/api_service/api_service.dart';
import 'package:flutter_graphql_example/utils/my_local.dart';
import 'package:meta/meta.dart';

import '../../data/models/country_model/country_model.dart';

part 'countries_event.dart';

part 'countries_state.dart';

class CountriesBloc extends Bloc<GetAllCountries, CountriesState> {
  CountriesBloc() : super(CountriesInitial()) {
    on<GetAllCountries>(getAllCountries);
  }

  getAllCountries(event, emit) async {
    emit(GettingCountriesInProgress());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final countries = await getIt<CountriesApiClient>().getCountries();
      print(countries);
      emit(GettingCountriesInSuccess(countries: countries));
    } catch (e) {
      print(e.toString());
      emit(GettingCountriesInFailury(status: e.toString()));
    }
  }
}
