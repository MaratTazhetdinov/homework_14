import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {

  const ChessBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
          child: Center(
            child: SizedBox(
                height: width,
                width: width,
                child: createChessBoard()
            ),
          )
      ),
    );
  }

  Widget createChessBoard() {
    return Column(
      children: createRows(),
    );
  }

  List<Widget> createRows() {
    var rowsList = <Widget>[];

    for (int i=0; i<8; i++) {
      rowsList.add(Expanded(child: Row(children: createCells(i)),));
    }

    return rowsList;
  }

  List<Widget> createCells(int index) {
    var cellsList = <Widget>[];
    final firstColor = index % 2 == 0 ? Colors.white : Colors.black;
    final secondColor = firstColor == Colors.white ? Colors.black : Colors.white;

    for (int i=0; i<8; i++) {
      final color = i % 2 == 0 ? firstColor : secondColor;
      cellsList.add(Expanded(child: Container(color: color)));
    }

    return cellsList;
  }
}