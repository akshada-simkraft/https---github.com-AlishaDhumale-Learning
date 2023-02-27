import 'dart:convert';
import 'package:learning/model/client_data.dart';
import 'package:http/http.dart' as http;

class ClientService {
  List<ClientData> clientsList = [];
  static const api =
      "https://7538f303-6c2a-4ae6-a251-987c7ae0da2c.mock.pstmn.io";

  Future<List<ClientData>> getClients() async {
    const url = api + "/clients/get/";
    final apiUrl = Uri.parse(url);
    final response = await http.post(apiUrl);

    if (response.statusCode == 200) {
      final body = response.body;
      final data = jsonDecode(body);
      final list = data['clients'] as List<dynamic>;
      clientsList = list.map((json) {
        return ClientData(
            id: json['id'],
            name: json['name'],
            age: json['age'],
            spend: json['spend'],
            visits: json['visits']);
      }).toList();
    }
    return clientsList;
  }

  Future<List<ClientData>> getPaginatedRequest() async {
    const url = api + "clients/get/paginated";
    final apiUrl = Uri.parse(url);
    final response = await http.post(apiUrl);

    if (response.statusCode == 200) {
      final body = response.body;
      final data = jsonDecode(body);
      final list = data['clients'] as List<dynamic>;
      clientsList = list.map((json) {
        return ClientData(
            id: json['id'],
            name: json['name'],
            age: json['age'],
            spend: json['spend'],
            visits: json['visits']);
      }).toList();
    }
    return clientsList;
  }

  Future<List<ClientData>> getSortedData() async {
    const url = api + "/clients/get/sorted/";
    final apiUrl = Uri.parse(url);
    final response = await http.post(apiUrl);

    if (response.statusCode == 200) {
      final body = response.body;
      final data = jsonDecode(body);
      final list = data['clients'] as List<dynamic>;
      clientsList = list.map((json) {
        return ClientData(
            id: json['id'],
            name: json['name'],
            age: json['age'],
            spend: json['spend'],
            visits: json['visits']);
      }).toList();
    }
    return clientsList;
  }
}
