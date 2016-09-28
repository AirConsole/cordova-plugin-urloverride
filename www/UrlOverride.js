var exec = require('cordova/exec');

window.UrlOverride = {
  logIt: function() {
    exec(null, null, "UrlOverride", "logIt", []);
  }
};
