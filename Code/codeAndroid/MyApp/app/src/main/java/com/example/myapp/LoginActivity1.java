package com.example.myapp;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class LoginActivity1 extends AppCompatActivity {
    EditText edtname,edtpass;
    TextView txt_quenmatkhau,txt_dangki,txtLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login1);

        Map();
        btnOnclick();
    }

    public void Map(){
        edtname = (EditText) findViewById(R.id.edt_name);
        edtpass = (EditText) findViewById(R.id.edt_pass);
        txtLogin = (TextView) findViewById(R.id.txt_login);
        txt_dangki = (TextView) findViewById(R.id.txt_dangki);
        txt_quenmatkhau = (TextView) findViewById(R.id.txt_quenmatkhau);
    }

    public void btnOnclick(){
        txtLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final String name = edtname.getText().toString().trim();
                final String pass = edtpass.getText().toString().trim();
                if(name.length()>0 &&pass.length()>0){
                    RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                    StringRequest stringRequest = new StringRequest(Request.Method.POST, Server.Login, new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            if(response.equals("ok")){
                                Intent i = new Intent(LoginActivity1.this,MainActivity.class);
                                startActivity(i);
                            }
                            else {
                                Toast.makeText(LoginActivity1.this,"Tài khoản hoặc mật khẩu chưa chính xác",Toast.LENGTH_LONG).show();
                            }
                        }
                    }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {

                        }
                    }){
                        @Nullable
                        @Override
                        protected Map<String, String> getParams() throws AuthFailureError {
                            HashMap<String,String> hashMap = new HashMap<String,String>();
                            hashMap.put("name",name);
                            hashMap.put("pass",pass);
                            return hashMap;
                        }
                    };
                    requestQueue.add(stringRequest);
                }else {
                    Toast.makeText(LoginActivity1.this,"Nhập đầy đủ thông tin",Toast.LENGTH_LONG).show();
                }
            }
        });

        txt_dangki.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(LoginActivity1.this,RegisterActivity.class);
                startActivity(i);
            }
        });
        txt_quenmatkhau.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(LoginActivity1.this,UpdateAccountActivity.class);
                startActivity(i);
            }
        });
    }
}