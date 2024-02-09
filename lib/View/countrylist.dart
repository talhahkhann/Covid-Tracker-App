import 'package:covid_app/Services/states_services.dart';
import 'package:covid_app/View/detail.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  StatesServices statesServices = StatesServices();
  TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: _searchcontroller,
              decoration: InputDecoration(
                  hintText: 'Search with country name',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
            Expanded(
                child: FutureBuilder(
                    future: statesServices.countryList(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      subtitle: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white,
                                      ),
                                      title: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data![index]['state'];
                              if (_searchcontroller.text.isEmpty) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Detail_Page(
                                                      name:
                                                          snapshot.data![index]
                                                              ['state'],
                                                      deathProbable: snapshot.data![index]['deathProbable'],
                                                      onVentilatorCurrently: snapshot.data![index]['onVentilatorCurrently'],
                                                      totalTestResults:snapshot.data![index]['totalTestResults'],
                                                      totalTestsViral:snapshot.data![index]['totalTestsViral'],
                                                      hospitalizedCurrently: snapshot.data![index]['hospitalizedCurrently'],
                                                      positiveTestsViral: snapshot.data![index]['positiveTestsViral'],
                                                      negativeTestsViral: snapshot.data![index]['negativeTestsViral'],
                                                      total: snapshot.data![index]['total'],

                                                    )));
                                      },
                                      child: ListTile(
                                        subtitle: Text(snapshot.data![index]
                                                ['positive']
                                            .toString()),
                                        title: Text(
                                            snapshot.data![index]["state"]),
                                      ),
                                    )
                                  ],
                                );
                              } else if (name.toLowerCase().contains(
                                  _searchcontroller.text.toLowerCase())) {
                                return Column(
                                  children: [
                                    ListTile(
                                      subtitle: Text(snapshot.data![index]
                                              ['positive']
                                          .toString()),
                                      title:
                                          Text(snapshot.data![index]["state"]),
                                    )
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            });
                      }
                    }))
          ],
        ),
      )),
    );
  }
}
