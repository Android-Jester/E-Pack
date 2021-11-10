import 'package:appwrite/appwrite.dart' show Client;

class AppWriteServer {
  AppWriteServer() {
    // For self signed certificates, only use for development
  }
  initClient() {
    Client client = Client();
    return client
        .setEndpoint(
            'http://c862-154-160-10-101.ngrok.io') // Your Appwrite Endpoint
        .setProject('60f4528babe86') //Project Used
        .setSelfSigned(status: true);
  }
}
