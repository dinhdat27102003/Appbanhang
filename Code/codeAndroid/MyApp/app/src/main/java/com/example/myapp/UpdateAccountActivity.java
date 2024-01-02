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

public class UpdateAccountActivity extends AppCompatActivity {
    EditText edtName,edtPass;
    TextView txt_quaylai,txtXacnhan;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update_account);
        Map();
        btnOnclick();
    }

    private void Map(){
        edtName = (EditText) findViewById(R.id.edt_update_name);
        edtPass = (EditText) findViewById(R.id.edt_update_pass);
        txtXacnhan = (TextView) findViewById(R.id.txtXacnhan);
        txt_quaylai = (TextView) findViewById(R.id.txt_quaylai);
    }

    private void btnOnclick(){
        txtXacnhan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final String name = edtName.getText().toString().trim();
                final String pass = edtPass.getText().toString().trim();
                if(name.length()>0 &&pass.length()>0){
                    RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                    StringRequest stringRequest = new StringRequest(Request.Method.POST, Server.Update, new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            if(response.equals("ok")){
                                Toast.makeText(UpdateAccountActivity.this,"Đổi mật khẩu thành công",Toast.LENGTH_LONG).show();
                                Intent i = new Intent(UpdateAccountActivity.this,LoginActivity1.class);
                                startActivity(i);
                            }else {
                                Toast.makeText(UpdateAccountActivity.this,"Tài khoản không chính xác",Toast.LENGTH_LONG).show();
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
                    Toast.makeText(UpdateAccountActivity.this,"Nhập đầy đủ thông tin",Toast.LENGTH_LONG).show();
                }
            }
        });

        txt_quaylai.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }
}