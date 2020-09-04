import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_dialogflow/utils/language.dart';
import 'package:flutterchatbot/Widgets/ChatMessage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _messageTextController = TextEditingController();
  String _messageText = "";
  final List<ChatMessage> _messages = <ChatMessage>[];

  void dfResponse(query) async {
    _messageTextController.clear();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/alpha.png'),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
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
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
//                      color: Color(0xffBBEC6C),
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          hintText: 'enter message',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff62DBFB), width: 2.0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff38ef7d), width: 2.0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        controller: _messageTextController,
                        onChanged: (value) {
                          _messageText = value;
                        },
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xff38ef7d),
                    radius: 25,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          if (_messageText != "") {
                            _messageTextController.clear();
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
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 25,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
