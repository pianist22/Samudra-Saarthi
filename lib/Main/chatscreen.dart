import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final String _userId = UniqueKey().toString();

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return;

    final message = _controller.text;
    setState(() {
      _messages.insert(0, {'text': message, 'sender': 'user', 'id': UniqueKey().toString()});
    });

    _controller.clear();

    try {
      final response = await http.post(
        Uri.parse('https://5fc8-2401-4900-1c5d-cc0-c49a-fd4e-cc7e-c108.ngrok-free.app/ask?username=vin'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'question': message}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final botMessage = responseData['response'];

        setState(() {
          _messages.insert(0, {
            'text': botMessage,
            'sender': 'bot',
            'id': UniqueKey().toString()
          });
        });
      } else {
        setState(() {
          _messages.insert(0, {
            'text': 'Error: Unable to fetch response.',
            'sender': 'bot',
            'id': UniqueKey().toString()
          });
        });
      }
    } catch (error) {
      setState(() {
        _messages.insert(0, {
          'text': 'Error: Unable to fetch response.',
          'sender': 'bot',
          'id': UniqueKey().toString()
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saarthi.ai'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _messages.clear();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  leading: message['sender'] == 'user'
                      ? Icon(Icons.person, color: Colors.blue)
                      : Icon(Icons.person_outline, color: Colors.grey),
                  title: Align(
                    alignment: message['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'user'
                            ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        message['text']!,
                        style: TextStyle(
                          color: message['sender'] == 'user'
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20, vertical: 40),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message here...',
                      filled: true,
                      fillColor: Colors.blue.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      prefixIcon: Icon(Icons.mic),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
