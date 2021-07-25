package com.ifoot.Activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
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
        ArrayList<Match> matches = new FecthAll().startTask();
        setContentView(R.layout.activity_match_list);
        ListView listView = findViewById(R.id.listView);
        ArrayAdapter<Match> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, matches);
        listView.setAdapter(adapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Match item = matches.get(position);
                Intent intent = new Intent(view.getContext(), MatchDetail.class);
                intent.putExtra("id", item.getId());
                startActivityForResult(intent, 0);
            }
        });
    }
}