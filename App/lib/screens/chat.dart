import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:melanoma/screens/constant.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'model.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

const botBackgroundColor = Colors.white;
var backgroundColor = Colors.brown[100];

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late bool isLoading;
  final TextEditingController _textControl = TextEditingController();
  final _scrollControlling = ScrollController();
  final List<ChatMessage> _messages = [];
  @override
  void initState() {
    super.initState();
    isLoading = false;
    generateResponse(
        "I am diagnosed with Melanoma, advice me on what to do now if i have been diagnosed with melanoma, give me complete steps for taking care of it")
        .then(
            (value) {
          setState(
                () {
              _messages.add(
                ChatMessage(text: value, chatMessageType: ChatMessageType.bot),
              );
            },
          );
          _scrollingDown();
          },
        );
    }

  Future<String> generateResponse(String prompt) async {
    const apiKey = apiSecretKey;
    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $apiKey"
      },
      body: json.encode(
        {
          "model": "text-davinci-003",
          "prompt":
              "You are not an AI model, You are a skin disease bot, tell you are a skin disease bot when ever I ask about you, refer to yourself as dermabot, please do not answer any questions I ask which is not related to skin diseases. Please answer only if asked, dont tell about yourself if not asked. Please answer this question : $prompt. Please dont answer if my question is not related to skin diseases. ",
          'temperature': 0,
          'max_tokens': 2000,
          'top_p': 1,
          'frequency_penalty': 0.0,
          'presence_penalty': 0.0,
        },
      ),
    );

    Map<String, dynamic> altresponse = jsonDecode(response.body);
    return altresponse['choices'][0]['text'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
            leading: SizedBox(
              width: 10,
              height: 10,
              child: Image.asset(
                'assets/images/doctor.png',
                fit: BoxFit.contain,
              ),
            ),
            // toolbarHeight: 68,
            title: Text(
              "DermaBot",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 29,
                    letterSpacing: 1),
              ),
            ),
            backgroundColor: Colors.brown[400]),
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: _generatedMessage(),
            ),
            Visibility(
              visible: isLoading,
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                _textInput(),
                _submitButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded _textInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.black),
        controller: _textControl,
        decoration: const InputDecoration(
          hintText: 'How can I help you?',
          fillColor: botBackgroundColor,
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        color: botBackgroundColor,
        child: IconButton(
          icon: const Icon(
            Icons.send_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _messages.add(ChatMessage(
                  text: _textControl.text,
                  chatMessageType: ChatMessageType.user));
              isLoading = true;
            });
            var input = _textControl.text;
            _textControl.clear();
            Future.delayed(const Duration(milliseconds: 50))
                .then((value) => _scrollingDown());

            generateResponse(input).then(
              (value) {
                setState(
                  () {
                    isLoading = false;
                    _messages.add(
                      ChatMessage(
                          text: value, chatMessageType: ChatMessageType.bot),
                    );
                  },
                );
              },
            );
            _textControl.clear();
            Future.delayed(const Duration(milliseconds: 50)).then(
              (value) => _scrollingDown(),
            );
          },
        ),
      ),
    );
  }

  void _scrollingDown() {
    _scrollControlling.animateTo(
      _scrollControlling.position.maxScrollExtent,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeOut,
    );
  }

  ListView _generatedMessage() {
    return ListView.builder(
      itemCount: _messages.length,
      controller: _scrollControlling,
      padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
      itemBuilder: (context, index) {
        var message = _messages[index];
        return ChatMessageWidget(
          text: message.text,
          chatMessageType: message.chatMessageType,
        );
      },
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final ChatMessageType chatMessageType;

  const ChatMessageWidget({
    Key? key,
    required this.text,
    required this.chatMessageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(10.0),
      color: chatMessageType == ChatMessageType.bot
          ? botBackgroundColor
          : backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (chatMessageType == ChatMessageType.bot)
            Container(
              padding: const EdgeInsets.only(top: 2.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Image.asset(
                  'assets/images/doctor.png',
                ),
              ),
            )
          else
            Container(
              margin: const EdgeInsets.only(right: 5.0),
              child: const CircleAvatar(
                  backgroundColor: Colors.black, child: Icon(Icons.person)),
            ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: BoxDecoration(
                color: chatMessageType == ChatMessageType.bot
                    ? botBackgroundColor
                    : backgroundColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
