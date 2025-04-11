import 'package:fl_chart/fl_chart.dart'; //version: ^0.70.2
import 'package:flutter/material.dart';


class StatisticsView extends StatefulWidget {

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  // initialize data
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    List<String> sizes = ["XSmall", "Small", "Medium", "Large"];
    return Column(
      children: [
      Text(
        'Statistics',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Padding(padding: EdgeInsets.all(30)),
      Text("Top 3 Flavours"),
      SizedBox(
        width: 300,
        height: 300,
        child: BasicBarChart(titles: ["Regular Coffee", "Coconut Caramel Macchiato","Pumpkin Spice Latte"]),
      ),
      Padding(padding: EdgeInsets.all(30)),
      Text("Size Popularity"),
      SizedBox(
        width: 300,
        height: 300,
        child: BasicPieChart(data: [15,23,35,22], titles: sizes),
      )
      ],
    );
  }
}

class BasicPieChart extends StatefulWidget {
  final List<double> data;
  late List titles;
  BasicPieChart({required this.data, required this.titles});
  @override State<BasicPieChart> createState() => _BasicPieChartState();
}

class _BasicPieChartState extends State<BasicPieChart> {
  late List<PieChartSectionData> sections = [];
  
  updateSections (){
    sections.clear();
    sections.add(PieChartSectionData(title: "${widget.titles[0]}: ${widget.data[0]}", value: widget.data[0], color: Colors.blue, titleStyle: TextStyle(fontSize: 12, color: Colors.black)));
    sections.add(PieChartSectionData(title: "${widget.titles[1]}: ${widget.data[1]}", value: widget.data[1], color: Colors.purple, titleStyle: TextStyle(fontSize: 12, color: Colors.black)));
    sections.add(PieChartSectionData(title: "${widget.titles[2]}: ${widget.data[2]}", value: widget.data[2], color: Colors.pink, titleStyle: TextStyle(fontSize: 12, color: Colors.black)));
    sections.add(PieChartSectionData(title: "${widget.titles[3]}: ${widget.data[3]}", value: widget.data[3], color: Colors.red[400], titleStyle: TextStyle(fontSize: 12, color: Colors.black)));
  }
  
  @override
  Widget build(BuildContext context) {
    updateSections();
    
    return PieChart(
      PieChartData(
        sections: sections,
        centerSpaceRadius: 50,
      )
    );
  }
}

class BasicBarChart extends StatefulWidget {
  late List titles;
  BasicBarChart({required this.titles});
  @override State<BasicBarChart> createState() => _BasicBarChartState();
}

class _BasicBarChartState extends State<BasicBarChart> {
  late List<BarChartGroupData> bc = [];
  
  updateRods (){

    for (int i=0; i < 3; i++){
      BarChartGroupData barChartGroupData = BarChartGroupData(x: 3-i,
        barRods: [
          BarChartRodData(toY: 15 + i*3, color: Colors.brown),
          
        ],
      );
      bc.add(barChartGroupData);
    }

    
  }
  
  @override
  Widget build(BuildContext context) {
    updateRods();
    
    return BarChart(
      BarChartData(
        barGroups: bc
      )
    );
  }
}
