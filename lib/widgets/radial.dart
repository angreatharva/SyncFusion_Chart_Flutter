import 'package:flutter/material.dart';
import 'package:graph/widgets/live.dart';
import 'package:graph/widgets/pie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class RadialChart extends StatefulWidget {
  const RadialChart({Key? key}) : super(key: key);

  @override
  State<RadialChart> createState() => _RadialChart();
}

class _RadialChart extends State<RadialChart> {

  List<Radialdata> chartData=[
    Radialdata("Atharva",90000),
    Radialdata("Nidhi",90000),
    Radialdata("Shrevan",80000),
    Radialdata("Venkat",70000,),
    Radialdata("Preetesh",50000),
    Radialdata("Mayur",60000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Radial Graph"),
          automaticallyImplyLeading: false,
        ),
        body:Column(
          children: [
            Container(
                height: 300,
                margin: EdgeInsets.all(10),
                child:SfCircularChart(
                  title: ChartTitle(text: "Sales Data",),
                  palette: [Colors.red,Colors.blue,Colors.green,Colors.orange,Colors.brown,Colors.purple,],
                  legend: Legend(isVisible: true),
                  series: [
                    DoughnutSeries<Radialdata,String>(
                      //trackColor: Colors.grey.shade400,
                      //radius: '90%',
                      //innerRadius: '30%',
                      //gap: '3%',
                      //cornerStyle: CornerStyle.bothCurve,
                      dataSource: chartData,
                        xValueMapper: (Radialdata data,_)=>data.xData,
                        yValueMapper: (Radialdata data,_)=>data.yData,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PieChart()));
                  }, child: Text("PIE Chart")),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LiveChart()));
                  }, child: Text("Live Chart"))

                ],
              ),
            ),
          ],
        )
    );
  }
}
class Radialdata{
  final num yData;
  final String xData;

  Radialdata(this.xData, this.yData);
}