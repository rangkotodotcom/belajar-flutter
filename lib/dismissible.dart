import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final faker = Faker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dismissible"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {},
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Confirm"),
                    content: const Text("Yakin hapus item?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text("Tidak"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text("Ya"),
                      ),
                    ],
                  );
                },
              );
            },
            key: Key(index.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                size: 25,
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(
                right: 10,
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Center(child: Text("${index + 1}")),
              ),
              title: Text(faker.person.name()),
              subtitle: Text(faker.lorem.sentence()),
            ),
          );
        },
      ),
    );
  }
}
