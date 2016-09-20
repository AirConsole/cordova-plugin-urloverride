package org.apache.cordova.plugin;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.net.Uri;
import android.util.Log;
import android.content.Intent;

public class UrlOverride extends CordovaPlugin {

  private static final String TAG = "UrlOverride";

  @Override
  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) {
    Log.d(TAG, "execute action: " + action);
    return true;
  }

  @Override
  public boolean onOverrideUrlLoading(String url) {
    Log.d(TAG, "onOverrideUrlLoading: " + url);
    if (url.length() != 0 && !url.startsWith("file://")) {
      Intent i = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
      startActivity(i);
      return true;
    }
    return false;
  }

}
