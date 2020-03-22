import 'dart:html';

InputElement inputElement;
UListElement inputList;
ButtonElement deleteAll;
Iterable<String> thingsToDo() sync* {
  var actions = ['Walk', 'Wash', 'Feed'];
  var pets = ['cats', 'dogs'];

  for (var action in actions) {
    for (var pet in pets) {
      if (pet == 'cats' && action != 'Feed') continue;
      yield '$action the $pet';
    }
  }
}

void main() {
  var output = querySelector('#output');
  output.children.addAll(thingsToDo().map((el) => LIElement()..text = el));
  inputElement = querySelector('#todo-input');
  inputList = querySelector('#todo-list');
  inputElement.onChange.listen(addTodoItem);
  deleteAll = querySelector('#delete-button');
  
}

void addTodoItem(Event e) {
  var newTodo = LIElement();
  newTodo.text = inputElement.value;
  inputElement.value = '';
  inputList.children.add(newTodo);
}
