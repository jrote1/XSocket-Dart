part of xsocket;

class XSocketMessage extends Object with Exportable {
  @export String event;
  @export String data;
  
  XSocketMessage(){}
  
  XSocketMessage.getMessage(this.event, dynamic data){
    this.data = JSON.encode(data);
  }
  
  String toString(){
    return toJson();
  }
}