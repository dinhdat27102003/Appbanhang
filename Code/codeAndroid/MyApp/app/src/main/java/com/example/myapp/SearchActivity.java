package com.example.myapp;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.ListView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.regex.Pattern;

public class SearchActivity extends AppCompatActivity {
    RecyclerView recyclerView;
    public static String str;
    Toolbar toolbar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search);
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        Intent in = getIntent();
        str = in.getStringExtra("search");
        map();
        parstsanphammoinhat(loadData(Server.Duongdanall));

    }

    public void map(){
        recyclerView = (RecyclerView) findViewById(R.id.recyvlerview_search);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new GridLayoutManager(getApplicationContext(),2));
        toolbar = (Toolbar) findViewById(R.id.toolbar_search);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }
    public String loadData(String a){
        String strurl = a;
        String data = "";

        try{
            URL url = new URL(strurl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            InputStream in = new BufferedInputStream(connection.getInputStream());
            String line = "";
            StringBuilder stringBuilder = new StringBuilder();
            InputStreamReader inputStreamReader = new InputStreamReader(in);
            BufferedReader buff = new BufferedReader(inputStreamReader);
            while ((line=buff.readLine())!=null){
                stringBuilder.append(line);
            }
            data = stringBuilder.toString();
        }catch (Exception e){

        }

        return data;
    }

    private void parstsanphammoinhat(String a) {
        ArrayList<SanPham> Data = new ArrayList<>();
        try{
            JSONObject parent = new JSONObject(a);
            JSONArray sanpham = parent.getJSONArray("sanpham");
            for(int i = 0;i<sanpham.length();i++){
                JSONObject sp = sanpham.getJSONObject(i);
                String id = sp.getString("id");
                String name = sp.getString("name");
                String price = sp.getString("price");
                String image = sp.getString("image");
                String description = sp.getString("description");
                String idsanpham = sp.getString("idloaisp");
                Data.add(new SanPham(Integer.parseInt(id),name,Integer.parseInt(price),image,description,Integer.parseInt(idsanpham)));
            }
            SearchAdapter spadapter = new SearchAdapter(this,Data);
            recyclerView.setAdapter(spadapter);
            spadapter.getFilter().filter(str);

        }catch (Exception e){

        }
    }

    public static String doi(String s){
        String temp = Normalizer.normalize(s,Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCOMBINING_DIACRITICAL_MARKS}+");
        return pattern.matcher(temp).replaceAll("");
    }
}