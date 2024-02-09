import 'package:covid_app/View/world_states.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Detail_Page extends StatefulWidget {
  String name;
  int? totalTestResults;
  int? hospitalizedCurrently;
  int? onVentilatorCurrently;
  int? totalTestsViral;
  int? deathProbable;
  int? total;
  int? positiveTestsViral;
  int? negativeTestsViral;

  Detail_Page(
      {required this.negativeTestsViral,
      required this.total,
      required this.positiveTestsViral,
      required this.name,
      required this.deathProbable,
      required this.onVentilatorCurrently,
      required this.totalTestResults,
      required this.hospitalizedCurrently,
      required this.totalTestsViral});

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PieChart(
                chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: true
                ),
                  chartType: ChartType.ring,
                  dataMap: {
                'Total': 500,
                'PositiveTestsViral':
                    100,
                'NegativeTestsViral':
                    400
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              reusableRow(
                  title: "DeathProbable", value: widget.deathProbable.toString()),
              reusableRow(
                  title: "onVentilatorCurrently",
                  value: widget.onVentilatorCurrently.toString()),
              reusableRow(
                  title: "TotalTestResults",
                  value: widget.totalTestResults.toString()),
              reusableRow(
                  title: "hospitalizedCurrently",
                  value: widget.hospitalizedCurrently.toString()),
              reusableRow(
                  title: "TotalTestsViral",
                  value: widget.totalTestsViral.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
