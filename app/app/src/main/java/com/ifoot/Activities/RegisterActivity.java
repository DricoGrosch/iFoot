package com.ifoot.Activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;


import com.ifoot.R;
import com.ifoot.Services.User.Login;
import com.ifoot.Services.User.Register;


public class RegisterActivity extends AppCompatActivity {

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
