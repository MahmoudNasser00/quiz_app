import 'package:flutter/material.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B0F3B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text("Levels", style: TextStyle(color: Colors.tealAccent)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          final isLocked = index == 5;
          return Container(
            decoration: BoxDecoration(
              color: isLocked
                  ? Colors.grey.shade800
                  : Colors.primaries[index * 2],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Level\n0${index + 1}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (i) => Icon(
                          Icons.star,
                          size: 18,
                          color: i <= index % 3 ? Colors.amber : Colors.white24,
                        ),
                      ),
                    ),
                  ],
                ),
                if (isLocked)
                  const Icon(Icons.lock, color: Colors.white, size: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}
