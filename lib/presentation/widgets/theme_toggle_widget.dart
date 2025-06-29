import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme/theme_bloc.dart';

class ThemeToggleWidget extends StatelessWidget {
  const ThemeToggleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDark = state.themeMode == ThemeMode.dark;
        
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.light_mode,
              color: !isDark ? Theme.of(context).primaryColor : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 8),
            Switch(
              value: isDark,
              onChanged: (value) {
                context.read<ThemeBloc>().add(ToggleTheme());
              },
              activeColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.dark_mode,
              color: isDark ? Theme.of(context).primaryColor : Colors.grey,
              size: 20,
            ),
          ],
        );
      },
    );
  }
}

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDark = state.themeMode == ThemeMode.dark;
        
        return IconButton(
          onPressed: () {
            context.read<ThemeBloc>().add(ToggleTheme());
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              key: ValueKey(isDark),
            ),
          ),
          tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
        );
      },
    );
  }
}

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return PopupMenuButton<ThemeMode>(
          icon: const Icon(Icons.palette),
          tooltip: 'Select Theme',
          onSelected: (ThemeMode themeMode) {
            context.read<ThemeBloc>().add(SetTheme(themeMode));
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: ThemeMode.system,
              child: Row(
                children: [
                  const Icon(Icons.settings_system_daydream),
                  const SizedBox(width: 8),
                  const Text('System'),
                  if (state.themeMode == ThemeMode.system)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.check, size: 16),
                    ),
                ],
              ),
            ),
            PopupMenuItem(
              value: ThemeMode.light,
              child: Row(
                children: [
                  const Icon(Icons.light_mode),
                  const SizedBox(width: 8),
                  const Text('Light'),
                  if (state.themeMode == ThemeMode.light)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.check, size: 16),
                    ),
                ],
              ),
            ),
            PopupMenuItem(
              value: ThemeMode.dark,
              child: Row(
                children: [
                  const Icon(Icons.dark_mode),
                  const SizedBox(width: 8),
                  const Text('Dark'),
                  if (state.themeMode == ThemeMode.dark)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.check, size: 16),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
