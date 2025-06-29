import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/health/health_bloc.dart';
import '../bloc/health/health_state.dart';

class HealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthBloc, HealthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Health Dashboard',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Health Stats Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildHealthCard(
                          'Heart Rate',
                          '72 BPM',
                          Icons.favorite,
                          Colors.red,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildHealthCard(
                          'Blood Pressure',
                          '120/80',
                          Icons.monitor_heart,
                          Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  
                  Row(
                    children: [
                      Expanded(
                        child: _buildHealthCard(
                          'Sleep',
                          '7.5 hrs',
                          Icons.bedtime,
                          Colors.purple,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildHealthCard(
                          'Hydration',
                          '6/8 glasses',
                          Icons.water_drop,
                          Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  
                  // Recent Health Records
                  Text(
                    'Recent Records',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 12),
                  
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return _buildHealthRecord(index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHealthCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthRecord(int index) {
    final records = [
      {'type': 'Blood Pressure', 'value': '118/78', 'time': '2 hours ago'},
      {'type': 'Weight', 'value': '70.5 kg', 'time': '1 day ago'},
      {'type': 'Heart Rate', 'value': '68 BPM', 'time': '3 hours ago'},
      {'type': 'Sleep Quality', 'value': '85%', 'time': '8 hours ago'},
      {'type': 'Steps', 'value': '8,542', 'time': '5 minutes ago'},
    ];
    
    final record = records[index];
    
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                record['type']!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                record['time']!,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Text(
            record['value']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.green[700],
            ),
          ),
        ],
      ),
    );
  }
}
