import 'package:appwrite/appwrite.dart' show Client;

class appwrite_server {
  Client client = Client();
  appwrite_server() {
    client
        .setEndpoint('http://localhost:8080/v1') // Your Appwrite Endpoint
        .setProject('60f4528babe86') // Your project ID
        .setSelfSigned(status: true); // For self signed certificates, only use for development
  }
}
