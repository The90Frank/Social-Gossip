# Social-Gossip

A multifunctional distributed chat application in Java with private messaging, group chatrooms, file sharing, and friend management.

Authors: Simone Setzu, Vatteroni Francesco

## Features

- **User registration and login** with online/offline status tracking
- **Private messaging** via direct TCP connections between clients
- **Group chatrooms** using UDP multicast
- **File sharing** between friends via NIO socket channels
- **Friend system** with friend requests and RMI-based async notifications
- **Swing GUI** with multi-window support (separate window per chat/chatroom)

## Architecture

The application follows a client-server model:

- **Server** listens on port 5000 and handles control requests (login, registration, friend requests, chatroom management) via a ThreadPoolExecutor
- **Clients** communicate directly for messages and file transfers (peer-to-peer)
- **RMI callbacks** for real-time friend notifications
- **UDP multicast** (239.1.1.x) for chatroom group messaging

## Project structure

```
Social-Gossip/
├── LatoServer/                # Server-side Java sources
│   ├── Server.java            # Entry point
│   ├── Service.java           # Control connection handler
│   ├── Service_message.java   # Private message routing
│   ├── Service_chatroom.java  # Chatroom message routing
│   ├── Service_online.java    # Online status monitoring
│   ├── Utente.java            # User model
│   ├── ChatRoom.java          # Chatroom model
│   └── ...
├── LatoClient/                # Client-side Java sources
│   ├── GUIclient.java         # Login UI
│   ├── GossipInterface.java   # Main client UI
│   ├── Interfaccia_Chat.java  # Private chat window
│   ├── Interfaccia_ChatRoom.java # Chatroom window
│   ├── InviaFile.java         # File sender
│   ├── Ricevi_file.java       # File receiver
│   └── ...
├── eseguibili/
│   ├── client.jar             # Compiled client
│   └── server.jar             # Compiled server
└── Social-Gossip.pdf          # Design document
```

## Usage

Run the server:
```bash
java -jar eseguibili/server.jar
```

Run a client:
```bash
java -jar eseguibili/client.jar
```

## Dependencies

- Java (JDK 7+)
- json-simple (JSON parsing)
- Jsoup (HTML parsing for local IP detection)

## License

Apache License 2.0 - see [LICENSE](LICENSE) for details.
