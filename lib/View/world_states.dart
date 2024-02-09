import 'package:covid_app/Models/world_states_model.dart';
import 'package:covid_app/Services/states_services.dart';
import 'package:covid_app/View/countrylist.dart';
import 'package:covid_app/View/states_screen.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class World_States extends StatefulWidget {
  const World_States({super.key});

  @override
  State<World_States> createState() => _World_StatesState();
}

class _World_StatesState extends State<World_States>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              FutureBuilder(
                  future: statesServices.fetchWorldStatesRecords(),
                  builder:
                      (context, AsyncSnapshot<world_states_model> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                          flex: 1,
                          child: SpinKitFadingCube(
                            color: Colors.white,
                            size: 50.0,
                            controller: _controller,
                          ));
                    } else {
                      return Column(
                        children: [


                          ElevatedButton(onPressed: (){
                            EasyDynamicTheme.of(context).changeTheme();
                          }, child: Text("Switch Theme")),
                          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                          PieChart(

                            dataMap: {

                              "Positive": double.parse(
                                  snapshot.data!.positive.toString()),
                              "Negative": double.parse(
                                  snapshot.data!.negative.toString()),
                              "Deaths":
                                  double.parse(snapshot.data!.death.toString())
                            },
                            chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            animationDuration:
                                const Duration(milliseconds: 1200),
                            colorList: colorList,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.06),
                            child: Card(
                              child: Column(
                                children: [
                                  reusableRow(
                                      title: "Total States",
                                      value: snapshot.data!.states.toString()),
                                  reusableRow(
                                      title: "Hospitalized Currently",
                                      value: snapshot
                                          .data!.hospitalizedCurrently
                                          .toString()),
                                  reusableRow(
                                      title: "onVentilator Currently",
                                      value: snapshot
                                          .data!.onVentilatorCurrently
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => CountryList())));
                              },
                              child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    "Track Countries",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )))
                        ],
                      );
                    }
                  }),

            ],
          ),
        ),
      ),
    );
  }
}

class reusableRow extends StatelessWidget {
  String title, value;
  reusableRow({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(
                value,
              )
            ],
          )
        ],
      ),
    );
  }
}
