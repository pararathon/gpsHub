package com.gpshub;

import android.app.Activity;
import android.os.StrictMode;
import com.gpshub.utils.SettingsKeeper;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AccountManager {
    Activity activity;

    public AccountManager(Activity activity) {
        this.activity = activity;

        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
    }

    public boolean login(String company_hash, String driver_id) {
        List<NameValuePair> nameValuePairs = new ArrayList<>();
        nameValuePairs.add(new BasicNameValuePair("company_hash", company_hash));
        nameValuePairs.add(new BasicNameValuePair("id", driver_id));
        String paramString = URLEncodedUtils.format(nameValuePairs, "utf-8");

        String url = "http://javafiddle.org/gpsHub/actions/drivers.php?" + paramString;
        System.out.println(url);

        HttpClient httpclient = new DefaultHttpClient();
        HttpGet httpget = new HttpGet(url);

        try {
            HttpResponse response = httpclient.execute(httpget);

            HttpEntity entity = response.getEntity();
            String responseText = EntityUtils.toString(entity);
            System.out.println(responseText);

            if ("OK".equals(responseText)) {
                SettingsKeeper sk = new SettingsKeeper(activity);
                sk.setSharedPreferences(company_hash, driver_id);
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean isLoggedIn() {
        SettingsKeeper sk = new SettingsKeeper(activity);
        String company_hash = sk.getSharedPreference("company_hash");
        String driver_id = sk.getSharedPreference("driver_id");

        System.out.println("company_hash = " + company_hash + " driver_id = " + driver_id);
        return company_hash != null && driver_id != null;
    }

    public void logout() {
        new SettingsKeeper(activity).removeSharedPreferences();
    }
}