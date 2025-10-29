import 'package:flutter/material.dart';
import '../../../data/models/character_model.dart';

class FavoriteCard extends StatelessWidget {
  final Character character;
  final VoidCallback onRemove;

  const FavoriteCard({
    super.key,
    required this.character,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            character.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          character.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${character.status} • ${character.species}\n${character.location}',
          style: const TextStyle(fontSize: 12),
        ),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
