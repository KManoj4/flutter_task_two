import 'package:flutter/material.dart';

class FibonacciSeries extends StatefulWidget {
  const FibonacciSeries({super.key});

  @override
  State<FibonacciSeries> createState() => _FibonacciSeriesState();
}

class _FibonacciSeriesState extends State<FibonacciSeries> {
  late int _position;
  int _fibonacciValue = 0;
  List<int> _memo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonacci Calculator'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Position',
                ),
                onChanged: (value) {
                  setState(() {
                    _position = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _fibonacciValue = calculateFibonacci(_position);
                  });
                },
                child: Text('Calculate'),
              ),
              SizedBox(height: 20),
              Text(
                _position != null
                    ? 'Fibonacci value at position $_position is $_fibonacciValue'
                    : 'Enter a position to calculate Fibonacci value',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int calculateFibonacci(int n) {
    if (n <= 1) {
      return n;
    }
    _memo = List<int>.filled(n + 1, -1);
    _memo[0] = 0;
    _memo[1] = 1;
    return _fibonacci(n);
  }

  int _fibonacci(int n) {
    if (_memo[n] != -1) {
      return _memo[n]!;
    }
    _memo[n] = _fibonacci(n - 1) + _fibonacci(n - 2);
    return _memo[n]!;
  }
}
