package com.ifoot.Services.User;

import android.os.AsyncTask;

import com.ifoot.Models.User;

import org.json.JSONObject;

import java.io.IOException;

import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class Register {
    public boolean startTask(String username, String password) {
        try {
            return new RegisterTask().execute(username, password).get();
        } catch (Exception e) {
            return false;
        }
    }

    class RegisterTask extends AsyncTask<String, String, Boolean> {

        @Override
        protected Boolean doInBackground(String... params) {
            try {
                OkHttpClient client = new OkHttpClient.Builder()
                        .retryOnConnectionFailure(true)
                        .build();

                RequestBody formBody = new FormBody.Builder()
                        .add("username", params[0])
                        .add("password", params[1])
                        .build();
                Request request = new Request.Builder()
                        .url("http://10.0.2.2/api/user/register")
                        .post(formBody)
                        .build();

                try {
                    Response response = client.newCall(request).execute();
                    return response.code() == 200;
                } catch (IOException e) {
                    e.printStackTrace();
                    return false;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
        }

    }

}
