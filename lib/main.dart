import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ant desgin",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  bool _isfocused1 = false;
  bool _isfocused2 = false;
  bool _ishover1 = false;
  bool _ishover2 = false;
  bool _visibilityHover = false;
  bool _visibility = false;
  @override
  void initState() {
    _focusNode1.addListener(_onFcousChange);
    _focusNode2.addListener(_onFcousChange);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode1.removeListener(_onFcousChange);
    _focusNode2.dispose();
    super.dispose();
  }

  void _onFcousChange() {
    setState(() {
      _isfocused1 = _focusNode1.hasFocus;
      _isfocused2 = _focusNode2.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: const Text("ant desgin demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  _ishover1 = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _ishover1 = false;
                });
              },
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: _isfocused1
                        ? const [
                            BoxShadow(
                              color: Color.fromARGB(184, 119, 174, 246),
                              blurRadius: 0,
                              spreadRadius: 2,
                            )
                          ]
                        : null),
                child: TextField(
                  controller: _textEditingController1,
                  focusNode: _focusNode1,
                  obscureText: _visibility,
                  cursorColor: Colors.blue,
                  cursorWidth: 1,
                  decoration: InputDecoration(
                    suffixIconConstraints: const BoxConstraints(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            _visibilityHover = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            _visibilityHover = false;
                          });
                        },
                        child: IconButton(
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            iconSize: 20,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              setState(() {
                                _visibility = !_visibility;
                              });
                            },
                            icon: Icon(
                                _visibility
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors
                                    .grey[_visibilityHover ? 700 : 400])),
                      ),
                    ),
                    filled: false,
                    hintText: "basic usage",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _ishover1 ? Colors.blue : Colors.grey),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue.shade800)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
                width: 540,
                height: 50,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                          color: Colors.grey.withOpacity(.2)),
                    )),
                    const Positioned(
                      bottom: 0,
                      top: 0,
                      child: SizedBox(
                        width: 70,
                        child: Center(child: Text("https://")),
                      ),
                    ),
                    Positioned(
                      left: 70,
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            _ishover2 = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            _ishover2 = false;
                          });
                        },
                        child: Container(
                          width: 400,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                              boxShadow: _isfocused2
                                  ? const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(184, 119, 174, 246),
                                        blurRadius: 0,
                                        spreadRadius: 2,
                                      )
                                    ]
                                  : null),
                          child: TextField(
                            controller: _textEditingController2,
                            focusNode: _focusNode2,
                            cursorColor: Colors.blue,
                            cursorWidth: 1,
                            decoration: InputDecoration(
                              filled: false,
                              hintText: "basic usage",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          _ishover2 ? Colors.blue : Colors.grey),
                                  borderRadius: BorderRadius.circular(0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade800)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: SizedBox(
                        width: 70,
                        child: Center(child: Text(".com")),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
