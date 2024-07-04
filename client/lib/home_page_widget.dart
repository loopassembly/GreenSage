// import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greensage/graph_all.dart';
import 'package:web_socket_channel/io.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late HomePageModel _model;
  double _opacity = 0.2;
  String waterVal = "0";
  String humidityval = "0";
  String tempVal = "0";
  String moistureVal = "0";
 
  String baseurl = "wss://7727-103-4-220-252.ngrok-free.app";
  late IOWebSocketChannel channelWater;
  late IOWebSocketChannel channelTemp;
  late IOWebSocketChannel channelMoisture;
  late IOWebSocketChannel channelHumidity;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    channelWater = IOWebSocketChannel.connect(
        '$baseurl/api/plant/ws/waterpump');
    channelTemp = IOWebSocketChannel.connect(
        '$baseurl/api/plant/ws/temperature');
    channelMoisture = IOWebSocketChannel.connect(
        '$baseurl/api/plant/ws/light');
    channelHumidity = IOWebSocketChannel.connect(
        '$baseurl/api/plant/ws/humidity');
         _model = createModel(context, () => HomePageModel());
    streamListenerTemp();
    streamListenerHumidity();
    streamListenerWater();
    streamListenerMoisture();
  }

streamListenerTemp() {
  channelTemp.stream.listen((tempmsg) {
    // print("Temperature Data Received: $tempmsg");
    setState(() {
      tempVal = tempmsg;
    });
  });
}

streamListenerHumidity() {
  channelHumidity.stream.listen((humipmsg) {
    // print("Humidity Data Received: $humipmsg");
    setState(() {
      humidityval = humipmsg;
    });
  });
}

streamListenerWater() {
  channelWater.stream.listen((waterpmsg) {
    // print("Water Pump Data Received: $waterpmsg");
    // print(_animation.value);
    setState(() {
      waterVal = waterpmsg;

      // Check if the received message is "yes"
      if (waterpmsg == "ON") {
        // Start the animation
        
        // _animationController.forward();
        // _animationController.repeat();
        _opacity=0.4;
        _animationController.repeat(reverse: true);

      } else {
        // If the message is not "yes", stop the animation
      //  _animationController.stop();
        _opacity=0.2;
        _animationController.value = 1.0;
        
      }
    });
    // print(_animation.value);
  });
 
}


streamListenerMoisture() {
  channelMoisture.stream.listen((moisturepmsg) {
    // print("Moisture Data Received: $moisturepmsg");
    setState(() {
      moistureVal = moisturepmsg;
    });
  });
}

  @override
  void dispose() {
    _model.dispose();
 _animationController.dispose();
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(-1, 1),
            child: Text(
              'GreeenSage',
              style: FlutterFlowTheme.of(context).headlineLarge,
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: FlutterFlowDropDown(
                          options: const ['Plant1', 'plant2'],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: 300,
                          height: 50,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Please select...',
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2,
                          borderRadius: 8,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16, 4, 16, 4),
                          hidesUnderline: true,
                          // isOverButton: true,
                          // isSearchable: false,
                          // isMultiSelect: false,
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Adjust the width as needed for spacing
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.green[900],
                              borderRadius: 10,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor: Colors.green[800],
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                      child: AnimatedBuilder(
                        animation: _animation,
                          builder: (context, child) {
                         return Container(
                          width: 125,
                          height: 121,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(174, 209, 206, 12)
                                    .withOpacity(0.2), // Shadow color
                                spreadRadius: 2, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: const Offset(0, 1), // Offset
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1, -1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 0, 0),
                                  child: Container(
                                    width: 38,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0x4AFFFF66),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0, 0),
                                      child: Icon(
                                        Icons.sunny,
                                        color:
                                            FlutterFlowTheme.of(context).warning,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.7, 1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 30),
                                  child: Text(
                                    tempVal,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1, 1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 10),
                                  child: Text(
                                    'Sunlight',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.w200,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
   } ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                      child: Container(
                        width: 125,
                        height: 121,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(47, 245, 61, 190)
                                  .withOpacity(0.2), // Shadow color
                              spreadRadius: 2, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: const Offset(0, 1), // Offset
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1, -1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 0),
                                child: Container(
                                  width: 38,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0x22F99BE7),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.temperatureLow,
                                      color: Color(0xFFED46F9),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.7, 1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 10, 30),
                                child: Text(
                                  humidityval,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1, 1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 10, 10),
                                child: Text(
                                  'Humidity',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.w200,
                                      ),
                                ),
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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                      child: AnimatedBuilder(
                        animation: _animation,
                        
                       
                          builder: (context, child) {
                        return Container(
                          width: 125,
                          height: 121,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 4, 223, 194)
                                    .withOpacity(_opacity*_animation.value), // Shadow color
                                spreadRadius: 2, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: const Offset(0, 1), // Offset
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1, -1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 0, 0),
                                  child: Container(
                                    width: 38,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0x2239D2C0),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0, 0),
                                      child: Icon(
                                        Icons.water_drop_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.7, 1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 30),
                                  child: Text(
                                    waterVal,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1, 1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 10),
                                  child: Text(
                                    'Pump',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.w200,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
   } ),
                    
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                      child: Container(
                        width: 125,
                        height: 121,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 72, 180, 44)
                                  .withOpacity(0.2), // Shadow color
                              spreadRadius: 2, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: const Offset(0, 1), // Offset
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1, -1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 0),
                                child: Container(
                                  width: 38,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0x2239D2C0),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.leaf,
                                      color: Color(0xFF1BE585),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.7, 1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 10, 30),
                                child: Text(
                                  moistureVal,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1, 1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 10, 10),
                                child: Text(
                                  "Moisture",
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.w200,
                                         ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     GestureDetector(
  onTap: () {
    // Navigate to a different screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          // Replace `YourNextScreen()` with the screen you want to navigate to
          return const Screen2Widget();
        },
      ),
    );
  },
  child: Container(
    width: 300,
    height: 90,
    decoration: BoxDecoration(
      color: FlutterFlowTheme.of(context).secondaryBackground,
      borderRadius: BorderRadius.circular(24),
      shape: BoxShape.rectangle,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(-1, -1),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
            child: Container(
              width: 38,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0x33EE8B60),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Icon(
                  Icons.align_vertical_bottom_rounded,
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'This week ML record',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),

                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color(0x0014181B),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(1, 0),
                            child: FlutterFlowIconButton(
                              borderColor: const Color.fromARGB(213, 239, 108, 0),
                              borderRadius: 20,
                              borderWidth: 1,
                              buttonSize: 50,
                              fillColor: const Color.fromARGB(71, 239, 108, 0),
                              icon: Icon(
                                Icons.replay,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
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
  }
}
