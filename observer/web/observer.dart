library observer;

import 'dart:collection';

typedef void Notifier();
class Observable {
  HashMap<Notifier, Object> notifiers = new HashMap<Notifier, Object>();
  
  observe (Notifier notifier) {
    notifiers[notifier] = null;
  }
  
  remove (Notifier notifier) {
    notifiers.remove(notifier);
  }
  
  notify () {
    notifiers.forEach((Notifier notifier, Object) => notifier());
  }
}