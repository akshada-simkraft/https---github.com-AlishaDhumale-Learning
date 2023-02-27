import 'package:flutter/material.dart';
import 'package:learning/model/client_data.dart';
import 'package:learning/services/client_service.dart';

class ClientProvider extends ChangeNotifier {
  ClientService clientService = ClientService();
  List<ClientData> clients = [];
  List<ClientData> get clientsList => clients;

  Future<void> getClientsData() async {
    final response = await clientService.getClients();
    clients = response;
    notifyListeners();
  }
}
