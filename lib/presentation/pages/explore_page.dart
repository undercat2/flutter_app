import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/explore/explore_bloc.dart';
import '../bloc/explore/explore_event.dart';
import '../bloc/explore/explore_state.dart';
import '../widgets/item_card.dart';
import 'item_detail_page.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    super.initState();
    context.read<ExploreBloc>().add(ExploreItemsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Explore',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<ExploreBloc, ExploreState>(
                builder: (context, state) {
                  switch (state.status) {
                    case ExploreStatus.loading:
                      return Center(child: CircularProgressIndicator());
                    case ExploreStatus.success:
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
                    case ExploreStatus.failure:
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
