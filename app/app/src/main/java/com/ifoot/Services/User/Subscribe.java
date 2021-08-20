package com.ifoot.Services.User;

import android.os.AsyncTask;

import com.ifoot.Models.User;

import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class Subscribe {
    public boolean startTask(int id) {
        try {
            return new SubscribeTask().execute(id).get();
        } catch (Exception e) {
            return false;
        }
    }


    class SubscribeTask extends AsyncTask<Integer, String, Boolean> {

        @Override
        protected Boolean doInBackground(Integer... params) {
            try {

                OkHttpClient client = new OkHttpClient.Builder()
                        .retryOnConnectionFailure(true)
                        .build();

                RequestBody formBody = new FormBody.Builder()
                        .add("match_id", params[0].toString())
                        .build();
                Request request = new Request.Builder()
                        .url("http://10.0.2.2/api/match/subscribe")
                        .post(formBody)
                        .build();
                Response response = client.newCall(request).execute();
                return response.code() == 200;

            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
        }
    }
}
