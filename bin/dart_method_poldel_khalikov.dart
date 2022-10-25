// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:math';

double f(double x) {
  return x - 2 * pow(x, 2) + 1 / (5 * pow(x, 5));
}

void findMinX(List<double> numbs) {
  double eps = 0.01, h, y = 0;
  numbs[0] = 1;
  numbs[1] = 2;

  while (numbs[1] - numbs[0] >= eps) {
    h = (numbs[1] - numbs[0]) / 4;
    y = f(numbs[0]);
    for (int i = 1; i < 5; i++) {
      if (y > (f(numbs[0] + h * i))) {
        y = f(numbs[0] + h * i);
        numbs[2] = numbs[0] + h * i;
      }
    }

    print('{ ' +
        numbs[0].toString() +
        ' , ' +
        numbs[1].toString() +
        ' }' +
        ' Xm = ' +
        numbs[2].toString() +
        ' f(Xm) = ' +
        y.toString());

    if (numbs[2] == numbs[0]) {
      numbs[1] = numbs[0] + h;
      continue;
    } else if (numbs[1] == numbs[2]) {
      numbs[0] = numbs[1] - h;
      continue;
    }

    numbs[0] = numbs[2] - h;
    numbs[1] = numbs[2] + h;
  }

  print('{ ' +
      numbs[0].toString() +
      ' , ' +
      numbs[1].toString() +
      ' }\n Xm = ' +
      numbs[2].toString() +
      ' f(Xm) = ' +
      y.toString());

  if (f(numbs[0]) < f(numbs[1])) {
    print('x* = ' + numbs[0].toString());
    print('f(x*) = ' + f(numbs[1]).toString());
  } else {
    print('x* = ' + numbs[1].toString());
    print('f(x*) = ' + f(numbs[1]).toString());
  }
}

void main() {
  List<double> numbs = [0, 0, 0];
  findMinX(numbs);
}
