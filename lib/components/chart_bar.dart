import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChartBar extends StatelessWidget {

  final String? label;
  final double? value;
  final double? percentage;
  // ignore: use_key_in_widget_constructors
  ChartBar({
    this.label,
    this.value,
    this.percentage,
    Key? key,
  }): super (key: key);
  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints){
        return Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text(value!.toStringAsFixed(2)),
              ),),
              SizedBox(height: constraints.maxHeight * 0.05,),
              Container(
                height: constraints.maxHeight * 0.6,
                width: 10,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        color: const Color.fromARGB(130, 200, 200, 200),
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                    FractionallySizedBox(
                      heightFactor: percentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05,),
              Container(height: constraints.maxHeight * 0.15,
                child: FittedBox(child: Text(label!)))
            ],
          );
      }

    );
  }
}