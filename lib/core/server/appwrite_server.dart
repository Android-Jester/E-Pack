import 'package:appwrite/appwrite.dart' show Client;

class AppWriteServer {
  AppWriteServer() {
    // For self signed certificates, only use for development
  }
  static initClient() {
    return Client()
        .setEndpoint(
            'http://7c5a-154-160-17-220.ngrok.io/v1') // Your Appwrite Endpoint
        .setProject('6185f55c9f9b2') //Project Used
        .setSelfSigned(status: true);
  }
}
