import 'package:grpc/grpc.dart';
import 'package:grpc_tutorial/src/generated/todo.pbgrpc.dart';  // Import GRPC

class Client {
  ClientChannel channel;
  TodoClient stub;

  Future<void> main(List<String> args) async {
    channel = ClientChannel('localhost',
      port: 8001,
      options:
        const ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = TodoClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    try {
      final TodoItem todoItem = new TodoItem();
      todoItem.text = "Test 1";
      var res = await stub.createTodo(todoItem);
      print(res);

      final v = new voidNoParam();
      var todos = await stub.readTodos(v);
      print(todos.items);

      stub.readTodosStream(v).listen((value) {print(value); });
    } catch (e) {
      print(e);
    }
    await channel.shutdown();
  }
}

main() {
  var client = Client();
  client.main([]);
}