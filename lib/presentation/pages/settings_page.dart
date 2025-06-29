import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/settings/settings_bloc.dart';
import '../bloc/settings/settings_state.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
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
                    'Settings',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Profile Section
                  Container(
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
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue[100],
                          child: Icon(Icons.person, size: 30, color: Colors.blue[800]),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'john.doe@example.com',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.edit, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  
                  // Settings Sections
                  Expanded(
                    child: ListView(
                      children: [
                        _buildSectionHeader('Preferences'),
                        _buildSettingItem(
                          'Notifications',
                          Icons.notifications_outlined,
                          () {},
                          trailing: Switch(
                            value: true,
                            onChanged: (value) {},
                            activeColor: Colors.blue,
                          ),
                        ),
                        _buildSettingItem(
                          'Dark Mode',
                          Icons.dark_mode_outlined,
                          () {},
                          trailing: Switch(
                            value: false,
                            onChanged: (value) {},
                            activeColor: Colors.blue,
                          ),
                        ),
                        _buildSettingItem(
                          'Language',
                          Icons.language_outlined,
                          () {},
                          subtitle: 'English',
                        ),
                        
                        SizedBox(height: 20),
                        _buildSectionHeader('Health & Fitness'),
                        _buildSettingItem(
                          'Units',
                          Icons.straighten_outlined,
                          () {},
                          subtitle: 'Metric',
                        ),
                        _buildSettingItem(
                          'Goal Reminders',
                          Icons.alarm_outlined,
                          () {},
                          trailing: Switch(
                            value: true,
                            onChanged: (value) {},
                            activeColor: Colors.blue,
                          ),
                        ),
                        _buildSettingItem(
                          'Data Sync',
                          Icons.sync_outlined,
                          () {},
                          subtitle: 'Google Fit',
                        ),
                        
                        SizedBox(height: 20),
                        _buildSectionHeader('Privacy & Security'),
                        _buildSettingItem(
                          'Privacy Policy',
                          Icons.privacy_tip_outlined,
                          () {},
                        ),
                        _buildSettingItem(
                          'Terms of Service',
                          Icons.description_outlined,
                          () {},
                        ),
                        _buildSettingItem(
                          'Data Export',
                          Icons.download_outlined,
                          () {},
                        ),
                        
                        SizedBox(height: 20),
                        _buildSectionHeader('Support'),
                        _buildSettingItem(
                          'Help Center',
                          Icons.help_outline,
                          () {},
                        ),
                        _buildSettingItem(
                          'Contact Us',
                          Icons.contact_support_outlined,
                          () {},
                        ),
                        _buildSettingItem(
                          'Rate App',
                          Icons.star_outline,
                          () {},
                        ),
                        
                        SizedBox(height: 20),
                        _buildSectionHeader('Account'),
                        _buildSettingItem(
                          'Sign Out',
                          Icons.logout_outlined,
                          () {},
                          textColor: Colors.red,
                        ),
                        _buildSettingItem(
                          'Delete Account',
                          Icons.delete_outline,
                          () {},
                          textColor: Colors.red,
                        ),
                        
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            'Version 1.0.0',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
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
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 8, top: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    String title,
    IconData icon,
    VoidCallback onTap, {
    String? subtitle,
    Widget? trailing,
    Color? textColor,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: textColor ?? Colors.grey[700]),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: textColor ?? Colors.grey[800],
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              )
            : null,
        trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
        onTap: onTap,
      ),
    );
  }
}
