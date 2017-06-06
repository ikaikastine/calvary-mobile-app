package com.example.courtney.calvarychapel;

import android.app.Fragment;
import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by Courtney on 2/4/17.
 */



public class FirstFragment extends Fragment {

    View myView;
    WebView myWebView;
    ProgressDialog progressDialog;
    private static final String TAG_CONTENT = "content";
    private static final String TAG_RENDERED = "rendered";


    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        myView = inflater.inflate(R.layout.first_layout, container, false);

        myWebView = (WebView) myView.findViewById(R.id.bulletinWebView);

        new JSONTask().execute();

        return myView;
    }


    //Call the URL and parse the JSON response
    protected class JSONTask extends AsyncTask<Void, Void, JSONObject> {

        protected void onPreExecute() {
            super.onPreExecute();

            progressDialog = new ProgressDialog(getActivity());
            progressDialog.setMessage("Loading...");
            progressDialog.setCancelable(false);
            progressDialog.show();
        }

        @Override
        protected JSONObject doInBackground(Void... params) {

            HttpURLConnection connection = null;
            BufferedReader reader = null;

            try {
                URL url = new URL("https://calvarycorvallis.org/wp-json/wp/v2/pages/1038");
                connection = (HttpURLConnection) url.openConnection();
                connection.connect();

                InputStream stream = connection.getInputStream();

                reader = new BufferedReader(new InputStreamReader(stream));

                StringBuffer buffer = new StringBuffer();
                String line = "";

                while ((line = reader.readLine()) != null) {
                    buffer.append(line + "\n");
                    Log.d("Response: ", "> " + line);
                }

                return new JSONObject(buffer.toString());

            } catch (Exception e) {
                Log.e("App", "JSONTask", e);
            } finally {
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            return null;
        }

        //display the response on the UI
        @Override
        protected void onPostExecute(JSONObject response) {

            if (progressDialog.isShowing()) {
                progressDialog.dismiss();
            }

            if (response != null) {
                try {
                    JSONObject jsonResponse = response.getJSONObject(TAG_CONTENT);
                    String jsonData = jsonResponse.getString(TAG_RENDERED);
                    String bulletinContent = "<!DOCTYPE HTML><html><head><style> body {color: #5b5e5e; font-family: 'Lora', Palatino;} a { border-bottom: 1px solid #fbaf17; color: #fbaf17; text-decoration: none; } .staff a { border-bottom: 0px none; } a:focus, a:hover { border-bottom: 1px solid #fbaf17; color: #b17b0e; }</style></head><body>" + jsonData + "</body></html>";
                    myWebView.loadDataWithBaseURL("file:///android_asset/", bulletinContent, "text/html", "utf-8", null);
                    myWebView.getSettings().setAllowFileAccess(true);
                    Log.e("App", "Success: " + response.getString("yourJsonElement"));

                } catch (JSONException ex) {
                    Log.e("App", "Failure", ex);
                }
            }

        }

    }

}
