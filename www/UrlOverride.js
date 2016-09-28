var exec = require('cordova/exec');

var UrlOverride = {
  logIt: function(output) {
    console.log("LOG param", output);
    exec(null, null, "UrlOverride", "logIt", [output]);
  }
};

module.exports = UrlOverride;
