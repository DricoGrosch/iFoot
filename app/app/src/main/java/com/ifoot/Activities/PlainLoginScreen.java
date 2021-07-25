package com.ifoot.Activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;


import com.ifoot.R;
import com.ifoot.Services.User.Login;


public class PlainLoginScreen extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_plain_login_screen);


        Button next = (Button) findViewById(R.id.registerButton);
        next.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                Intent myIntent = new Intent(view.getContext(), RegisterActivity.class);
                startActivityForResult(myIntent, 0);
            }

        });

        Button next2 = (Button) findViewById(R.id.loginButton);
        next2.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                EditText username = findViewById(R.id.usernameField);
                EditText password = findViewById(R.id.passwordField);
                boolean authenticated = new Login().startTask(username.getText().toString(), password.getText().toString());
                if (authenticated) {
                    Intent myIntent = new Intent(view.getContext(), MatchList.class);
                    startActivityForResult(myIntent, 0);
                }
            }

        });
    }
}
