import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/postmodel.dart';

class post1api extends StatelessWidget {
  List<Postmodel> postList = [] ;

  Future<List<Postmodel>> getPostApi ()async{
    final resposne = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')) ;
    var data=jsonDecode(resposne.body.toString());
    if(resposne.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(Postmodel.fromJson(i));
      }
      return postList ;
    }else {
      return postList ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Test"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context ,AsyncSnapshot<List<Postmodel>> snapshot){
                if(!snapshot.hasData){
                  return Center(child: Text('Loading'));
                }else {
                  return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                SizedBox(height: 3,),
                                Text(snapshot.data![index].title.toString()),
                                //Text(postList[index].title.toString()),
                                SizedBox(height: 5,),
                                Text('Description' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                SizedBox(height: 3,),
                                Text('Description\n'+postList[index].body.toString() , style: Theme.of(context).textTheme.bodyText1)
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
