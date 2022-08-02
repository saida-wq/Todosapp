// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Todecard extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function myfunc;
  final int lk;
  final int well;
  final Function delete;
  const Todecard(
      {Key? key,
      required this.vartitle,
      required this.doneORnot,
      required this.lk,
      required this.delete,required this.well,
      required this.myfunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(lk);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(color: doneORnot? Colors.black:Colors.white, 
                fontSize: 22,
                decoration: doneORnot? TextDecoration.lineThrough :TextDecoration.none,
                 ),
              ),
              Row(children: [
                Icon(
                  doneORnot ? Icons.check : Icons.close,
                  size: 27,
                  color: doneORnot ? Colors.green[400] : Colors.red,
                ),
                SizedBox(
                  width: 17,
                ),
                IconButton(
                    onPressed: () {
                      delete(well);
                    },
                    icon: Icon(Icons.delete))
              ]),
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.2),
              borderRadius: BorderRadius.circular(11)),
        ),
      ),
    );
  }
}
