import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class result extends ConsumerStatefulWidget {
  const result({super.key});

  @override
  ConsumerState<result> createState() => _resultState();
}

class _resultState extends ConsumerState<result> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("this is result page"));
  }
}
