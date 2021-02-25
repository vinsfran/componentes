import 'package:flutter/material.dart';

import 'dart:async';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [1, 2, 3, 4, 5];
  int _cantidadCargar = 3;
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarLista(_cantidadCargar);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregarLista(10);
        _fechData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[
            _crearLoading(),
            _crearLista(),
          ],
        ));
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index) {
        final imagen = _listaNumeros[index];

        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          placeholder: AssetImage('assets/images/jar-loading.gif'),
        );
      },
    );
  }

  void _agregarLista(int cantidad) {
    for (int i = 1; i < cantidad; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> _fechData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, _respuestaHTTP);
  }

  void _respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(microseconds: 250));
    _agregarLista(_cantidadCargar);
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
