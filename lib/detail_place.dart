import 'package:flutter/material.dart';
import 'tourism_place.dart';

class DetailPage extends StatefulWidget {
  final TourismPlace place;

  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  bool isFavorite = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.place.name}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              // _launchURL(widget.album.albumurl);
            },
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height)/3,
            decoration: BoxDecoration(
              color: (isFavorite) ? Colors.deepOrange : Colors.white,
            ),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.place.imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    // color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        widget.place.imageUrls[index],
                        width: 200,
                        height: 210,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.place.name,
                    style: TextStyle(
                      color: (isFavorite) ? Colors.deepOrangeAccent : Colors.black,
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Lokasi : ${widget.place.location}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      widget.place.description,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Harga Tiket : ${widget.place.ticketPrice}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${widget.place.openDays} | ${widget.place.openTime}",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
