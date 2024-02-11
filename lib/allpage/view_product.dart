import 'package:flutter/material.dart';

class ViewProduct extends StatefulWidget {
  final Image ;
  final title;
  final id;
  const ViewProduct({super.key,required this.Image,required this.title, required this.id});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product View"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  children: [
                    Hero(
                        tag: widget.id,
                        child: Image.network(widget.Image)),
                    const SizedBox(height:15,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Titel: ${widget.title}"),
                    ),
                    Text("ID : ${widget.id}", style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ],
                ),
              ),
            ],
          ),
        )

    );
  }
}
