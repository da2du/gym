import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail(
      {Key? key,
      required this.url,
      required this.title,
      required this.description})
      : super(key: key);
  final url;
  final title;
  final description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: Text(title)),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow_outlined,
                                  color: Colors.white)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.fullscreen,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.volume_down,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(url[0])),
                  color: const Color.fromARGB(255, 202, 202, 202),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [Text(description)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
