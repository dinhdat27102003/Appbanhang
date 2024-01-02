package com.example.myapp;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

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

public class RegisterActivity extends AppCompatActivity {
    EditText edtname,edtpass,edtrepass;
    TextView txt_out,txtRegister;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        Map();
        btnOnclick1();
    }

    public void Map(){
        edtname = (EditText) findViewById(R.id.edt_name_register);
        edtpass = (EditText) findViewById(R.id.edt_pass_register);
        edtrepass = (EditText) findViewById(R.id.edt_repass_register);

        txtRegister = (TextView) findViewById(R.id.txtRegister);
        txt_out = (TextView) findViewById(R.id.txt_out);
    }

    public void btnOnclick1(){
        txtRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final String name = edtname.getText().toString().trim();
                final String pass = edtpass.getText().toString().trim();
                final String repass = edtrepass.getText().toString().trim();
                if(name.length()>0 &&pass.length()>0 && repass.length()>0){
                    if(repass.equals(pass)){
                        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                        StringRequest stringRequest = new StringRequest(Request.Method.POST, Server.Register, new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                if(response.equals("ok")){
                                    Toast.makeText(RegisterActivity.this,"Đăng ký thành công",Toast.LENGTH_LONG).show();
                                    finish();
                                }else {
                                    Toast.makeText(RegisterActivity.this,"Tên người dùng đã tồn tại",Toast.LENGTH_LONG).show();
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
                        Toast.makeText(RegisterActivity.this,"Mật khẩu không khớp",Toast.LENGTH_LONG).show();
                    }
                }else {
                    Toast.makeText(RegisterActivity.this,"Nhập đầy đủ thông tin",Toast.LENGTH_LONG).show();
                }
            }
        });
        txt_out.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }
}