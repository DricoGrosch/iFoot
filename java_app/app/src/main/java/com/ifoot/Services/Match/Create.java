package com.ifoot.Services.Match;

import android.os.AsyncTask;

import com.ifoot.Models.User;
import com.ifoot.Services.User.Subscribe;

import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class Create {
    public boolean startTask(String location, String date, String latitude, String longitude) {
        try {
            return new CreateTask().execute(location, date, latitude, longitude).get();
        } catch (Exception e) {
            return false;
        }
    }


    class CreateTask extends AsyncTask<String, String, Boolean> {

        @Override
        protected Boolean doInBackground(String... params) {
            try {
                User user = User.getInstance();

                OkHttpClient client = new OkHttpClient.Builder()
                        .retryOnConnectionFailure(true)
                        .build();

                RequestBody formBody = new FormBody.Builder()
                        .add("location", params[0])
                        .add("date", params[1])
                        .add("latitude", params[2])
                        .add("longitude", params[3])
                        .build();
                Request request = new Request.Builder()
                        .url("http://10.0.2.2/api/match/")
                        .addHeader("Authorization", "token " + user.getToken())
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
