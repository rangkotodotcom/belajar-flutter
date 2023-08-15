import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/players.dart';

class DetailPlayer extends StatelessWidget {
  static const routeName = "/detail-player";

  const DetailPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<Players>(context, listen: false);
    final playerId = ModalRoute.of(context)!.settings.arguments as String;
    final selectPLayer = players.selectById(playerId);
    final TextEditingController imageController =
        TextEditingController(text: selectPLayer.imageUrl);
    final TextEditingController nameController =
        TextEditingController(text: selectPLayer.name);
    final TextEditingController positionController =
        TextEditingController(text: selectPLayer.position);
    return Scaffold(
      appBar: AppBar(
        title: const Text("DETAIL PLAYER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Container(
                  width: 150,
                  height: 150,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageController.text,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                      height: 50,
                      width: 50,
                      child: Image.network(
                          "https://img.freepik.com/free-icon/user_318-563642.jpg"),
                    ),
                  ),
                ),
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Posisi"),
                textInputAction: TextInputAction.next,
                controller: positionController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: () {
                  players
                      .editPlayer(
                    playerId,
                    nameController.text,
                    positionController.text,
                    imageController.text,
                  )
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Row(
                          children: [
                            Icon(
                              Icons.circle_notifications_outlined,
                              color: Colors.white,
                            ),
                            Text("Berhasil diubah"),
                          ],
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.teal,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    Navigator.pop(context);
                  });
                },
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    players
                        .editPlayer(
                      playerId,
                      nameController.text,
                      positionController.text,
                      imageController.text,
                    )
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Row(
                            children: [
                              Icon(
                                Icons.circle_notifications_outlined,
                                color: Colors.white,
                              ),
                              Text("Berhasil diubah"),
                            ],
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.teal,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      Navigator.pop(context);
                    }).catchError(
                      (err) => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("TERJADI ERROR $err"),
                          content: const Text("Tidak dapat mengubah player."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("OKAY"),
                            ),
                          ],
                        ),
                      ),
                    );
                    ;
                  },
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
