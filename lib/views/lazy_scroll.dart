import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LazyScroll extends StatefulWidget {
  const LazyScroll({Key? key}) : super(key: key);

  @override
  State<LazyScroll> createState() => _LazyScrollState();
}

class _LazyScrollState extends State<LazyScroll> {

  final controller=ScrollController();
/*  List<String   >items=List.generate(
      15, (index) => 'Item ${index+1}',
  );*/
  List<String>items=[];
  bool hasMore=true;
  bool isLoading=false;
   int page=1;

   @override
  void initState() {
    super.initState();
    fetch();
    controller.addListener(() {
      if(controller.position.maxScrollExtent==controller.offset){
        fetch();
      }


    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future refresh() async{
    setState(() {
      isLoading=false;
      hasMore=true;
      page=0;
      items.clear();
    });
    fetch();
  }

  Future fetch()async{
     if(isLoading)return;
     isLoading=true;

     const limit=25;
   final  url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
   final responce= await http.get(url);

   if(responce.body==200){
     final List newItems=json.decode(responce.body);

     setState(() {
       page++;
       isLoading=false;

       if(newItems.length<limit){
         hasMore=false;
       }

       //  items.addAll(['Item A','Item B','Item C','Item D']);
       items.addAll(newItems.map<String>((item) {
         final number=item["id"];
         return 'Item $number';
       }).toList());
     });
   }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Infinte Scroll ListView'),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
          controller: controller,
           padding: const EdgeInsets.all(8),
            itemCount: items.length+1,
            itemBuilder:(context ,index){
             if(index<items.length){
               final item=items[index];
               return ListTile(title: Text(item));
    }
             else{
               return  Padding(
                   padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: hasMore
                ? const CircularProgressIndicator()
                    :const Text("No Load More Data")


              ),
               );
             }
    },
        ),
      ),
    );
  }
}
