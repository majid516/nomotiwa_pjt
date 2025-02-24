import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nomotiwa/core/strings/strings.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TokenProvider extends ChangeNotifier {
  late IO.Socket socket;
  String connectionStatus = "Disconnected";
  String tokenMessage = "No token update received";
  final String doctorId;

  TokenProvider(this.doctorId) {
    _initSocket();
  }

  void _initSocket() {
    socket = IO.io(baseUrl, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket.connect();

    socket.on("connect", (_) {
      connectionStatus = "Connected";
      notifyListeners();
      String roomName = "doctor_$doctorId";
      socket.emit("joinDoctorRoom", roomName);
    });

    socket.on("disconnect", (_) {
      connectionStatus = "Disconnected";
      notifyListeners();
    });

    socket.on("tokenUpdate", (data) {
      tokenMessage = data.toString();
      notifyListeners();
    });

    socket.on("error", (error) {
      log("Socket error: $error");
    });
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }
}
