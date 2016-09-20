package org.apache.cordova.plugin;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class UrlOverride extends CordovaPlugin {

  private static final String TAG = "UrlOverride";

  @Override
  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) {
    Log.d(TAG, "execute action: " + action);
  }

  @Override
  public boolean onOverrideUrlLoading(String url) {
    Log.d(TAG, "onOverrideUrlLoading: " + url);
    return false;
  }

}
