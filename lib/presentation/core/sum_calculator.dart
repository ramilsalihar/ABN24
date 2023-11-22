import 'dart:math' as math;

class SumCalculator {
  final double period;
  final double amount;
  final String type;

  SumCalculator({
    required this.period,
    required this.amount,
    required this.type,
  });

  static const int interestRate = 7;
  static const int yearInterestRate = 84;
  final double _percent = 0.07;

  double get totalSum {
    double totalSum;

    if ((type == 'D' && period == 15) || (type == 'M' && period == 1)) {
      totalSum = amount * (interestRate / 100) * period;
    } else {
      totalSum =
          amount * (_percent / (1 - math.pow(1 + (_percent), -(period / 30))));
    }

    return totalSum;
  }

  bool get isMonthly {
    bool isMonthly;

    if (period <= 30 && type == 'D') {
      isMonthly = false;
    } else if (period <= 2 && type == 'M') {
      isMonthly = false;
    } else {
      isMonthly = true;
    }

    return isMonthly;
  }

  int get interest => interestRate;

  int get yearInterest => yearInterestRate;


}