import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart' as random_data;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
//  import 'package:intl/intl.dart';

import 'screen2_model.dart';
export 'screen2_model.dart';

class Task {
  final String id;
  final String name;
  final String type;
  final String sunlight;
  final String water;
  final String humidity;
  final String createdAt;
  final String updatedAt;

  Task({
    required this.id,
    required this.name,
    required this.type,
    required this.sunlight,
    required this.water,
    required this.humidity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['ID'],
      name: json['Name'],
      type: json['Type'],
      sunlight: json['Sunlight'],
      water: json['Water'],
      humidity: json['Humidity'],
      createdAt: json['CreatedAt'],
      updatedAt: json['UpdatedAt'],
    );
  }
}





class Screen2Widget extends StatefulWidget {
  const Screen2Widget({super.key});

  @override
  State<Screen2Widget> createState() => _Screen2WidgetState();
}

class _Screen2WidgetState extends State<Screen2Widget>
    with TickerProviderStateMixin {
  late Screen2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

final animationsMap = {
  'containerOnPageLoadAnimation': AnimationInfo(
    trigger: AnimationTrigger.onPageLoad,
    effects: [
      VisibilityEffect(duration: 1.ms),
      FadeEffect(
        curve: Curves.easeInOut,
        delay: 500.ms, // Add a delay of 500 milliseconds
        duration: 300.ms,
        begin: 0,
        end: 1,
      ),
      MoveEffect(
        curve: Curves.easeInOut,
        delay: 500.ms, // Add a delay of 500 milliseconds
        duration: 300.ms,
        begin: const Offset(0, 20),
        end: const Offset(0, 0),
      ),
      TiltEffect(
        curve: Curves.easeInOut,
        delay: 500.ms, // Add a delay of 500 milliseconds
        duration: 300.ms,
        begin: const Offset(0.698, 0),
        end: const Offset(0, 0),
      ),
    ],
  ),
};

String _formatTime(DateTime time) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final timeDifference = time.difference(today);

  if (timeDifference.inDays == 0) {
    // Today's time
    return 'Today, ${DateFormat('h:mm a').format(time)}';
  } else {
    // Other days' time
    return DateFormat('MMMM d, yyyy h:mm a').format(time);
  }
}

Future<DateTime> _getCurrentTime() async {
  return DateTime.now();
}


late List<Task> tasks = [];
  @override
  void initState() {
    super.initState();
     fetchData();
    _model = createModel(context, () => Screen2Model());
  }


Future<void> fetchData() async {
   

    final response = await http.get(Uri.parse('https://7727-103-4-220-252.ngrok-free.app/api/plant/plant'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        tasks = jsonData.map((taskData) => Task.fromJson(taskData)).toList();
      });
    } else {
      throw Exception('Failed to load tasks');
    }
  }
  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(
                        0,
                        2,
                      ),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                    child: Text(
                                      'GreenSage',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'last 7 days  data',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 12, 0),
                                child: Icon(
                                  Icons.radio_button_checked,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 16,
                                ),
                              ),
                              Text(
                                'Water',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 12, 0),
                                child: Icon(
                                  Icons.radio_button_checked,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 16,
                                ),
                              ),
                              Text(
                                'Temperature',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: FlutterFlowLineChart(
                          data: [
                            FFLineChartData(
                              xData: List.generate(
                                10, // Replace 10 with the number of data points you want
                                (index) =>
                                    index.toDouble(), // Cast index to double
                              ),
                              yData: List.generate(
                                10, // Replace 10 with the number of data points you want
                                (index) =>
                                    index *
                                    10.toDouble(), // Cast index * 10 to double
                              ),
                              settings: LineChartBarData(
                                color: FlutterFlowTheme.of(context).primary,
                                barWidth: 2,
                                isCurved: true,
                                preventCurveOverShooting: true,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: const Color(0x4C4B39EF),
                                ),
                              ),
                            ),
                            FFLineChartData(
                              xData: List.generate(
                                10, // Replace 10 with the number of data points you want
                                (index) =>
                                    index.toDouble(), // Cast index to double
                              ),
                              yData: List.generate(
                                10, // Replace 10 with the number of data points you want
                                (index) =>
                                    index *
                                    20.toDouble(), // Cast index * 20 to double
                              ),
                              settings: LineChartBarData(
                                color: FlutterFlowTheme.of(context).warning,
                                barWidth: 2,
                                isCurved: true,
                                preventCurveOverShooting: true,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: const Color(0x3239D2C0),
                                ),
                              ),
                            )
                          ],
                          axisBounds: const AxisBounds(),
                          xAxisLabelInfo: AxisLabelInfo(
                            title: 'Last 7 Days',
                            titleTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            title: 'Avg. Grade',
                            titleTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  
                  ],
                ),
              ),
              // add list view with title with name History and subtitle with date and trailing with grade add dummy text set item count to 5 
            Padding(
  padding: const EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: FlutterFlowTheme.of(context).secondaryBackground,
      boxShadow: const [
        BoxShadow(
          blurRadius: 3,
          color: Color(0x33000000),
          offset: Offset(
            0,
            1,
          ),
        )
      ],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 4),
            child: Text(
              'History',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            child: Text(
              'A summary of outstanding tasks.',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: tasks.length,
                
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return   Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                    child: Container(
                      width: 100,
                      height: 300,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 0,
                            color: Color(0xFFE0E3E7),
                            offset: Offset(
                              0,
                              1,
                            ),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              child: Container(
                                width: 4,
                                height: 270,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Text(
                                        'Task Type',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                       'ID: ${task.id}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    Text(
                                        "Name: ${task.name}",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                      Text(
                                        "Type: ${task.type}",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    Text(
                                        "Sunlight: ${task.sunlight}",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                     Text(
                                        "Water: ${task.water}",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                     Text(
                                        "Humidity: ${task.humidity}",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    Text(
                                      "Created At: ${task.createdAt}",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),

                                     Text(
                                        "Updated At: ${task.updatedAt}",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Text(
                                              'Due',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0,
                                                      ),
                                            ),
                                          ),
                                      Expanded(
  child: FutureBuilder<DateTime>(
    future: _getCurrentTime(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text(
          'Loading...',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
          ),
        );
      } else if (snapshot.hasError) {
        return Text(
          'Error: ${snapshot.error}',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
          ),
        );
      } else {
        // Format the current time
        final currentTime = snapshot.data!;
        final formattedTime = _formatTime(currentTime);
        return Text(
          formattedTime,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
          ),
        );
      }
    },
  ),
),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: badges.Badge(
                                              badgeContent: Text(
                                                '1',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0,
                                                        ),
                                              ),
                                              showBadge: true,
                                              shape: badges.BadgeShape.circle,
                                              badgeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              elevation: 4,
                                              padding: const EdgeInsets.all(8),
                                              position: badges.BadgePosition
                                                  .topStart(),
                                              animationType: badges
                                                  .BadgeAnimationType.scale,
                                              toAnimate: true,
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(16, 4, 0, 0),
                                                child: Text(
                                                  'Update',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                 
                },
              ),
            
            ),
          ),
        ],
      ),
    ),
  ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
)
 

           
             ],
          ),
        ),
      ),
    );
  }
}
