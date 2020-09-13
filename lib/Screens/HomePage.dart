import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_dialogflow/utils/language.dart';
import 'package:flutterchatbot/Widgets/ChatMessage.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _messageTextController = TextEditingController();
  String _messageText = "";
  final List<ChatMessage> _messages = <ChatMessage>[];
  stt.SpeechToText _speech;
  bool _isListening = false;

  void voice() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _messageText = val.recognizedWords;
            print(_messageText);
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void dfResponse(query) async {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _messageTextController.clear());
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/credentials.json").build();
    Dialogflow dialogFlow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]).title,
      name: "Alpha",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
      _messageText = "";
    });
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffFF5722),
        title: Text(
          'Flutter-Chatbot',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
//            Center(
//              child: Container(
//                margin: const EdgeInsets.symmetric(vertical: 10),
//                height: 100,
//                width: 200,
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(22),
//                    image: DecorationImage(
//                      fit: BoxFit.fill,
//                      image: AssetImage('assets/alpha.png'),
//                    )),
//              ),
//            ),

            Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Container(
//              color: Color(0xffBBEC6C),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
//                      color: Color(0xffBBEC6C),
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Color(0xffFF5722),
//                                  size: 30,
                            ),
                            onPressed: () {
                              if (_messageText != "") {
                                WidgetsBinding.instance.addPostFrameCallback(
                                    (_) => _messageTextController.clear());
                                ChatMessage message = new ChatMessage(
                                  text: _messageText,
                                  name: "You",
                                  type: true,
                                );
                                setState(() {
                                  _messages.insert(0, message);
                                });
                                dfResponse(_messageText);
                              }
                            },
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          hintText: 'enter message',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffFF5722), width: 2.0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffFF5722), width: 2.0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        controller: _messageTextController,
                        onChanged: (value) {
                          _messageText = value;
                        },
                      ),
                    ),
                  ),
//                  AvatarGlow(
//                    animate: _isListening,
//                    glowColor: Colors.green,
//                    endRadius: 35.0,
//                    duration: const Duration(milliseconds: 2000),
//                    repeatPauseDuration: const Duration(milliseconds: 100),
//                    repeat: true,
//                    child: CircleAvatar(
//                      backgroundColor: Colors.green,
//                      radius: 20,
//                      child: IconButton(
//                        icon: Icon(
//                          _isListening ? Icons.mic : Icons.mic_none,
//                          color: Colors.white,
//                          size: 25,
//                        ),
//                        onPressed: voice,
//                      ),
//                    ),
//                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
