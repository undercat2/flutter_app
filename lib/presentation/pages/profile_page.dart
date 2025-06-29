import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/profile/profile_event.dart';
import '../bloc/profile/profile_state.dart';
import '../widgets/item_card.dart';
import 'item_detail_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ProfileItemsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Text(
                          'JD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'john.doe@example.com',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  switch (state.status) {
                    case ProfileStatus.loading:
                      return Center(child: CircularProgressIndicator());
                    case ProfileStatus.success:
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return ItemCard(
                            item: item,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ItemDetailPage(item: item),
                                ),
                              );
                            },
                          );
                        },
                      );
                    case ProfileStatus.failure:
                      return Center(
                        child: Text('Failed to load items'),
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
