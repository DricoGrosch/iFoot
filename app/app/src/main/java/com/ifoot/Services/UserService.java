package com.ifoot.Services;

import android.os.AsyncTask;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ifoot.Models.Match;
import com.ifoot.Models.User;

import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.concurrent.ExecutionException;

import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class UserService {
    public String login() throws ExecutionException, InterruptedException {
        Login l = new Login();
        return l.execute().get();
    }

    class Login extends AsyncTask<String, String, String> {
        private String login() throws Exception {
            OkHttpClient client = new OkHttpClient.Builder()
                    .retryOnConnectionFailure(true)
                    .build();

            RequestBody formBody = new FormBody.Builder()
                    .add("username", "admin")
                    .add("password", "sing2000")
                    .build();
            Request request = new Request.Builder()
                    .url("http://10.0.2.2/api/login")
                    .post(formBody)
                    .build();

            try {
                Response response = client.newCall(request).execute();
                String data = response.body().string();
                String token = new JSONObject(data).getString("token");
                return token;
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "output";
        }

        @Override
        protected String doInBackground(String... strings) {
            String token = "";
            try {
                token = this.login();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return token;
        }

    }


}
