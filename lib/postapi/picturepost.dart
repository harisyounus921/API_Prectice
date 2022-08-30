import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PicturePostApi extends StatefulWidget {
  const PicturePostApi({Key? key}) : super(key: key);

  @override
  _PicturePostApiState createState() => _PicturePostApiState();
}

class _PicturePostApiState extends State<PicturePostApi> {
  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos')) ;
    var data = jsonDecode(response.body.toString());

    print(data);
    if(response.statusCode == 200){
      for(Map i in data){
        Photos photos = Photos(title: i['title'], url: i['url'] , id: i['id']);
        photosList.add(photos);
      }
      return photosList ;
    }else {
      return photosList ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Test'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context,AsyncSnapshot<List<Photos>> snapshot){
                  if(!snapshot.hasData){
                    return Center(child: Text('Loading'));
                  }else {
                    return ListView.builder(
                        itemCount: photosList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString()),
                            ),
                            title: Text('Notes id:'+photosList[index].id.toString()),
                            subtitle:Text(photosList[index].title.toString()),// Text(snapshot.data![index].title.toString()),
                          );
                        });
                  };
                }),
          ),
        ],
      ),
    );
  }
}

class Photos {
  String title , url ;
  int id ;
  Photos({required this.title ,required this.url , required this.id}) ;
}