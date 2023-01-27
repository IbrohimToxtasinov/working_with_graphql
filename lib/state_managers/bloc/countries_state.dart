part of 'countries_bloc.dart';

@immutable
abstract class CountriesState {}

class CountriesInitial extends CountriesState {}
class GettingCountriesInSuccess extends CountriesState {
  List<CountryModel> countries;

  GettingCountriesInSuccess({required this.countries});

}
class GettingCountriesInFailury extends CountriesState {
  String status;

  GettingCountriesInFailury({required this.status});


}
class GettingCountriesInProgress extends CountriesState {}