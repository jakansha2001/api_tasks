import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  const Animations({super.key});

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  // bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animations'),
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Container();
                },
                transitionBuilder:

                    /// It is used to show how the child will animate. Here, animation is used to push
                    /// and secondary is used to pop
                    (context, animation, secondaryAnimation, child) {
                  /// We are getting the double value of the curve easeInOutBack
                  /// and that is passed to Transform.scale
                  var curve = Curves.easeInOutBack.transform(animation.value);
                  return Transform.scale(
                    // scale: animation.value,
                    scale: curve,
                    child: const SimpleDialog(
                      children: [
                        CardDialog(),
                      ],
                    ),
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              );
            },
            child: const Text('Alert Dialog'),
          ),
        ));
  }
}

class CardDialog extends StatelessWidget {
  const CardDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text(
          'Named Account Customer (NAC)',
          style: TextStyle(
            color: Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(
                'GCSS CONSIGNEE',
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
        ElevatedButton(
          child: const Text('Confirmed'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
