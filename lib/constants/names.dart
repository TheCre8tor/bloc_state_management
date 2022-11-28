import 'dart:math' as math show Random;

const names = ["Foo", "Bar", "Baz"];

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}
