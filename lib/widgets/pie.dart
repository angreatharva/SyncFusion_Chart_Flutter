import 'package:flutter/material.dart';
import 'package:graph/widgets/cartesian.dart';
import 'package:graph/widgets/radial.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class PieChart extends StatefulWidget {
  const PieChart({Key? key}) : super(key: key);

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {

  List<PieData> chartData=[
    PieData("Atharva",90000),
    PieData("Nidhi",90000),
    PieData("Shrevan",80000),
    PieData("Venkat",70000,),
    PieData("Preetesh",50000),
    PieData("Mayur",60000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PIE Graph"),
          automaticallyImplyLeading: false,
        ),
        body:Column(
          children: [
            Container(
              height: 300,
                margin: EdgeInsets.all(10),
              child:SfCircularChart(
                title: ChartTitle(text: "Sales Data"),
                palette: [Colors.red,Colors.blue,Colors.green,Colors.orange,Colors.brown,Colors.purple,],
                legend: Legend(isVisible: true),
                series: [
                  PieSeries<PieData,String>(
                    explode: true,
                    explodeIndex: 0,
                    radius: '120',
                    dataSource: chartData,
                    xValueMapper: (PieData data,_)=>data.xData,
                    yValueMapper: (PieData data,_)=>data.yData,
                    dataLabelSettings: DataLabelSettings(isVisible: true)
                  )
                ],
              )
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartesianChart()));
                  }, child: Text("Cartesian Chart")),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RadialChart()));
                  }, child: Text("Radial Chart"))

                ],
              ),
            ),
          ],
        )
    );
  }
}
class PieData{
  final String xData;
  final num yData;
  PieData(this.xData, this.yData);
}