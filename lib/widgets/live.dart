import 'dart:async';
import 'dart:math'as math;
import 'package:flutter/material.dart';
import 'package:graph/widgets/radial.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveChart extends StatefulWidget {
  const LiveChart({Key? key}) : super(key: key);

  @override
  State<LiveChart> createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {

  late List<LiveData>chartData;
  late  ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    super.initState();
    chartData=getChartData();
    Timer.periodic(const Duration(seconds: 1),updateDataSource);
  }

  int time=10;
  updateDataSource(Timer timer){
    chartData.add(LiveData(time++, (math.Random().nextInt(60))));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
      addedDataIndex: chartData.length-1,removedDataIndex: 0
    );
  }

  List<LiveData> getChartData(){
    return <LiveData>[
      LiveData(0, 42),
      LiveData(1, 41),
      LiveData(2, 46),
      LiveData(3, 47),
      LiveData(4, 43),
      LiveData(5, 42),
      LiveData(6, 43),
      LiveData(7, 40),
      LiveData(8, 45),
      LiveData(9, 41),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("LIVE Graph"),
          automaticallyImplyLeading: false,
    ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: SfCartesianChart(
              legend:Legend(isVisible: true),
              series: [
                SplineSeries<LiveData,int>(
                  onRendererCreated: (ChartSeriesController controller){
                    _chartSeriesController=controller;
                  },
                  legendItemText: "Sales",
                  dataSource: chartData,
                  xValueMapper: (LiveData data,_)=>data.time,
                  yValueMapper: (LiveData data,_)=>data.speed,
                  // xAxisName: "Time",
                  // yAxisName: "Speed",
                )
              ],
              primaryXAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 1),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                interval: 2,
                title: AxisTitle(text: "Time(Second)"),
              ),
    primaryYAxis: NumericAxis(
    majorGridLines: MajorGridLines(width: 1),
    edgeLabelPlacement: EdgeLabelPlacement.shift,
    interval: 2,
    title: AxisTitle(text: "Speed(m/s)")
    ),
          ),
    ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RadialChart()));
                }, child: Text("Radial Chart")),


              ],
            ),
          ),
        ],
      )
    );
  }
}

class LiveData{
  final int time;
  final int speed;

  LiveData(this.time, this.speed);
}