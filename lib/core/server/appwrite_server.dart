import 'package:appwrite/appwrite.dart' show Client;

class AppWriteServer {
  AppWriteServer() {
    // For self signed certificates, only use for development
  }
  userClient() {
    Client client = Client();
    return client
        .setEndpoint(
            'http://7bcd-102-176-94-18.ngrok.io/v1') // Your Appwrite Endpoint
        .setProject('60f4528babe86')
        .setSelfSigned(status: true);
  }
}
