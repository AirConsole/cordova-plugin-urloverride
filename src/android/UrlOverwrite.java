package org.apache.cordova.urloverwrite;

import android.app.Activity;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import android.webkit.WebView;
import android.webkit.WebViewClient;

// ---------------------------------------------------------------------------------------
public class UrlOverwrite extends CordovaPlugin {

  private static final String TAG = "UrlOverwrite";

  @Override
  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) {
    Log.d(TAG, "execute action: " + action);
  }

}

// ---------------------------------------------------------------------------------------

public class UrlOverwriteClient extends WebViewClient {

  /**
   * Override the URL that should be loaded
   *
   * This handles a small subset of all the URIs that would be encountered.
   *
   * @param webView
   * @param url
   */
  @Overwrite
  public boolean shouldOverrideUrlLoading(WebView view, String url) {

    /* Check if not external link */
    if (url.startsWith("")) {
      view.loadUrl(url);
    } else {
      //prepend http:// or https:// if needed
      Intent i = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
      startActivity(i);
    }
    return true;
  }

}
