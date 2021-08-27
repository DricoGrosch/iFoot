package com.ifoot.Activities;

import android.os.Bundle;
import android.os.PersistableBundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.ifoot.Models.Match;
import com.ifoot.Models.User;
import com.ifoot.R;
import com.ifoot.Services.Match.GetOne;
import com.ifoot.Services.User.Subscribe;
import com.ifoot.Services.User.Unsubscribe;

public class MatchDetail extends AppCompatActivity implements OnMapReadyCallback {
    Match match;
    MapView mapView;
    GoogleMap map;

    private void handleButtons() {
        Button subscribe = (Button) findViewById(R.id.subscribeButton);
        Button unsubscribe = (Button) findViewById(R.id.unsubscribeButton);
        subscribe.setEnabled(true);
        unsubscribe.setEnabled(false);
        User currentUser = User.getInstance();
        for (User u : this.match.getUsers()) {
            if (u.getId() == currentUser.getId()) {
                subscribe.setEnabled(false);
                unsubscribe.setEnabled(true);
                break;
            }
        }
        subscribe.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                new Subscribe().startTask(match.getId());
                finish();
                startActivity(getIntent());
            }
        });
        unsubscribe.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                new Unsubscribe().startTask(match.getId());
                finish();
                startActivity(getIntent());
            }
        });
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_match_detail);
        Bundle extras = getIntent().getExtras();
        this.mapView = findViewById(R.id.mapView);
        this.mapView.getMapAsync(this);
        this.mapView.onCreate(savedInstanceState);
        this.match = new GetOne().startTask(extras.getInt("id"));
        TextView title = findViewById(R.id.matchLocation);
        TextView subTitle = findViewById(R.id.matchDate);
        title.setText(match.getLocation());
        subTitle.setText(match.getDate().toString());
        ListView listView = findViewById(R.id.userList);
        ArrayAdapter<User> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, match.getUsers());
        listView.setAdapter(adapter);
        this.handleButtons();
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

    @Override
    public void onMapReady(@NonNull GoogleMap googleMap) {
        LatLng position = new LatLng(this.match.getlatitude(), this.match.getLongitude());
        this.map = googleMap;
        this.map.moveCamera(CameraUpdateFactory.newLatLngZoom(position, 5));
        this.map.addMarker(new MarkerOptions().position(position));
    }
}
