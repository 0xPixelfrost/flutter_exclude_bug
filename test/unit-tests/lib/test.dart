import 'package:flutter_test/flutter_test.dart';

@GenerateMocks([B])
void main() {
  var bmock = MockB();
  var test;

  test('test1', () async {
    when(bmock.doSomething()).thenAnswer((_) => Future.value(1));

    var result = await A(bmock).doSomething();

    expect(result, "mappedResult");
  });
}

class A {
  final B b;

  A(this.b);

  Future<String> doSomething() => b.doSomething().then((value) => "mappedResult");
}

class B {
  Future<int> doSomething() => Future.delayed(const Duration(seconds: 1));
}
