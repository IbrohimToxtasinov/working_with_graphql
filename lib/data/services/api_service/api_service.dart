import 'package:flutter_graphql_example/data/models/country_model/country_model.dart';
import 'package:flutter_graphql_example/utils/my_local.dart';
import 'package:graphql/client.dart';

class GetCountriesInFailury implements Exception {}

class CountriesApiClient {
  Future<List<CountryModel>> getCountries() async {
    final result = await getIt<GraphQLClient>().query(
      QueryOptions(
        document: gql(
          """
query {
  countries {
    name
    code
    native
    phone
    continent {
      name
    }
  }
}
""",
        ),
      ),
    );
    if (result.hasException) throw GetCountriesInFailury();
    final data = result.data?['countries'] as List;
    return data
        .map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<CountryModel> getSingleCountry(String code1) async {
    final result = await getIt<GraphQLClient>().query(
      QueryOptions(
        variables: {"code": code1},
        document: gql(
          """
query (\$code: ID!) {
  country(code: \$code) {
    code
    name
    native
    phone
    continent {
      code
      name
    }
    capital
    currency
    languages {
      code
      name
      native
      rtl
    }
    emoji
    emojiU
    states {
      code
      name
    }
  }
}
""",
        ),
      ),
    );
    if (result.hasException) {
      print("Mana error");
      print(result.exception.toString());
      print(result.data);
    }
    final data = result.data?['country'];
    return CountryModel.fromJson(data);
  }
}
