package com.ifoot.Services.Match;

import android.os.AsyncTask;

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

public class FecthAll {
    public ArrayList<Match> startTask() {
        try {
            return new FetchAllTask().execute().get();
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }


    class FetchAllTask extends AsyncTask<String, String, ArrayList<Match>> {

        @Override
        protected ArrayList<Match> doInBackground(String... strings) {
            ArrayList<Match> matches = new ArrayList<>();
            try {
                User user = User.getInstance();
                OkHttpClient client = new OkHttpClient.Builder()
                        .retryOnConnectionFailure(true)
                        .build();

                Request request = new Request.Builder()
                        .url("http://10.0.2.2/api/match/")
                        .addHeader("Authorization", "token " + user.getToken())
                        .get()
                        .build();

                Response response = client.newCall(request).execute();
                String data = response.body().string();
                JSONArray array = new JSONArray(data);
                for (int i = 0; i < array.length(); i++) {
                    JSONObject o = array.getJSONObject(i);
                    Date matchDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2013-09-18T20:40:00+0000".replace("T", " ").substring(0, 19));
                    matches.add(new Match(o.getString("location"), matchDate));
                }


            } catch (Exception e) {
                e.printStackTrace();
            }
            return matches;
        }
    }
}
