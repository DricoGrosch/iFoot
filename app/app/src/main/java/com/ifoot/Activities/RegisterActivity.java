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
    private DatePickerDialog datePickerDialog;
    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        initDatePicker();
        setContentView(R.layout.activity_register);


        Button next = (Button) findViewById(R.id.button);
        next.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                EditText username = findViewById(R.id.usernameRegister);
                EditText password1 = findViewById(R.id.password1);
                EditText password2 = findViewById(R.id.password2);
                if (!password1.getText().equals(password2.getText())) {
                    boolean created = new Register().startTask(username.getText().toString(), password1.getText().toString());
                    //Intent myIntent = new Intent(view.getContext(), PlainLoginScreen.class);
                    //startActivityForResult(myIntent, 0);
                    openDatePicker( this);
                }
            }

        });

    }
    private void initDatePicker(){
        DatePickerDialog.OnDateSetListener dateSetListener = new DatePickerDialog.OnDateSetListener(){
            @Override
            public void onDateSet(DatePicker datePicker, int year, int month, int day) {
                month = month+1;
                String date = makeDateString(day,month,year);

            }
        };
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        int day = cal.get(Calendar.DAY_OF_MONTH);

        int style = AlertDialog.THEME_HOLO_LIGHT;
        datePickerDialog = new DatePickerDialog(this,style,dateSetListener,year,month,day);
    }
    private String makeDateString(int day, int month, int year){
        return month+ "" + day+ "year";
    }

public void openDatePicker(View.OnClickListener view){
        datePickerDialog.show();
}

    public void onLogin(View view) {
        finish();
    }
}
