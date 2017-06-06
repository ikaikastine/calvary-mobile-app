package com.example.courtney.calvarychapel;

import android.util.Base64;
import android.util.Log;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import java.io.IOException;
import java.io.StringReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/**
 * Created by Courtney on 4/13/17.
 */

public class XMLParser {

    private static final String PASSWORD = "bonnc123";
    private static final String USERNAME = "bonncosu";
    private static final String CREDENTIALS = USERNAME + ":" + PASSWORD;

   public XMLParser() {

   }
   public String getXmlFromUrl(String url) {
       OkHttpClient client = new OkHttpClient();
           final String basic = "Basic " + Base64.encodeToString(CREDENTIALS.getBytes(), Base64.NO_WRAP);
           String str = null;
           Request request = new Request.Builder()
                   .url(url)
                   .header("Authorization", basic)
                   .build();

           try {
               Response response = client.newCall(request).execute();
               str = response.body().string();
           } catch (IOException e) {
               e.printStackTrace();
           }

       return str;
   }

   public Document getDomElement(String xml) {
       Document doc = null;
       DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
       try {
           DocumentBuilder db = dbf.newDocumentBuilder();
           InputSource is = new InputSource();
           is.setCharacterStream(new StringReader(xml));
           doc = db.parse(is);
       } catch (ParserConfigurationException e) {
           Log.e("Error: ", e.getMessage());
           return null;
       } catch (SAXException e) {
           Log.e("Error: ", e.getMessage());
           return null;
       } catch (IOException e) {
           Log.e("Error: ", e.getMessage());
           return null;
       }

       return doc;
   }

   public final String getElementValue(Node elem) {
       Node child;
       if (elem != null) {
           if (elem.hasChildNodes()) {
               for (child = elem.getFirstChild(); child != null; child = child.getNextSibling()) {
                   if (child.getNodeType() == Node.TEXT_NODE) {
                       return child.getNodeValue();
                   }
               }
           }
       }
        return "";
   }

   public String getValue(Element item, String str) {
       NodeList n = item.getElementsByTagName(str);
       return this.getElementValue(n.item(0));
   }
}
