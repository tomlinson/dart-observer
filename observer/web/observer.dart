library observer;

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