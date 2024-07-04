// ListView(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                     child: Container(
//                       width: 100,
//                       height: 120,
//                       decoration: BoxDecoration(
//                         color: FlutterFlowTheme.of(context).secondaryBackground,
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 0,
//                             color: Color(0xFFE0E3E7),
//                             offset: Offset(
//                               0,
//                               1,
//                             ),
//                           )
//                         ],
//                       ),
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
//                               child: Container(
//                                 width: 4,
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                   color: FlutterFlowTheme.of(context).primary,
//                                   borderRadius: BorderRadius.circular(4),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     12, 12, 12, 0),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 0, 0, 4),
//                                       child: Text(
//                                         'Task Type',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodySmall
//                                             .override(
//                                               fontFamily: 'Readex Pro',
//                                               letterSpacing: 0,
//                                             ),
//                                       ),
//                                     ),
//                                     Text(
//                                       'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
//                                       style: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .override(
//                                             fontFamily: 'Readex Pro',
//                                             letterSpacing: 0,
//                                           ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 8, 0, 0),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 4, 0),
//                                             child: Text(
//                                               'Due',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodySmall
//                                                       .override(
//                                                         fontFamily:
//                                                             'Readex Pro',
//                                                         letterSpacing: 0,
//                                                       ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Today, 5:30pm',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         fontFamily:
//                                                             'Readex Pro',
//                                                         letterSpacing: 0,
//                                                       ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 8, 0),
//                                             child: badges.Badge(
//                                               badgeContent: Text(
//                                                 '1',
//                                                 style:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           fontFamily:
//                                                               'Readex Pro',
//                                                           color: Colors.white,
//                                                           letterSpacing: 0,
//                                                         ),
//                                               ),
//                                               showBadge: true,
//                                               shape: badges.BadgeShape.circle,
//                                               badgeColor:
//                                                   FlutterFlowTheme.of(context)
//                                                       .primary,
//                                               elevation: 4,
//                                               padding: EdgeInsets.all(8),
//                                               position: badges.BadgePosition
//                                                   .topStart(),
//                                               animationType: badges
//                                                   .BadgeAnimationType.scale,
//                                               toAnimate: true,
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(16, 4, 0, 0),
//                                                 child: Text(
//                                                   'Update',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         fontFamily:
//                                                             'Readex Pro',
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .primary,
//                                                         letterSpacing: 0,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
                 
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                     child: Container(
//                       width: 100,
//                       height: 120,
//                       decoration: BoxDecoration(
//                         color: FlutterFlowTheme.of(context).secondaryBackground,
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 0,
//                             color: Color(0xFFE0E3E7),
//                             offset: Offset(
//                               0,
//                               1,
//                             ),
//                           )
//                         ],
//                       ),
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
//                               child: Container(
//                                 width: 4,
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                   color: FlutterFlowTheme.of(context).primary,
//                                   borderRadius: BorderRadius.circular(4),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     12, 12, 12, 0),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 0, 0, 4),
//                                       child: Text(
//                                         'Task Type',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodySmall
//                                             .override(
//                                               fontFamily: 'Readex Pro',
//                                               letterSpacing: 0,
//                                             ),
//                                       ),
//                                     ),
//                                     Text(
//                                       'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
//                                       style: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .override(
//                                             fontFamily: 'Readex Pro',
//                                             letterSpacing: 0,
//                                           ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 8, 0, 0),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 4, 0),
//                                             child: Text(
//                                               'Due',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodySmall
//                                                       .override(
//                                                         fontFamily:
//                                                             'Readex Pro',
//                                                         letterSpacing: 0,
//                                                       ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Today, 5:30pm',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         fontFamily:
//                                                             'Readex Pro',
//                                                         letterSpacing: 0,
//                                                       ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 8, 0),
//                                             child: badges.Badge(
//                                               badgeContent: Text(
//                                                 '1',
//                                                 style:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           fontFamily:
//                                                               'Readex Pro',
//                                                           color: Colors.white,
//                                                           letterSpacing: 0,
//                                                         ),
//                                               ),
//                                               showBadge: true,
//                                               shape: badges.BadgeShape.circle,
//                                               badgeColor:
//                                                   FlutterFlowTheme.of(context)
//                                                       .primary,
//                                               elevation: 4,
//                                               padding: EdgeInsets.all(8),
//                                               position: badges.BadgePosition
//                                                   .topStart(),
//                                               animationType: badges
//                                                   .BadgeAnimationType.scale,
//                                               toAnimate: true,
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(16, 4, 0, 0),
//                                                 child: Text(
//                                                   'Update',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         fontFamily:
//                                                             'Readex Pro',
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .primary,
//                                                         letterSpacing: 0,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                     child: Container(
//                       width: 100,
//                       height: 120,
//                       decoration: BoxDecoration(
//                         color: FlutterFlowTheme.of(context).secondaryBackground,
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 0,
//                             color: Color(0xFFE0E3E7),
//                             offset: Offset(
//                               0,
//                               1,
//                             ),
//                           )
//                         ],
//                       ),
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
//                               child: Container(
//                                 width: 4,
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                   color: FlutterFlowTheme.of(context).primary,
//                                   borderRadius: BorderRadius.circular(4),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     12, 12, 12, 0),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 0, 0, 4),
//                                       child: Text(
//                                         'Task Type',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodySmall
//                                             .override(
//                                               fontFamily: 'Readex Pro',
//                                               letterSpacing: 0,
//                                             ),
//                                       ),
//                                     ),
//                                     Text(
//                                       'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
//                                       style: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .override(
//                                             fontFamily: 'Readex Pro',
//                                             letterSpacing: 0,
//                                           ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 8, 0, 0),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 4, 0),
//                                             child: Text(
//                                               'Due',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodySmall
//                                                       .override(
//                                                         fontFamily:
//                                                             'Readex Pro',
//                                                         letterSpacing: 0,
//                                                       ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Today, 5:30pm',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         fontFamily:
//                                                             'Readex Pro',
//                                                         letterSpacing: 0,
//                                                       ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 8, 0),
//                                             child: badges.Badge(
//                                               badgeContent: Text(
//                                                 '1',
//                                                 style:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           fontFamily:
//                                                               'Readex Pro',
//                                                           color: Colors.white,
//                                                           letterSpacing: 0,
//                                                         ),
//                                               ),
//                                               showBadge: true,
//                                               shape: badges.BadgeShape.circle,
//                                               badgeColor:
//                                                   FlutterFlowTheme.of(context)
//                                                       .primary,
//                                               elevation: 4,
//                                               padding: EdgeInsets.all(8),
//                                               position: badges.BadgePosition
//                                                   .topStart(),
//                                               animationType: badges
//                                                   .BadgeAnimationType.scale,
//                                               toAnimate: true,
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(16, 4, 0, 0),
//                                                 child: Text(
//                                                   'Update',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         fontFamily:
//                                                             'Readex Pro',
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .primary,
//                                                         letterSpacing: 0,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
                
//                 ],
//               ),