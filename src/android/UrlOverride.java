package org.apache.cordova.urloverride;

import android.app.Activity;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import android.webkit.WebView;
import android.webkit.WebViewClient;

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
