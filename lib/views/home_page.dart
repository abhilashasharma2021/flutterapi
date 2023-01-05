import 'package:flutter/material.dart';
import 'package:flutterapi/services/remote_service.dart';
import 'package:http/http.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>?posts;
  var isLoaded=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetch data from api

    getData();
  }
  getData() async{
    posts=await RemoteService().getPosts();
    if(posts!=null){
      setState(() {
        isLoaded=true;
      });
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Posts")
    ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length ,
            itemBuilder: (context, index){
              return Container(
                padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts![index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize:  24,
                              fontWeight: FontWeight.bold),),
                        Text(
                          posts![index].body??'',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              );
    },
    ),
      ),
    );
  }
}
