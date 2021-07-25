package com.ifoot.Activities;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.ifoot.Models.Match;
import com.ifoot.Models.User;
import com.ifoot.R;
import com.ifoot.Services.Match.GetOne;
import com.ifoot.Services.User.Subscribe;
import com.ifoot.Services.User.Unsubscribe;

public class MatchDetail extends AppCompatActivity {
    Match match;

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
        Bundle extras = getIntent().getExtras();
        this.match = new GetOne().startTask(extras.getInt("id"));
        setContentView(R.layout.activity_match_detail);
        TextView title = findViewById(R.id.matchLocation);
        TextView subTitle = findViewById(R.id.matchDate);
        title.setText(match.getLocation());
        subTitle.setText(match.getDate().toString());
        ListView listView = findViewById(R.id.userList);
        ArrayAdapter<User> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, match.getUsers());
        listView.setAdapter(adapter);
        this.handleButtons();
    }
}
