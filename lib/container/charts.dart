import 'package:flutter/material.dart';

import '../bar_grave/bar_graph.dart';

    class ChartsPage extends StatefulWidget {
      const ChartsPage({super.key});
    
      @override
      State<ChartsPage> createState() => _ChartsPageState();
    }
    
    class _ChartsPageState extends State<ChartsPage> {

      List<double> weeklySummary = [
        28.40,
        19.50,
        40.42,
        50.50,
        100.20,
        88.99,
        100.10,
      ];

      @override
      Widget build(BuildContext context) {
        return Center(
          child: SizedBox(
            height: 200,
            child: Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: MyBarGraph(
                weeklySummary: weeklySummary,
              ),
            ),
          ),
        );
      }
    }

    /*
    return Center(
          child: SizedBox(
            height: 200,
            child: MyBarGraph(
              weeklySummary: weeklySummary,
            ),
          ),
        );
    */

    /*

    Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          body: Center(
            child: SizedBox(
              height: 200,
                child: MyBarGraph(
                  weeklySummary: weeklySummary,
                ),
            ),
          ),
        );
      }

     */
    

