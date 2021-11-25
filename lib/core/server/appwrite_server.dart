import 'package:appwrite/appwrite.dart' show Client;

class AppWriteServer {
  AppWriteServer() {
    // For self signed certificates, only use for development
  }
  static initClient() {
    return Client()
        .setEndpoint('http://f5fa-154-160-25-208.ngrok.io/v1') // Your Appwrite Endpoint
        .setProject('6185f55c9f9b2') //Project Used
        .setSelfSigned(status: true);
  }
}
