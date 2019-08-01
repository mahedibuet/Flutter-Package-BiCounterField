library bi_counter_field;

import 'package:flutter/material.dart';

class BiCounterField extends StatefulWidget {
  final bool supportFraction;
  final dynamic initialValue, stepValue, maxLimit, minLimit;
  final double width, height, borderWidth;
  final Function(dynamic value) onChanged;
  final EdgeInsetsGeometry margin;
  final TextStyle style;
  final Color buttonColor, counterColor, borderColor;
  BiCounterField(
      {this.maxLimit = 99999,
      this.minLimit = -99999,
      this.borderWidth = 1,
      this.width = 120,
      this.height = 35,
      this.initialValue = 0,
      this.stepValue = 1,
      this.supportFraction = false,
      this.buttonColor = Colors.white,
      this.counterColor = Colors.white,
      this.borderColor = Colors.black,
      this.margin = const EdgeInsets.all(5.0),
      this.style = const TextStyle(
        fontFamily: 'SegoeUI',
        color: Color(0xff000000),
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      @required this.onChanged});
  @override
  _BiCounterFieldState createState() => _BiCounterFieldState();
}

class _BiCounterFieldState extends State<BiCounterField> {
  dynamic counter;
  @override
  void initState() {
    counter = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              if (counter > widget.minLimit)
                setState(() {
                  counter = counter - widget.stepValue;
                  widget.onChanged(counter);
                });
            },
            child: Container(
              width: widget.width * 0.32,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.buttonColor,
                border: Border.all(color: widget.borderColor, width: widget.borderWidth),
              ),
              child: Center(
                child: Text(
                  "-",
                  style: widget.style,
                ),
              ),
            ),
          ),
          Container(
            width: widget.width * 0.36,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.counterColor,
              border: Border(
                top: BorderSide(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                ),
                bottom: BorderSide(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                ),
              ),
            ),
            child: Center(
              child: Text(
                (counter is int) ? '$counter' : '${counter.toStringAsFixed(1)}',
                style: widget.style,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (counter < widget.maxLimit)
                setState(() {
                  counter = counter + widget.stepValue;
                  widget.onChanged(counter);
                });
            },
            child: Container(
              width: widget.width * 0.32,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.buttonColor,
                border: Border.all(color: widget.borderColor, width: widget.borderWidth),
              ),
              child: Center(
                child: Text(
                  "+",
                  style: widget.style,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
