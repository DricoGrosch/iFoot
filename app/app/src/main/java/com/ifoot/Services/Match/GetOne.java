package com.ifoot.Services.Match;

import android.os.AsyncTask;

import com.google.gson.Gson;
import com.ifoot.Models.Match;
import com.ifoot.Models.User;

import org.json.JSONArray;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class GetOne {
    public Match startTask(int id) {
        try {
            return new GetOneTask().execute(id).get();
        } catch (Exception e) {
            return null;
        }
    }


    class GetOneTask extends AsyncTask<Integer, String, Match> {

        @Override
        protected Match doInBackground(Integer... params) {
            Match match = null;
            Gson gson = new Gson();
            try {
                User user = User.getInstance();
                OkHttpClient client = new OkHttpClient.Builder()
                        .retryOnConnectionFailure(true)
                        .build();

                Request request = new Request.Builder()
                        .url("http://10.0.2.2/api/match/" + params[0])
                        .addHeader("Authorization", "token " + user.getToken())
                        .get()
                        .build();

                Response response = client.newCall(request).execute();
                JSONObject json = new JSONObject(response.body().string());
                JSONArray users = json.getJSONArray("users");
                json.remove("users");
                match = gson.fromJson(json.toString(), Match.class);
                match.setUsers(new ArrayList<>());
                for (int i = 0; i < users.length(); i++) {
                    JSONObject jsonUser = users.getJSONObject(i);
                    User matchUser = gson.fromJson(json.toString(), User.class);
                    String username = jsonUser.getString("username");
                    matchUser.setUserName(username);
                    matchUser.setId(jsonUser.getInt("id"));
                    match.addUser(matchUser);
                }
                return match;

            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }
    }
}
