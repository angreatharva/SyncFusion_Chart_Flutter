import 'package:flutter/material.dart';
import 'package:graph/main.dart';
import 'package:graph/widgets/pie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class CartesianChart extends StatefulWidget {
  const CartesianChart({Key? key}) : super(key: key);

  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {

  final List<SalesData>chartData=[
    SalesData(2001, 34000, Colors.pink),
  SalesData(2002, 33000, Colors.blue),
  SalesData(2003, 38000, Colors.red),
  SalesData(2004, 32000, Colors.green),
  SalesData(2005, 31000, Colors.orange),
  SalesData(2006, 35000, Colors.yellow),
  SalesData(2007, 28000, Colors.brown),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Cartesian Graph"),
      ),
      body:Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: SfCartesianChart(
              legend: Legend(isVisible: true),
              title: ChartTitle(text: "Sales Data"),
              series: <ChartSeries>[
                LineSeries<SalesData,int>(
                  dashArray: <double>[5,5],
                  legendItemText: "Sales",
                    pointColorMapper: (SalesData sales,_)=>sales.color,
                    dataSource: chartData,
                    xValueMapper: (SalesData sales,_)=> sales.year,
                    yValueMapper: (SalesData sales,_)=> sales.sales,)
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                }, child: Text("Home")),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PieChart()));
                }, child: Text("PIE Chart"))

              ],
            ),
          ),

        ],
      )
    );
  }
}

class SalesData {
  final int year;
  final double sales;
  final Color color;

  SalesData(this.year, this.sales, this.color);
}

