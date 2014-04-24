part of xsocket;

class XSocketSubscription extends Object with Exportable{
  XSocketSubscription(){}
  
  @export String Event;
  @export bool Confirm;
  
  XSocketSubscription.getSubscription(String event){
    Event = event;
    Confirm = false;
  }
}