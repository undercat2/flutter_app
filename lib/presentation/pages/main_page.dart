import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation/navigation_bloc.dart';
import '../bloc/navigation/navigation_event.dart';
import '../bloc/navigation/navigation_state.dart';
import 'mental_page.dart';
import 'physical_page.dart';
import 'health_page.dart';
import 'goals_page.dart';
import 'settings_page.dart';
import '../../core/di/injection_container.dart' as di;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          body: IndexedStack(
            index: state.currentIndex,
            children: [
              MentalPage(),
              PhysicalPage(),
              HealthPage(),
              GoalsPage(),
              SettingsPage(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      context,
                      0,
                      Icons.psychology_rounded,
                      'Mental',
                      state.currentIndex == 0,
                    ),
                    _buildNavItem(
                      context,
                      1,
                      Icons.fitness_center_rounded,
                      'Physical',
                      state.currentIndex == 1,
                    ),
                    _buildNavItem(
                      context,
                      2,
                      Icons.favorite_rounded,
                      'Health',
                      state.currentIndex == 2,
                    ),
                    _buildNavItem(
                      context,
                      3,
                      Icons.flag_rounded,
                      'Goals',
                      state.currentIndex == 3,
                    ),
                    _buildNavItem(
                      context,
                      4,
                      Icons.settings_rounded,
                      'Settings',
                      state.currentIndex == 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    IconData icon,
    String label,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<NavigationBloc>().add(NavigationTabChanged(index));
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.blue : Colors.grey[600],
              size: 20,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}