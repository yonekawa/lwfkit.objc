var currentTime, fromTime, main, stage, cache;

window.lwfkit = {};
window.lwfkit.calcTick = function() {
  currentTime = Date.now() / 1000.0;
  var tick = currentTime - fromTime;
  fromTime = currentTime;
  return tick;
};
main = function() {
  if (window.lwfkit.lwf != null) {
    var tick = window.lwfkit.calcTick();
    window.lwfkit.lwf.exec(tick);
    window.lwfkit.lwf.render();
  }
  window.requestAnimationFrame.call(window, main);
};
main();

LWF.useCanvasRenderer();

stage = document.getElementById('canvas');
stage.width = window.innerWidth;
stage.height = window.innerHeight;

cache = LWF.ResourceCache.get();
cache.loadLWF({
  lwf:    '%@',
  prefix: '../%@/',
  stage:  stage,
  onload: function(lwf) {
    window.lwfkit.lwf = lwf;
    lwf.scaleForWidth(window.innerWidth);
  }
});
