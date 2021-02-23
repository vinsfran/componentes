import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Titulo de esta tarjeta'),
            subtitle: Text(
                'Akjsdlfsl;fls kljl;kj;l lsjdfl;kja;lfj;lskjf;l ksjf;lkjslkjsl;kfj;lsa;lksjf;lkjal;dkfjlskjdf;lk klfoiuoeroitiuhbkjhgieurymvnkjldfsghjdfjh  hhiouyeionkfjhgiosru'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(child: Text('Cancelar'), onPressed: () {}),
              FlatButton(child: Text('OK'), onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}

Widget _cardTipo2() {
  return Card(
    child: Column(
      children: <Widget>[
        FadeInImage(
            image: NetworkImage(
                'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover),
        // Image(
        //     image: NetworkImage(
        //         'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg')),
        Container(padding: EdgeInsets.all(10.0), child: Text('Texto'))
      ],
    ),
  );
}
