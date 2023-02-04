import 'package:corona/helper/helperApi.dart';
import 'package:corona/modles/countery.dart';
import 'package:flutter/material.dart';

class Coiv_19 extends StatefulWidget {
  const Coiv_19({super.key});

  @override
  State<Coiv_19> createState() => _Coiv_19State();
}

class _Coiv_19State extends State<Coiv_19> {
  late Future<List<coun>?> date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = ApiHelper.Covid.getDate();
  }

  String ko = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("covid19api"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        ko = value;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Search country...",
                        labelText: "country",
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: date,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          ...snapshot.data!.map(
                            (e) => Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage("${e.flag}"),
                                ),
                                title: Text("${e.country}"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        (e.cases > 20000)
                                            ? Icon(
                                                Icons.arrow_upward_rounded,
                                                color: Colors.red,
                                              )
                                            : Icon(
                                                Icons.arrow_downward,
                                                color: Colors.green,
                                              ),
                                        Text("${e.cases}"),
                                      ],
                                    ),
                                    Text("Case"),
                                  ],
                                ),
                                trailing: Column(
                                  children: [
                                    Text(
                                      "Deaths",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("${e.active}"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    if (snapshot.hasError) {
                      return Text("Date not Fond");
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
