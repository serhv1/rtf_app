import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rtf_app/models/post_model.dart';
import 'package:rtf_app/service/api_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrofit request'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  FutureBuilder _body() {
    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));

    return FutureBuilder(
      future: apiService.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final posts = snapshot.data;
          return _posts(posts);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _posts(List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Text(
                posts[index].id.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                posts[index].name,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                posts[index].adress,
              ),
            ],
          ),
        );
      },
    );
  }
}
