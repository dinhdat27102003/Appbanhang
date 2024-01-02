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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

public class ThongTinKhacHangActivity extends AppCompatActivity {
    EditText tenkhachhang,email,sodienthoai;
    TextView btnxacnhan,btntrove;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_thong_tin_khac_hang);

        Map();
        btntrove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
        EvenButton();
    }

    private void EvenButton() {
        btnxacnhan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Pattern checkphone = Pattern.compile("^[0-9]{9,11}$");
                Pattern checkemail = Pattern.compile("^\\w+[a-z0-9]*@\\w+mail.com$");

                final String ten  = tenkhachhang.getText().toString().trim();
                final String sdt = sodienthoai.getText().toString().trim();
                final String Email = email.getText().toString().trim();

                if(ten.length()>0 && sdt.length()>0 && Email.length()>0){
                    if(!checkphone.matcher(sdt).find()){
                        Toast.makeText(ThongTinKhacHangActivity.this,"Sai số điện thoại",Toast.LENGTH_LONG).show();
                    } else if (!checkemail.matcher(Email).find()) {
                        Toast.makeText(ThongTinKhacHangActivity.this,"Sai email",Toast.LENGTH_LONG).show();
                    }else {
                        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                        StringRequest stringRequest = new StringRequest(Request.Method.POST, Server.Duongdandonhang, new Response.Listener<String>() {
                            @Override
                            public void onResponse(final String madonhang) {
                                if(Integer.parseInt(madonhang)>0){
                                    RequestQueue queue = Volley.newRequestQueue(getApplicationContext());
                                    StringRequest request = new StringRequest(Request.Method.POST, Server.Duongdanchitietdonhang, new Response.Listener<String>() {
                                        @Override
                                        public void onResponse(String response) {
                                            if (response.equals("ok")){
                                                MainActivity.arrCart.clear();
                                                Intent i = new Intent(ThongTinKhacHangActivity.this,MainActivity.class);
                                                startActivity(i);
                                                Toast.makeText(ThongTinKhacHangActivity.this,"Đăng ký mua hàng thành công",Toast.LENGTH_LONG).show();
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
                                            JSONArray jsonArray = new JSONArray();
                                            for(int i =0 ;i<MainActivity.arrCart.size();i++){
                                                JSONObject jsonObject = new JSONObject();
                                                try {
                                                    jsonObject.put("madonhang",madonhang);
                                                    jsonObject.put("masanpham",MainActivity.arrCart.get(i).getId());
                                                    jsonObject.put("tensanpham",MainActivity.arrCart.get(i).getName());
                                                    jsonObject.put("giasanpham",MainActivity.arrCart.get(i).getPrice());
                                                    jsonObject.put("soluongsanpham",MainActivity.arrCart.get(i).getQuantity());
                                                } catch (JSONException e) {
                                                    throw new RuntimeException(e);
                                                }
                                                jsonArray.put(jsonObject);
                                            }
                                            HashMap<String,String> hashMap = new HashMap<String,String>();
                                            hashMap.put("json",jsonArray.toString());
                                            return hashMap;
                                        }
                                    };
                                    queue.add(request);
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
                                hashMap.put("tenkhachhang",ten);
                                hashMap.put("sodienthoai",sdt);
                                hashMap.put("email",Email);
                                return hashMap;
                            }
                        };
                        requestQueue.add(stringRequest);

                    }
                }else {
                    Toast.makeText(ThongTinKhacHangActivity.this,"Kiểm tra lại dữ liệu",Toast.LENGTH_LONG).show();
                }

            }
        });
    }

    public void Map(){
        tenkhachhang = (EditText) findViewById(R.id.edittexttenkhachhang);
        email = (EditText) findViewById(R.id.edittextemail);
        sodienthoai = (EditText) findViewById(R.id.edittextsdt);

        btnxacnhan = (TextView) findViewById(R.id.btnxacnhan);
        btntrove = (TextView) findViewById(R.id.btntrove);
    }
}