import 'package:flutter/material.dart';

class AudioCoverArt extends StatelessWidget {
  const AudioCoverArt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
        image: const DecorationImage(
          image: NetworkImage(
            'https://picsum.photos/500', // Placeholder image
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
