package com.ifoot.Activities;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.ifoot.R;
import com.ifoot.Services.Match.Create;

import java.text.SimpleDateFormat;
import java.util.Calendar;


public class MatchCreation extends AppCompatActivity implements OnMapReadyCallback {
    EditText date;
    EditText time;
    MapView mapView;
    GoogleMap map;
    double latitude;
    double longitude;

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
        setContentView(R.layout.match_creation);
        this.mapView = findViewById(R.id.map);
        this.mapView.getMapAsync(this);
        this.mapView.onCreate(savedInstanceState);
        this.transformInputs();

        Button newMatchButton = (Button) findViewById(R.id.newMatchButton);
        newMatchButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                EditText location = findViewById(R.id.newMatchLocationInput);
                new Create().startTask(location.getText().toString(), date.getText() + " " + time.getText(), latitude + "", longitude + "");
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