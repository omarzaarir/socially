import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gallery/controller/chatcontroller/chatListController.dart';
import 'package:gallery/styles/colors.dart';
import 'package:gallery/view/commons.dart';
// import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // final TextEditingController _controllerFilled = TextEditingController();

  late final ScrollController _scroller = ScrollController()
    ..addListener(_handleScrollChanged);
  final _scrollPos = ValueNotifier(0.0);
  void _handleScrollChanged() {
    _scrollPos.value = _scroller.position.pixels;
  }

  Chatlistcontroller chatlistcontroller = Chatlistcontroller();

  static const List<String> _fruitOptions = <String>[
    'apple',
    'banana',
    'orange',
    'mango',
    'grapes',
    'watermelon',
    'kiwi',
    'strawberry',
    'sugarcane',
  ];
  @override
  Widget build(BuildContext context) {
    chatlistcontroller.AutoFillForTesting();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () => context.go("/home"),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: SafeArea(
        child: ColoredBox(
          color: Colors.white,
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(0, 110),
                child: Transform.rotate(
                  angle: math.pi / 4,
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: 2,
                    child: Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            // color: Color(0xffE1F6F4),
                            border: Border.all(
                              color: Color(0xffE1F6F4),
                            ),
                            borderRadius: BorderRadius.circular(60)),
                      ),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 160),
                child: Transform.rotate(
                  angle: math.pi / 4,
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: 2,
                    child: Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            // color: Color(0xffE1F6F4),
                            border: Border.all(
                              color: Color(0xffE1F6F4),
                            ),
                            borderRadius: BorderRadius.circular(60)),
                      ),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 210),
                child: Transform.rotate(
                  angle: math.pi / 4,
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: 2,
                    child: Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color(0xffE1F6F4),
                            borderRadius: BorderRadius.circular(60)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomScrollView(
                  controller: _scroller,
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 80,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding:
                            EdgeInsets.only(right: 10, left: 10, bottom: 30),
                        child: Autocomplete(
                          optionsBuilder: (textEditingValue) => _fruitOptions,
                          fieldViewBuilder: _buildInput,
                          optionsViewBuilder: (context, onSelected, results) =>
                              _buildSuggestionsView(
                                  context, onSelected, results),
                        ),
                      ),
                    ),
                    chatlistcontroller.chatslist.length != 0
                        ? SliverList.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: chatlistcontroller.chatslist.length,
                            itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(153, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(30)),
                              child: ListTile(
                                horizontalTitleGap: 0,
                                contentPadding: EdgeInsets.all(10),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: AppColors().body,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(chatlistcontroller
                                            .chatslist
                                            .elementAt(index)
                                            .imageUrl),
                                      )),
                                ),
                                title: Text(
                                  chatlistcontroller.chatslist
                                      .elementAt(index)
                                      .personName,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontSize: 12.8,
                                      fontStyle: FontStyle.normal),
                                ),
                                subtitle: Text(
                                  chatlistcontroller.chatslist
                                      .elementAt(index)
                                      .lastMessege,
                                  style: TextStyle(
                                      color: Color(0xFF656565),
                                      fontFamily: "Poppins",
                                      fontSize: 12.8,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ),
                          )
                        : SliverToBoxAdapter(
                            child: Center(
                              child: text_39("try start conversation..."),
                            ),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: AnimatedBuilder(
                  animation: _scroller,
                  builder: (context, child) {
                    return AnimatedOpacity(
                        opacity: _scrollPos.value > 30 ? 0 : 1,
                        duration: Duration(milliseconds: 300),
                        child: child);
                  },
                  child: Text(
                    'Messages',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(BuildContext context, TextEditingController textController,
      FocusNode focusNode, _) {
    Color captionColor = Color(0xFFC4C4C4);
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(blurRadius: 6, color: Colors.black45, offset: Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 8 * 1.5),
          Icon(Icons.search, color: Color(0xFF7D7873)),
          Expanded(
            child: TextField(
              // onSubmitted: onSubmit,
              controller: textController,
              focusNode: focusNode,
              style: TextStyle(color: captionColor),
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(8),
                labelStyle: TextStyle(color: captionColor),
                hintStyle: TextStyle(color: captionColor.withOpacity(0.5)),
                prefixStyle: TextStyle(color: captionColor),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: "hint text",
              ),
            ),
          ),
          SizedBox(width: 8),
          ValueListenableBuilder(
            valueListenable: textController,
            builder: (_, value, __) => Visibility(
              visible: textController.value.text.isNotEmpty,
              child: Padding(
                padding: EdgeInsets.only(right: 8),
                child: IconButton(
                    onPressed: () {
                      textController.clear();
                    },
                    icon: Icon(Icons.close)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSuggestionsView(
    BuildContext context,
    onSelected,
    Iterable<String> results,
  ) {
    return Stack(
      children: [
        ExcludeSemantics(
          child: InkWell(
            onTap: FocusManager.instance.primaryFocus!.unfocus,
            child: SizedBox.expand(),
          ),
        ),
      ],
    );
  }
}
