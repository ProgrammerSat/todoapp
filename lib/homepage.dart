import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage()
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 
  List tasks = ['job1', 'job2', 'job3'];
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("TodoApp"),
          
        ),
        body: Column(
          children: [
             TextField(
              onSubmitted: (value){
                if(textController.text.trim().isNotEmpty){
                  setState(() {
                      tasks.add(textController.text);
                      textController.text = '';
                  });
                }
              },
              controller: textController,
              decoration: InputDecoration(
                suffix: IconButton(
                  onPressed: (){
                    if(textController.text.trim().isNotEmpty){
                      setState(() {
                          tasks.add(textController.text);
                          textController.text = '';
                      });
                    }
                  }, 
                  icon: const Icon(Icons.send),
                  
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)))
              )
            ),
            SizedBox(
              height:300,
              child:ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index){
                  return Slidable(
                    startActionPane: const ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: ScrollMotion(),
                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: null,
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: null,
                          backgroundColor: Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ],
                    ),
                    endActionPane: const ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: ScrollMotion(),
                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: null,
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: null,
                          backgroundColor: Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ],
                    ),
                    child:ListTile( 
                      tileColor: Colors.cyan[200],
                      title: Text(tasks[index])
                    )
                  );
                  
                  
                  
                }
              )
            )
          ],
        )
    );
  }
}
