package com.ifoot.Activities;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TimePicker;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.ifoot.R;
import com.ifoot.Services.Match.Create;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class MatchCreation extends AppCompatActivity implements OnMapReadyCallback {
    EditText dateInput;
    EditText timeInput;
    EditText locationInput;
    private DatePickerDialog datePickerDialog;
    private TimePickerDialog timePickerDialog;
    MapView mapView;
    GoogleMap map;
    double latitude;
    double longitude;

    private void initDatePicker() {
        DatePickerDialog.OnDateSetListener dateSetListener = new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker datePicker, int year, int month, int day) {
                month = month + 1;
                Date date = null;
                DateFormat dateFormat = null;
                try {
                    date = new SimpleDateFormat("yyyy-M-dd").parse(year + "-" + month + "-" + day);
                    dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    dateInput.setText(dateFormat.format(date));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        };
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        int day = cal.get(Calendar.DAY_OF_MONTH);

        int style = AlertDialog.THEME_HOLO_LIGHT;
        datePickerDialog = new DatePickerDialog(this, style, dateSetListener, year, month, day);
    }


    public void initPickers() {
        initDatePicker();
        initTimePicker();
    }

    private void initTimePicker() {
        Calendar cal = Calendar.getInstance();
        this.timePickerDialog = new TimePickerDialog(this, new TimePickerDialog.OnTimeSetListener() {
            @Override
            public void onTimeSet(TimePicker timePicker, int i, int i1) {
                SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
                Date date = null;
                try {
                    date = sdf.parse(i + ":" + i1);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                String formattedTime = sdf.format(date);

                timeInput.setText(formattedTime);


            }
        }, cal.get(Calendar.HOUR_OF_DAY), cal.get(Calendar.MINUTE), true);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        initPickers();
        setContentView(R.layout.match_creation);
        this.mapView = findViewById(R.id.map);
        this.mapView.getMapAsync(this);
        this.mapView.onCreate(savedInstanceState);
        this.dateInput = findViewById(R.id.newMatchDateInput);
        this.timeInput = findViewById(R.id.newMatchTimeInput);
        this.locationInput = findViewById(R.id.newMatchLocationInput);



        this.dateInput.setTextColor(Color.WHITE);
        this.timeInput.setTextColor(Color.WHITE);
        this.locationInput.setTextColor(Color.WHITE);

        this.dateInput.setHintTextColor(Color.WHITE);
        this.timeInput.setHintTextColor(Color.WHITE);
        this.locationInput.setHintTextColor(Color.WHITE);
        dateInput.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                datePickerDialog.show();
            }
        });
        timeInput.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                timePickerDialog.show();
            }
        });

        Button newMatchButton = (Button) findViewById(R.id.newMatchButton);
        newMatchButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                new Create().startTask(locationInput.getText().toString(), dateInput.getText() + " " + timeInput.getText(), latitude + "", longitude + "");
                Intent intent = new Intent(view.getContext(), MatchList.class);
                startActivityForResult(intent, 0);
            }
        });
    }

    @Override
    public void onMapReady(@NonNull GoogleMap googleMap) {
        this.map = googleMap;
        googleMap.setOnMapClickListener(new GoogleMap.OnMapClickListener() {

            @Override
            public void onMapClick(@NonNull LatLng latLng) {
                googleMap.clear();
                latitude = latLng.latitude;
                longitude = latLng.longitude;
                googleMap.addMarker(new MarkerOptions().position(latLng));
            }
        });
    }

    @Override
    protected void onStart() {
        super.onStart();
        this.mapView.onStart();
    }

    @Override
    protected void onResume() {
        super.onResume();
        this.mapView.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
        this.mapView.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        this.mapView.onDestroy();
    }

    @Override
    protected void onStop() {
        super.onStop();
        this.mapView.onStop();
    }

    @Override
    public void onSaveInstanceState(@NonNull Bundle outState, @NonNull PersistableBundle outPersistentState) {
        super.onSaveInstanceState(outState, outPersistentState);
        this.mapView.onSaveInstanceState(outState);
    }

    @Override
    public void onLowMemory() {
        super.onLowMemory();
        this.mapView.onLowMemory();
    }
}