import 'package:flutter/material.dart';

void main() {
  final itemList = List<ListItem>.generate(
    200,
    (i) => i % 6 == 0
      ? HeadingItem('Header $i')
      : MessageItem('Sender $i', 'Message body $i')
  );
  runApp(
    MyApp(
      items: itemList
    )
  );
}

class MyApp extends StatelessWidget {
  final List<ListItem> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            final item = items[i];
            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
              tileColor: item is HeadingItem ? Colors.grey : Colors.white,
            );
          },
        ),
      ),
    );
  }
}


abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem extends ListItem {
  final String heading;
  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5
    );
  }

  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem extends ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}