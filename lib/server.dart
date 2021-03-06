import 'package:grpc/grpc.dart';  // Import GRPC
import 'package:grpc/src/server/call.dart';   // Import GRPC Server
import 'package:grpc_tutorial/src/generated/todo.pbgrpc.dart';  // Import the protofbuff files

class TodoService extends TodoServiceBase {
  TodoItems todos = new TodoItems(); // TodoItems is what's generated by Proto

  /**
   * Createa  new Todo
   * @param call - meta information on the request
   * @param request - information that's sent
   * @returns todoItem - The item that was added
   **/
  @override
  Future<TodoItem> createTodo(ServiceCall call, TodoItem request) async {
    // Create a new TodoObject with the data
    print(request.text);
    TodoItem todoItem = new TodoItem();
    todoItem.text = request.text;
    todoItem.id = todos.items.length + 1;
    // Add a new todo Item to our list
    todos.items.add(todoItem);
    // Return a todoItem in accordance with function return typ[e
    return todoItem;
  }

  /**
   * Read the todos as a Future
   **/
  @override
  Future<TodoItems> readTodos(ServiceCall call, voidNoParam request) async {
    return todos;
  }

  /**
   * Get all of the todos as a stream
   **/
  @override
  Stream<TodoItem> readTodosStream(ServiceCall call,
      voidNoParam request) async* {
    // Iterate through all of the todos and 'yield' each todo (returns it to the stream)
    for (var todo in todos.items) {
      yield todo;
    }
  }
}

  /**
   * gRPC Server
   **/
class TodoServer {
  Future<void> main(List<String> args) async {
  final server = Server([TodoService()]);  // Create a new server from the TodoService
  await server.serve(port: 8001); // Start the server on port 9000
  print('Server listening on port ${server.port}...');
}}


main() {
  TodoServer todoServer = new TodoServer();
  todoServer.main([]);
}