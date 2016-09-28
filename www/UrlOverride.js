var exec = require('cordova/exec');

var UrlOverride = {
  logIt: function() {
    exec(null, null, "UrlOverride", "logIt", []);
  }
};

module.exports = UrlOverride;
