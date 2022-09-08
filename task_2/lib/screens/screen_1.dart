import 'package:flutter/material.dart';
import 'package:task_2/screens/detail_screen.dart';
import 'package:task_2/services/remote_services.dart';

import '../models/post.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<Post>? posts;
  bool isLoadd = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //fetch data api
    getData();
  }

  //here is our method
  getData() async {
    posts = await RemoteServices().getPosts();
    if (posts != null) {
      setState(() {
        isLoadd = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Test"),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Visibility(
        visible: isLoadd,
        replacement: const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return DetailScreeb(
                      idN: posts![index].id.toString(),
                      firstN: posts![index].firstName.toString(),
                      lastN: posts![index].lastName.toString(),
                      emailN: posts![index].email.toString(),
                    );
                  }));
                },
                title: Text("First Name : ${posts![index].firstName}"),
                subtitle: Text("Last Name : ${posts![index].lastName}"),
                trailing: Text(posts![index].id.toString()),
                leading: const CircleAvatar(
                  child: Icon(Icons.home),
                ),
              );
            }),
      ),
    );
  }
}
