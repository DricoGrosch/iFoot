package com.ifoot.Activities;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ListView;


import com.ifoot.Models.Match;
import com.ifoot.R;
import com.ifoot.Services.Match.Create;
import com.ifoot.Services.Match.FecthAll;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;


public class MatchList extends AppCompatActivity {
    EditText date;
    EditText time;

    public void transformInputs() {
        this.date = findViewById(R.id.newMatchDateInput);
        this.time = findViewById(R.id.newMatchTimeInput);

        date.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showDateDialog(view, date);
            }
        });
    }

    private void showDateDialog(View view, EditText date) {
        Calendar calendar = Calendar.getInstance();
        DatePickerDialog.OnDateSetListener dateSetListener = new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker datePicker, int i, int i1, int i2) {
                calendar.set(Calendar.YEAR, i);
                calendar.set(Calendar.MONTH, i1);
                calendar.set(Calendar.DAY_OF_MONTH, i2);
                SimpleDateFormat matchDate = new SimpleDateFormat("yyyy-MM-dd");
                date.setText(matchDate.format(calendar));
            }
        };
        new DatePickerDialog(view.getContext(), dateSetListener, calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ArrayList<Match> matches = new FecthAll().startTask();
        setContentView(R.layout.activity_match_list);
        ListView listView = findViewById(R.id.listView);
        ArrayAdapter<Match> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, matches);
        listView.setAdapter(adapter);
        this.transformInputs();
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Match item = matches.get(position);
                Intent intent = new Intent(view.getContext(), MatchDetail.class);
                intent.putExtra("id", item.getId());
                startActivityForResult(intent, 0);
            }
        });

        Button newMatchButton = (Button) findViewById(R.id.newMatchButton);
        newMatchButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                EditText location = findViewById(R.id.newMatchLocationInput);
                new Create().startTask(location.getText().toString(), date.getText() + " " + time.getText());
                finish();
                startActivity(getIntent());
            }

        });
    }
}