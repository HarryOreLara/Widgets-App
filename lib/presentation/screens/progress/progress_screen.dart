import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen'; //cada pantalla con su nombre

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}



class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text('Cicular progress indicator'),
          SizedBox(height: 10,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45,),

          SizedBox(height: 20,),
          Text('Circular indicator controlado'),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}


class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator ();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}