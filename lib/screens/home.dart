import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/screens/edit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> filteredNotes = [];
  @override
  void initState() {
    super.initState();
    filteredNotes = sampleNotes;
  }

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filteredNotes = sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      filteredNotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                Icon(
                  Icons.note,
                  size: 50,
                ),
                Text(
                  "My notes",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                TextField(
                  onChanged: onSearchTextChanged,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintStyle: TextStyle(color: Color(0xffA29898)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    fillColor: Colors.grey,
                    hintText: "Search notes",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xff77777D)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xff77777D)),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 30),
                    itemCount: filteredNotes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(bottom: 20),
                        color: getRandomColor(),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: RichText(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: "${filteredNotes[index].title}  \n",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    height: 1.5,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "Edited: ${filteredNotes[index].modifiedTime}",
                                      style: TextStyle(
                                        color: Color(0xff939191),
                                        fontSize: 10,
                                        height: 1.5,
                                      ),
                                    ),
                                  ]),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "${filteredNotes[index].content}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                final result = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.teal,
                                        icon: Icon(
                                          Icons.info,
                                          color: Colors.teal.shade100,
                                        ),
                                        title: Text(
                                          "Are you sure you want to delete?",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context, true);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.teal.shade100),
                                              child: SizedBox(
                                                width: 60,
                                                child: Text(
                                                  "Yes",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context, false);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.red.shade100),
                                              child: SizedBox(
                                                width: 60,
                                                child: Text(
                                                  "No",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                lf(result) {
                                  deleteNote(index);
                                }
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 10,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
