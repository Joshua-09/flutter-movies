import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/API/movieListAPI.dart';
import 'package:flutter_app/Screen/MovieDetails.dart';
import 'package:flutter_app/SharedPref/searchkey.dart';
// import 'package:flutter_app/Movie/MovieList.dart';
// import 'package:flutter_app/SharedPref/searchkey.dart';
import 'package:flutter_app/Widget/widget.dart';
import 'package:http/http.dart' as http;
import 'package:sup/sup.dart';

SharedPrefs sharedPrefs = SharedPrefs();

class Homepage extends StatefulWidget {
  final String title;
  Homepage({this.title});
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String temp;
  TextEditingController search = TextEditingController();
  // MovieList movie = MovieList();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('search $movie');
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
        return <Widget>[createSilverAppBar1(), createSilverAppBar2()];
      },
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15),
        child: FutureBuilder(
            future: getSearchMovie(search.text ?? 'a'),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Container(
                    child: Sup(
                      title: Text("Empty!"),
                      subtitle: Text("Ow! No Movies to display.."),
                      image: Image.asset('assets/default.jpg'),
                    ),
                  ),
                );
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 1),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var img;
                  // print("snapper ${snapshot.data[index]}");
                  var data = snapshot.data[index];
                  // MovieList movie = snapshot.data;
                  if (data['posterpath'] != null) {
                    img =
                        'https://image.tmdb.org/t/p/w500/${data['posterpath']}';
                  } else if (data['posterpath'] == null) {
                    img = 'https://fastnovel.net/images/novel/default.jpg';
                  }
                  dynamic details = {
                    'id': data['id'],
                    'title': data['title'],
                    'posterpath': data['posterpath'],
                    'date': data['date'],
                    'overview': data['overview'],
                  };
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetails(
                                  map: details,
                                )),
                      );
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(child: Image.network(img)),
                          Text(data["title"]),
                          Text(data['date'])
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    ));
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      toolbarHeight: 50,
      centerTitle: true,
      backgroundColor: Colors.redAccent,
      title: Text('Flutter Movies', style: TextStyle(fontSize: 30)),
    );
  }

  SliverAppBar createSilverAppBar2() {
    return SliverAppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.redAccent,
      pinned: true,
      title: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        // decoration: BoxDecoration(
        //   boxShadow: <BoxShadow>[
        //     BoxShadow(
        //         color: Colors.grey.withOpacity(0.6),
        //         offset: const Offset(1.1, 1.1),
        //         blurRadius: 5.0),
        //   ],
        // ),
        child: CupertinoTextField(
          controller: search,
          keyboardType: TextInputType.text,
          placeholder: 'Search',
          placeholderStyle: TextStyle(
            color: Color(0xffC4C6CC),
            fontSize: 14.0,
            fontFamily: 'Brutal',
          ),
          onChanged: (value) {
            temp = value.toString();
          },
          suffix: Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 15.0, 5.0),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    search.text = temp;
                  });
                },
                child: Text('Search'),
              )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
