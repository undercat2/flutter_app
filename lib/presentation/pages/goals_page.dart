import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/goals/goals_bloc.dart';
import '../bloc/goals/goals_state.dart';

class GoalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalsBloc, GoalsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Goals',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[800],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle, color: Colors.purple[800], size: 32),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  
                  // Progress Overview
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple[400]!, Colors.purple[600]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weekly Progress',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '68%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '4 of 6 goals completed',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircularProgressIndicator(
                          value: 0.68,
                          strokeWidth: 6,
                          backgroundColor: Colors.white30,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  
                  // Goal Categories
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 12),
                  
                  Row(
                    children: [
                      Expanded(
                        child: _buildCategoryCard(
                          'Health',
                          Icons.health_and_safety,
                          Colors.green,
                          '3 goals',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildCategoryCard(
                          'Fitness',
                          Icons.fitness_center,
                          Colors.orange,
                          '2 goals',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildCategoryCard(
                          'Mental',
                          Icons.psychology,
                          Colors.blue,
                          '1 goal',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  
                  // Active Goals List
                  Text(
                    'Active Goals',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 12),
                  
                  Expanded(
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return _buildGoalItem(index);
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

  Widget _buildCategoryCard(String title, IconData icon, Color color, String subtitle) {
    return Container(
      padding: EdgeInsets.all(12),
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
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalItem(int index) {
    final goals = [
      {'title': 'Drink 8 glasses of water daily', 'progress': 0.75, 'category': 'Health', 'completed': false},
      {'title': 'Exercise 30 minutes', 'progress': 1.0, 'category': 'Fitness', 'completed': true},
      {'title': 'Read for 20 minutes', 'progress': 0.6, 'category': 'Mental', 'completed': false},
      {'title': 'Take 10,000 steps', 'progress': 0.85, 'category': 'Fitness', 'completed': false},
      {'title': 'Meditate for 10 minutes', 'progress': 1.0, 'category': 'Mental', 'completed': true},
      {'title': 'Eat 5 servings of fruits/vegetables', 'progress': 0.4, 'category': 'Health', 'completed': false},
    ];
    
    final goal = goals[index];
    
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: goal['completed'] as bool ? Colors.green[300]! : Colors.grey[200]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  goal['title'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    decoration: goal['completed'] as bool ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              if (goal['completed'] as bool)
                Icon(Icons.check_circle, color: Colors.green, size: 24)
              else
                CircularProgressIndicator(
                  value: goal['progress'] as double,
                  strokeWidth: 3,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  goal['category'] as String,
                  style: TextStyle(
                    color: Colors.purple[800],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              Text(
                '${((goal['progress'] as double) * 100).toInt()}%',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
