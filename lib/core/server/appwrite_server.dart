import 'package:appwrite/appwrite.dart' show Client;

class AppWriteServer {
  AppWriteServer() {
    // For self signed certificates, only use for development
  }
  userClient() {
    Client client = Client();
    return client
        .setEndpoint('http://192.168.2.1:8080/v1') // Your Appwrite Endpoint
        .setProject('60f4528babe86');
  }
}
