import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  @override
  Future<List<Item>> getItems(String category) async {
    // Simulate API call
    await Future.delayed(Duration(milliseconds: 500));
    
    return _getMockData(category);
  }

  List<Item> _getMockData(String category) {
    switch (category) {
      case 'home':
        return [
          Item(
            id: '1',
            title: 'Smart Home Hub',
            description: 'Control all your smart devices from one place',
            imageUrl: 'https://picsum.photos/300/200?random=1',
            category: 'home',
          ),
          Item(
            id: '2',
            title: 'LED Light Strips',
            description: 'Colorful ambient lighting for your room',
            imageUrl: 'https://picsum.photos/300/200?random=2',
            category: 'home',
          ),
          Item(
            id: '3',
            title: 'Security Camera',
            description: 'Monitor your home with HD video',
            imageUrl: 'https://picsum.photos/300/200?random=3',
            category: 'home',
          ),
        ];
      case 'explore':
        return [
          Item(
            id: '4',
            title: 'Mountain Adventure',
            description: 'Explore the beautiful mountain trails',
            imageUrl: 'https://picsum.photos/300/200?random=4',
            category: 'explore',
          ),
          Item(
            id: '5',
            title: 'City Tour',
            description: 'Discover hidden gems in the city',
            imageUrl: 'https://picsum.photos/300/200?random=5',
            category: 'explore',
          ),
          Item(
            id: '6',
            title: 'Beach Getaway',
            description: 'Relax on pristine sandy beaches',
            imageUrl: 'https://picsum.photos/300/200?random=6',
            category: 'explore',
          ),
        ];
      case 'profile':
        return [
          Item(
            id: '7',
            title: 'My Photos',
            description: 'View and manage your photo collection',
            imageUrl: 'https://picsum.photos/300/200?random=7',
            category: 'profile',
          ),
          Item(
            id: '8',
            title: 'Settings',
            description: 'Customize your app preferences',
            imageUrl: 'https://picsum.photos/300/200?random=8',
            category: 'profile',
          ),
          Item(
            id: '9',
            title: 'Achievements',
            description: 'Track your progress and milestones',
            imageUrl: 'https://picsum.photos/300/200?random=9',
            category: 'profile',
          ),
        ];
      default:
        return [];
    }
  }
}
