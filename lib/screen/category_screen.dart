import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mindbox/assest/renk/color.dart';
import 'package:mindbox/widget/appbar_ai.dart';
import 'package:mindbox/widget/message_widget.dart'; // Your existing widget

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  late final GenerativeModel _model;
  late final ChatSession _chatSession;
  final FocusNode _textFieldFocus = FocusNode();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;
  List<String>? selectedChips;


  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: "AIzaSyAklkfOagrGzYzTjn5zQDw2tZEmawPtcs0",
    );
    _chatSession = _model.startChat();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndApplyFilters();
    });
  }

  void _checkAndApplyFilters() {
    final filters = ModalRoute.of(context)?.settings.arguments as List<String>?;
    if (filters != null && filters.isNotEmpty) {
      setState(() {
        selectedChips = filters;
      });
      String message = filters.join(', '); //
      _sendChatMessage(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarAiWidget(
          onFiltersSelected: (filters){
            setState(() {
              selectedChips=filters;
            });
          },
          title: 'MindBox İle Öğren',
          subtitle: 'Hadi Hediyeni Bulalım !',
        ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _chatSession.history.length,
                  itemBuilder: (context, index) {
                    final Content content =
                        _chatSession.history.toList()[index];
                    final text = content.parts
                        .whereType<TextPart>()
                        .map<String>((e) => e.text)
                        .join('');
                    return MessageWidget(
                      text: text,
                      isFromUser: content.role == 'user',
                    );
                  }
                  ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              child: TextField(
                autofocus: true,
                focusNode: _textFieldFocus,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Hediyeni Sor...',
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(),
                  suffixIcon: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        _sendChatMessage(_textController.text);
                      },
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.all(15),
      hintText: 'Hediyeni Sor...',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      String combinedPrompt = (selectedChips != null && selectedChips!.isNotEmpty)
          ? "${selectedChips!.join(', ')}\nUser: $message"
          : "User: $message";
      _textController.text = combinedPrompt;

      final response = await _chatSession.sendMessage(
        Content.text(combinedPrompt),
      );
      final text = response.text;
      if (text == null) {
        _showError('No Response from API');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void _showError(String message) {
    showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Yanlış Birşey Var'),
            content: SingleChildScrollView(
              child: SelectableText(message),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('TAMAM'),
              )
            ],
          );
        });
  }
}
