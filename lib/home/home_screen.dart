import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/core/exceptions/app_exception.dart';
import 'package:flutter_5iwj_2024/core/models/post.dart';
import 'package:flutter_5iwj_2024/core/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> _posts = [];
  bool _loading = false;
  AppException? _error;

  @override
  void initState() {
    super.initState();

    setState(() => _loading = true);
    ApiServices.getPosts().then((data) {
      _posts = data;
    }).catchError((error) {
      _error = AppException.from(error);
    }).whenComplete(() {
      setState(() => _loading = false);
    });

    // WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
    //   setState(() => _loading = true);
    //   try {
    //     _posts = await ApiServices.getPosts();
    //   } catch (error) {
    //     _error = AppException.from(error);
    //   }
    //   setState(() => _loading = false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(builder: (context) {
          if (_loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Note: better nullable handling
          // final error = _error;
          // if (error != null) {
          //   return Center(
          //     child: Text(error.message),
          //   );
          // }

          if (_error != null) {
            return Center(
              child: Text(_error!.message),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final post = _posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemCount: _posts.length,
          );
        }),
      ),
    );
  }
}
