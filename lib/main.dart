import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hovering/hovering.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'dart:collection';

Uri _url = Uri.parse("");

var myMap = {"hate": true, "stupid": true, "ugly": true};
String mdata = "";

void main() {
  runApp(
    MaterialApp(
      home: GBV(),
    ),
  );
}

class chatscreen extends StatefulWidget {
  const chatscreen({super.key});

  @override
  State<chatscreen> createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => GBV()));
              },
              child: Icon(Icons.arrow_left)),
          title: Text("Chat"),
        ),
      ),
    );
  }
}

class GBV extends StatefulWidget {
  const GBV({super.key});

  @override
  State<GBV> createState() => _XylophoneState();
}

class _XylophoneState extends State<GBV> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[900],
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Icon(
            Icons.menu,
            color: Colors.blueGrey[100],
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[900],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(children: [
          // ignore: prefer_const_constructors
          Text(
            "Find Helpline For Your State",
            // ignore: prefer_const_constructors
            style: GoogleFonts.denkOne(
              fontSize: 32,
              color: Colors.white,
            ),
          ),

          SizedBox(
            height: 16,
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: myController,
              onEditingComplete: () {
                String data = myController.text;
                data.replaceAll(" ", "");
                data = data.toUpperCase();
                _url = Uri.parse("https://indianhelpline.com/$data/");
                _launchUrl();
              },
              style: GoogleFonts.poppins(
                color: Colors.blueGrey[700],
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: "Enter Your State Name",
              ),
            ),
          ),

          SizedBox(
            height: 16,
          ),

          GestureDetector(
            onTap: (() {
              String data = myController.text;
              data.replaceAll(" ", "");
              data = data.toUpperCase();
              _url = Uri.parse("https://indianhelpline.com/$data/");
              _launchUrl();
            }),
            child: Card(
              elevation: 8,
              child: Container(
                child: Text(
                  "Search",
                  style: GoogleFonts.poppins(
                    color: Colors.blueGrey[700],
                    fontSize: 16,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                color: Colors.blueGrey[200],
              ),
            ),
          ),

          SizedBox(
            height: 16,
          ),
          Divider(color: Colors.white),

          SizedBox(
            height: 16,
          ),

          //Second title////
          Text(
            "Solutions For Gender Based Violence",
            // ignore: prefer_const_constructors
            style: GoogleFonts.denkOne(
              fontSize: 32,
              color: Colors.white,
            ),
          ),

          SizedBox(
            height: 16,
          ),

          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: (() {
                  _url = Uri.parse("http://127.0.1.1:5006/");
                  _launchUrl();
                }),
                child: HoverWidget(
                  onHover: (event) {},
                  child: Container(
                    child: Image.asset("assets/offlineabuse2black.jpg"),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 248, 248),
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  hoverChild: Container(
                    child: Image.asset("assets/offlineabuse2.jpg"),
                    height: 235,
                    width: 235,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 245, 243),
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                width: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatPage()));
                },
                child: HoverWidget(
                  onHover: (event) {},
                  child: Container(
                    child: Image.asset("assets/onlineabuseblack.png"),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  hoverChild: Container(
                    child: Image.asset("assets/onlineabuse.png"),
                    height: 235,
                    width: 235,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => compalintPage()));
                },
                child: HoverWidget(
                  onHover: (event) {},
                  child: Container(
                    child: Image.asset("assets/complaintblack.png"),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  hoverChild: Container(
                    child: Image.asset("assets/complaint.png"),
                    height: 235,
                    width: 235,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

// Complaint Page UI

class compalintPage extends StatefulWidget {
  const compalintPage({super.key});

  @override
  State<compalintPage> createState() => _compalintPageState();
}

class _compalintPageState extends State<compalintPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Register Complaint"),
          backgroundColor: Colors.blueGrey[900],
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GBV()));
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/complaint_bg.jpg"),
                  fit: BoxFit.cover)),
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                )),
            Expanded(flex: 1, child: Container()),
            Expanded(flex: 1, child: Container())
          ]),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

//Chat UI

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Chat(
          messages: _messages,
          onAttachmentPressed: _handleAttachmentPressed,
          onMessageTap: _handleMessageTap,
          onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: _handleSendPressed,
          showUserAvatars: true,
          showUserNames: true,
          user: _user,
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      //Here we check messages
      //print(message.toString());

      _messages.insert(0, message);
      //Here
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    mdata = message.text;

    String m = mdata;
    m = m.toLowerCase();
    var lwm = m.split(" ");
    //print("The word is : $m");
    if (m == "exit") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => GBV()));
    }
    for (var i = 0; i < lwm.length; i++) {
      //print(lwm[i]);
      if (myMap.containsKey(lwm[i])) {
        final textMessage = types.TextMessage(
          author: _user,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text: "This message is flagged as Gender Based Abuse Violation",
        );

        _addMessage(textMessage);
        return;
      }
    }

    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }
}
