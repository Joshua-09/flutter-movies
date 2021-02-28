import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final dynamic map;

  MovieDetails({this.map});
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.map['title']),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(25),
              child: widget.map['posterpath'] == null
                  ? Image.asset('assets/default.jpg')
                  : Image.network(
                      'https://image.tmdb.org/t/p/w500/${widget.map['posterpath']}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Release Date: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text("${widget.map['date']}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flexible(
                  child: RichText(
                text: TextSpan(
                  text: 'Synopsis: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.map['overview'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal)),
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
