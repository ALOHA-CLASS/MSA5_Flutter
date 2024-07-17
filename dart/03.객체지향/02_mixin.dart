// Flying 믹스인
mixin Flying {
  void fly() {
    print('Flying high!');
  }
}

// Swimming 믹스인
mixin Swimming {
  void swim() {
    print('Swimming gracefully!');
  }
}

// Bird 클래스에 Flying 믹스인 적용
class Bird with Flying {
  String name;

  Bird(this.name);
}

// Fish 클래스에 Swimming 믹스인 적용
class Fish with Swimming {
  String name;

  Fish(this.name);
}

// Duck 클래스에 Flying과 Swimming 믹스인 적용 (다중 상속)
class Duck with Flying, Swimming {
  String name;

  Duck(this.name);
}

void main() {
  var eagle = Bird('Eagle');
  eagle.fly(); // 출력: Flying high!

  var salmon = Fish('Salmon');
  salmon.swim(); // 출력: Swimming gracefully!

  var mallard = Duck('Mallard');
  mallard.fly(); // 출력: Flying high!
  mallard.swim(); // 출력: Swimming gracefully!
}
