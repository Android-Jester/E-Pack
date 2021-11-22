import 'package:appwrite/appwrite.dart' show Client;

class AppWriteServer {
  AppWriteServer() {
    // For self signed certificates, only use for development
  }
  static initClient() {
    return Client()
        .setEndpoint(
            'https://5b13-154-160-20-128.ngrok.io/v1') // Your Appwrite Endpoint
        .setProject('6185f55c9f9b2') //Project Used
        .setSelfSigned(status: true);
  }
}
