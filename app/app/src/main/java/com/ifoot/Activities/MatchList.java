package com.ifoot.Activities;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;


import com.ifoot.Adapters.MatchListAdapter;
import com.ifoot.R;

import java.util.ArrayList;


public class MatchList extends AppCompatActivity {
    ListView listView;

    ArrayList<String> array= new ArrayList<String>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        array.add("1");
        array.add("2");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_match_list);
        listView = findViewById(R.id.listView);

        ArrayAdapter<String> adapter = new ArrayAdapter<>(this,android.R.layout.simple_list_item_1,array);
            listView.setAdapter(adapter);
    }
}