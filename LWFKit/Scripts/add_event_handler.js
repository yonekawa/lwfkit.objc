var event = '%@';

if (window.lwfkit.handlers[event] == null) {
  window.lwfkit.lwf.addEventHandler(event, function(){
    new Ejecta.LKBridge().notify(event);
  });
  window.lwfkit.handlers[event] = true;
}
