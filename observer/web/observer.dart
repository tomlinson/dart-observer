import 'dart:html';

typedef void Notifier();
class Observable {
  List<Notifier> notifiers = new List<Notifier>();
  
  observe (Notifier notifier) {
    notifiers.add(notifier);
  }
  
  remove (Notifier notifier) {
    notifiers.removeAt(notifiers.indexOf(notifier));
  }
  
  notify () {
    notifiers.forEach((Notifier notifier) => notifier());
  }
}

class Mooo extends Observable {
  int intensity;  
  String description;
}

class Cow {
  String name;
  
  Cow(this.name);
  
  Mooo mooo = new Mooo();
  
  chase () {
    window.setTimeout(() {
      mooo.intensity = 11;
      mooo.description = "amazing";
      mooo.notify();
    }, 1000);
  }
}

main () {
  Cow mike = new Cow("Mike");
  Cow fred = new Cow("Fred");
  
  mike.mooo.observe(() {
    print ("Cow ${mike.name} - Mooo:${mike.mooo.description}, intentsity=${mike.mooo.intensity}");
  });
  
  fred.mooo.observe(() {
    print ("Cow ${fred.name} - Mooo:${fred.mooo.description}, intentsity=${fred.mooo.intensity}");
  });
  
  mike.chase();
  mike.chase();
  
  print ("chasing cows");
}