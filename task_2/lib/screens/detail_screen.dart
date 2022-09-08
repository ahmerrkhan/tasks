import 'package:flutter/material.dart';

class DetailScreeb extends StatefulWidget {
  final String idN;
  final String firstN;
  final String lastN;
  final String emailN;

  const DetailScreeb(
      {required this.idN,
      required this.firstN,
      required this.lastN,
      required this.emailN,
      super.key});

  @override
  State<DetailScreeb> createState() => _DetailScreebState();
}

class _DetailScreebState extends State<DetailScreeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Info"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                child: Icon(
                  Icons.home,
                  size: 50.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 170,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ID         : ${widget.idN}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text("First Name : ${widget.firstN}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text("Last Name  : ${widget.lastN}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text("Email      : ${widget.emailN}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
