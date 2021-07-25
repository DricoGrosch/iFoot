package com.ifoot.Activities;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;


import com.ifoot.Models.Match;
import com.ifoot.R;
import com.ifoot.Services.Match.FecthAll;

import java.util.ArrayList;


public class MatchList extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ArrayList<String> stringMatches = new ArrayList<>();
        for (Match m : new FecthAll().startTask()) {
            stringMatches.add(m.toString());
        }
        setContentView(R.layout.activity_match_list);
        ListView listView = findViewById(R.id.listView);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, stringMatches);
        listView.setAdapter(adapter);
    }
}