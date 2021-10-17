import 'package:appwrite/appwrite.dart' show Client;

class AppWriteServer {
  AppWriteServer() {
    // For self signed certificates, only use for development
  }
  initClient() {
    Client client = Client();
    return client
        .setEndpoint(
            'http://66c2-102-176-94-21.ngrok.io/v1') // Your Appwrite Endpoint
        .setProject('60f4528babe86') //Project Used
        .setSelfSigned(status: true);
  }
}
