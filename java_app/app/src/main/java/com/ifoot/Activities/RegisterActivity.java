package com.ifoot.Activities;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;


import com.ifoot.R;
import com.ifoot.Services.User.Login;
import com.ifoot.Services.User.Register;

import java.util.Calendar;


public class RegisterActivity extends AppCompatActivity {

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_register);


        Button next = (Button) findViewById(R.id.button);
        next.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                EditText username = findViewById(R.id.usernameRegister);
                EditText password1 = findViewById(R.id.password1);
                EditText password2 = findViewById(R.id.password2);
                if (!password1.getText().equals(password2.getText())) {
                    boolean created = new Register().startTask(username.getText().toString(), password1.getText().toString());
                    Intent myIntent = new Intent(view.getContext(), PlainLoginScreen.class);
                    startActivityForResult(myIntent, 0);
                }
            }

        });

    }


    public void onLogin(View view) {
        finish();
    }
}
