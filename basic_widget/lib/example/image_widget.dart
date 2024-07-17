import 'package:flutter/material.dart';

// stl : ctrl + space
class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              const Text(
                "네트워크 이미지",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10,),
              Image.network(
                'https://i.imgur.com/fzADqJo.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 50,),
              const Text(
                "로컬 이미지",
                style: TextStyle(fontSize: 30),
              ),
              const Image(
                image: AssetImage("image/logo.png"),
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 100,),

              // fit
              const Text("BoxFit.contain", style: TextStyle(fontSize: 30),),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.blue,
                  child: const Image(
                    image: AssetImage('image/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20,),
                const Text("BoxFit.cover", style: TextStyle(fontSize: 30),),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.blue,
                  child: const Image(
                    image: AssetImage('image/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20,),
                const Text("BoxFit.fill", style: TextStyle(fontSize: 30),),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.blue,
                  child: const Image(
                    image: AssetImage('image/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 20,),
                const Text("BoxFit.fitWidth", style: TextStyle(fontSize: 30),),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.blue,
                  child: const Image(
                    image: AssetImage('image/logo.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 20,),
                const Text("BoxFit.fitHeight", style: TextStyle(fontSize: 30),),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.blue,
                  child: const Image(
                    image: AssetImage('image/logo.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(height: 20,),
                const Text("BoxFit.scaleDown", style: TextStyle(fontSize: 30),),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.blue,
                  child: const Image(
                    image: AssetImage('image/logo.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(height: 20,),
                const Text("BoxFit.none", style: TextStyle(fontSize: 30),),
                Container(
                  width: 300,
                  height: 100,
                  color: Colors.blue,
                  child: const Image(
                    image: AssetImage('image/logo.png'),
                    fit: BoxFit.none,
                  ),
                ),
                const SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
