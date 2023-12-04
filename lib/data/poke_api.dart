import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_formation/core/exceptions.dart';

// Simple HTTP client to fetch datas from PokeAPI
class PokeAPIClient {
  static const baseUrl = 'https://pokeapi.co/api/v2';
  static var client = http.Client();

  // Get the 151 first pokemons to display as a list in pokedex screen
  Future<List<dynamic>> fetchPokedexEntriesDatas() async {
    const endpoint = '/pokemon?limit=151';
    try {
      final response = await client.get(Uri.parse(baseUrl + endpoint));
      final statusCode = response.statusCode;
      final Map<String, dynamic> body = jsonDecode(response.body);
      if (statusCode != 200) {
        throw NetworkException(code: statusCode, message: body["message"]);
      }
      return body['results'] as List;
    } catch (exception) {
      throw NetworkException(code: 500, message: exception.toString());
    }
  }

  // Fetch the details of a specific pokemon
  Future<Map<String, dynamic>> fetchPokemonDetail(String name) async {
    var endpoint = '/pokemon/$name';
    try {
      final response = await client.get(Uri.parse(baseUrl + endpoint));
      final statusCode = response.statusCode;
      final Map<String, dynamic> body = jsonDecode(response.body);
      if (statusCode != 200) {
        throw NetworkException(code: statusCode, message: body["message"]);
      }
      print("fetchPokemonDetails result = $body");
      return body;
    } catch (exception) {
      throw NetworkException(code: 500, message: exception.toString());
    }
  }
}