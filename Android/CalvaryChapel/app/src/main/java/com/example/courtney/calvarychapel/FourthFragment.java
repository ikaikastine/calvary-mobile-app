package com.example.courtney.calvarychapel;

import android.app.Fragment;
import android.app.ProgressDialog;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

/**
 * Created by Courtney on 2/4/17.
 * Messages Page
 */

public class FourthFragment extends Fragment {

    View myView;
    WebView myWebView;
    ProgressDialog progressDialog;


    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        myView = inflater.inflate(R.layout.fourth_layout, container, false);

        String videoLink = "<html><iframe id=\"ls_embed_1493363421\" src=\"https://livestream.com/accounts/18343788/events/7279945/videos/154327352/player?width=960&height=540&enableInfo=false&defaultDrawer=&autoPlay=true&mute=false\" width=\"960\" height=\"540\" frameborder=\"0\" scrolling=\"no\" allowfullscreen> </iframe></html>";

        myWebView = (WebView) myView.findViewById(R.id.messagesView);

        progressDialog = new ProgressDialog(getActivity());
        progressDialog.setMessage("Loading...");
        progressDialog.setCancelable(false);

        WebSettings webSettings = myWebView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        myWebView.getSettings().setLoadWithOverviewMode(true);
        myWebView.getSettings().setUseWideViewPort(true);
        myWebView.getSettings().setBuiltInZoomControls(true);

        myWebView.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon)
            {
                progressDialog.show();
            }
            @Override
            public void onPageFinished(WebView view, String url) {
                progressDialog.dismiss();
            }
        });

        myWebView.loadData(videoLink, "text/html", "utf-8");



        return myView;
    }
}


