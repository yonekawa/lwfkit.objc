var stage, cache;

stage = document.getElementById('canvas');
stage.width = window.innerWidth;
stage.height = window.innerHeight;

cache = LWF.ResourceCache.get();
cache.loadLWF({
  lwf:    '%@',
  prefix: '../App/%@/',
  stage:  stage,
  onload: function(lwf) {
    window.lwfkit.lwf = lwf;
    lwf.scaleForWidth(window.innerWidth);
  }
});
