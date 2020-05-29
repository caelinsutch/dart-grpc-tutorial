///
//  Generated code. Do not modify.
//  source: todo.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'todo.pb.dart' as $0;
export 'todo.pb.dart';

class TodoClient extends $grpc.Client {
  static final _$createTodo = $grpc.ClientMethod<$0.TodoItem, $0.TodoItem>(
      '/todoPackage.Todo/createTodo',
      ($0.TodoItem value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TodoItem.fromBuffer(value));
  static final _$readTodos = $grpc.ClientMethod<$0.voidNoParam, $0.TodoItems>(
      '/todoPackage.Todo/readTodos',
      ($0.voidNoParam value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TodoItems.fromBuffer(value));
  static final _$readTodosStream =
      $grpc.ClientMethod<$0.voidNoParam, $0.TodoItem>(
          '/todoPackage.Todo/readTodosStream',
          ($0.voidNoParam value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TodoItem.fromBuffer(value));

  TodoClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.TodoItem> createTodo($0.TodoItem request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createTodo, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.TodoItems> readTodos($0.voidNoParam request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$readTodos, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.TodoItem> readTodosStream($0.voidNoParam request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$readTodosStream, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class TodoServiceBase extends $grpc.Service {
  $core.String get $name => 'todoPackage.Todo';

  TodoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TodoItem, $0.TodoItem>(
        'createTodo',
        createTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TodoItem.fromBuffer(value),
        ($0.TodoItem value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.voidNoParam, $0.TodoItems>(
        'readTodos',
        readTodos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.voidNoParam.fromBuffer(value),
        ($0.TodoItems value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.voidNoParam, $0.TodoItem>(
        'readTodosStream',
        readTodosStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.voidNoParam.fromBuffer(value),
        ($0.TodoItem value) => value.writeToBuffer()));
  }

  $async.Future<$0.TodoItem> createTodo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TodoItem> request) async {
    return createTodo(call, await request);
  }

  $async.Future<$0.TodoItems> readTodos_Pre(
      $grpc.ServiceCall call, $async.Future<$0.voidNoParam> request) async {
    return readTodos(call, await request);
  }

  $async.Stream<$0.TodoItem> readTodosStream_Pre(
      $grpc.ServiceCall call, $async.Future<$0.voidNoParam> request) async* {
    yield* readTodosStream(call, await request);
  }

  $async.Future<$0.TodoItem> createTodo(
      $grpc.ServiceCall call, $0.TodoItem request);
  $async.Future<$0.TodoItems> readTodos(
      $grpc.ServiceCall call, $0.voidNoParam request);
  $async.Stream<$0.TodoItem> readTodosStream(
      $grpc.ServiceCall call, $0.voidNoParam request);
}
