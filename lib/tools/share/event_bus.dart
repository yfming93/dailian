import 'dart:async';

//订阅者回调签名
typedef EventCallback<T> = void Function(T event);

class EventBus {
  static EventBus _instance;
  StreamController _streamController;
  factory EventBus.getDefault(){
    return _instance ??= EventBus._init();
  }
  EventBus._init(){
    _streamController = StreamController.broadcast();
  }

  StreamSubscription<T> register<T>(EventCallback<T> onData)
  {
    /// 需要返回订阅者，所以不能使用下面这种形式
//   return _streamController.stream.listen((event) {
//      if (event is T) {
//        onData(event);
//      }
//    });
    /// 没有指定类型，全类型注册
    if (T == dynamic) {
      return _streamController.stream.listen(onData);
    } else {
      /// 筛选出类型为T的数据，获得只包含T的Stream
      Stream<T> stream = _streamController.stream.where((type) => type is T)
          .cast<T>();
      return stream.listen(onData);
    }
  }

  void post(event) {
    _streamController.add(event);
  }

  void unregister() {
    _streamController.close();
  }

}


///--------------------------------------------------------------------------///
///--------------------------------------------------------------------------///
///--------------------------------------------------------------------------///
///--------------------------------------------------------------------------///


// 定义一个top-level变量，页面引入该文件后可以直接使用bus
var GV_EVENT_BUS = EventBus2();

//订阅者回调签名
//typedef void EventCallback(arg);

class EventBus2 {
  // 私有构造函数
  EventBus2._internal();

  // 保存单例
  static EventBus2 _singleton = EventBus2._internal();

  // 工厂构造函数
  factory EventBus2() => _singleton;

  // 保存事件订阅者队列，
  // key: 事件名(id)
  // value: 对应事件的订阅者队列
  var _eventMap = Map<Object, List<EventCallback>>();

  ///
  ///添加订阅者
  ///
  void addListener(eventName, EventCallback callback) {
    if (eventName == null || callback == null)
      return;
    _eventMap[eventName] ??= List<EventCallback>();
    _eventMap[eventName].add(callback);
  }

  ///
  ///移除订阅者
  ///
  void removeListener(eventName, [EventCallback callback]) {
    var list = _eventMap[eventName];
    if (eventName == null || list == null)
      return;
    if (callback == null) {
      _eventMap[eventName] = null;
    } else {
      list.remove(callback);
    }
  }

  ///
  ///触发事件，事件触发后该事件所有订阅者会被调用
  ///arg可选参数
  ///
  void sendBroadcast(eventName, [arg]) {
    var list = _eventMap[eventName];
    if (list == null)
      return;
    int len = list.length - 1;
    // 反向遍历，防止在订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

