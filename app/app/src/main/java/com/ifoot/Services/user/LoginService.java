package com.ifoot.Services.user;

import android.os.AsyncTask;

import org.json.JSONObject;

import java.io.IOException;

import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class LoginService {
    public String startTask(String username, String password) {
        try {
            return new LoginTask().execute(username,password).get();
        } catch (Exception e) {
            return null;
        }
    }

    class LoginTask extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... params) {
            String token = null;
            try {
                OkHttpClient client = new OkHttpClient.Builder()
                        .retryOnConnectionFailure(true)
                        .build();

                RequestBody formBody = new FormBody.Builder()
                        .add("username", params[0])
                        .add("password", params[1])
                        .build();
                Request request = new Request.Builder()
                        .url("http://10.0.2.2/api/login")
                        .post(formBody)
                        .build();

                try {
                    Response response = client.newCall(request).execute();
                    String data = response.body().string();
                    token = new JSONObject(data).getString("token");
                } catch (IOException e) {
                    e.printStackTrace();
                    return null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                return token;

            }
        }

    }

}
