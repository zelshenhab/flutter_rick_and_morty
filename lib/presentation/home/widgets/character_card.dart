import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/models/character_model.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const CharacterCard({
    super.key,
    required this.character,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasValidImage =
        character.image.isNotEmpty && character.image.startsWith('http');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 3,
      color: Theme.of(context).cardColor.withOpacity(0.95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: hasValidImage
              ? CachedNetworkImage(
                  imageUrl: character.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 300),
                  placeholder: (context, url) => Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.redAccent,
                    ),
                  ),
                )
              : Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.person_outline, color: Colors.grey),
                ),
        ),
        title: Text(
          character.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '${character.status} • ${character.species}\n${character.location}',
            style: const TextStyle(fontSize: 13, height: 1.3),
          ),
        ),
        isThreeLine: true,
        trailing: IconButton(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, anim) =>
                ScaleTransition(scale: anim, child: child),
            child: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              key: ValueKey(isFavorite),
              color: isFavorite ? Colors.amber : Colors.grey,
              size: 26,
            ),
          ),
          onPressed: onFavoriteToggle,
        ),
      ),
    );
  }
}
