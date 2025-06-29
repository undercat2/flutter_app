import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation/navigation_bloc.dart';
import '../bloc/navigation/navigation_event.dart';
import '../bloc/navigation/navigation_state.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/explore/explore_bloc.dart';
import '../bloc/profile/profile_bloc.dart';
import 'home_page.dart';
import 'explore_page.dart';
import 'profile_page.dart';
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
              BlocProvider(
                create: (_) => di.sl<HomeBloc>(),
                child: HomePage(),
              ),
              BlocProvider(
                create: (_) => di.sl<ExploreBloc>(),
                child: ExplorePage(),
              ),
              BlocProvider(
                create: (_) => di.sl<ProfileBloc>(),
                child: ProfilePage(),
              ),
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
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      context,
                      0,
                      Icons.home_rounded,
                      'Home',
                      state.currentIndex == 0,
                    ),
                    _buildNavItem(
                      context,
                      1,
                      Icons.explore_rounded,
                      'Explore',
                      state.currentIndex == 1,
                    ),
                    _buildNavItem(
                      context,
                      2,
                      Icons.person_rounded,
                      'Profile',
                      state.currentIndex == 2,
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
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.blue : Colors.grey[600],
              size: 24,
            ),
            if (isSelected) ...[
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}