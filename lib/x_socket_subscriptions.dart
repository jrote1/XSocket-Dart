part of xsocket;

class XSocketSubscriptions{
  Map<String,Function> _subscriptions;
  
  XSocketSubscriptions(){
    _subscriptions = {};
  }
  
  void add(String event, func(JsonObject value)){
    _subscriptions[event.toLowerCase()] = func;    
  }
  
  void fire(String event, JsonObject data){
    if(_subscriptions.containsKey(event.toLowerCase()))
      _subscriptions[event.toLowerCase()](data);
  }
}