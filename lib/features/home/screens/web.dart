
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socket.io Token Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TokenDemoPage(),
    );
  }
}

class TokenDemoPage extends StatefulWidget {
  @override
  _TokenDemoPageState createState() => _TokenDemoPageState();
}

class _TokenDemoPageState extends State<TokenDemoPage> {
  late IO.Socket socket;
  String connectionStatus = "Disconnected";
  String tokenMessage = "No token update received";

  // Use the correct doctorId that matches what your server emits.
  // Change this to the actual doctor id as needed.
  final String doctorId = "67bac527dcba6237dd3d1955";

  @override
  void initState() {
    super.initState();

    // Initialize the socket.io client using the correct URL and settings.
    socket = IO.io("https://nomotiwa-backend.onrender.com", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    // Connect to the socket server.
    socket.connect();

    // Listen for connection event.
    socket.on("connect", (_) {
      setState(() {
        connectionStatus = "Connected";
      });
      print("Connected: ${socket.id}");

      // Join the room with the format 'doctor_<doctorId>'
      String roomName = "doctor_$doctorId";
      socket.emit("joinDoctorRoom", roomName);
      print("Joined room: $roomName");
    });

    // Listen for disconnection event.
    socket.on("disconnect", (_) {
      setState(() {
        connectionStatus = "Disconnected";
      });
      print("Disconnected");
    });

    // Listen for token update events.
    socket.on("tokenUpdate", (data) {
      print("Token update received: $data");
      setState(() {
        tokenMessage = data.toString();
      });
    });

    // Listen for errors.
    socket.on("error", (error) {
      print("Socket error: $error");
    });
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }

  // Optional: A function to manually trigger an update for testing.
  // Your server should have a corresponding event handler or endpoint.
  void simulateTokenUpdate() {
    socket.emit("simulateTokenUpdate", {"doctorId": doctorId});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Token Update Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Connection Status: $connectionStatus",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Latest Token Update:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(tokenMessage, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: simulateTokenUpdate,
              child: Text("Simulate Token Update"),
            ),
          ],
        ),
      ),
    );
  }
}
