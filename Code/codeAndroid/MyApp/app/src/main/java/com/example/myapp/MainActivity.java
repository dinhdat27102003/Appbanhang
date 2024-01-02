package com.example.myapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SearchView;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import android.app.FragmentManager;
import android.app.SearchManager;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    Toolbar toolbar;
    BottomNavigationView bottomNavigationView;
    public static ArrayList<Cart> arrCart;
    EditText edt;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

        Anhxa();
        getSupportFragmentManager().beginTransaction()
                        .replace(R.id.framelayout_main,new MallFragment()).commit();
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                if(item.getItemId()==R.id.action_mall){
                    getSupportFragmentManager().beginTransaction()
                            .replace(R.id.framelayout_main,new MallFragment()).commit();
                }
                if(item.getItemId()==R.id.action_awesome){
                    getSupportFragmentManager().beginTransaction()
                            .replace(R.id.framelayout_main,new New_Fragment()).commit();
                }
                if (item.getItemId()==R.id.action_more){
                    getSupportFragmentManager().beginTransaction()
                            .replace(R.id.framelayout_main,new OtherFragment()).commit();
                }
                if(item.getItemId()==R.id.action_phone){
                    getSupportFragmentManager().beginTransaction()
                            .replace(R.id.framelayout_main,new ContactFragment()).commit();
                }
                return true;
            }
        });
    }

    public void Anhxa(){
        edt = (EditText) findViewById(R.id.edt_search);
        toolbar = (Toolbar) findViewById(R.id.toolbar_main);
        setSupportActionBar(toolbar);
        bottomNavigationView = (BottomNavigationView) findViewById(R.id.bottom_nav);
        if(arrCart!=null){

        }else {
            arrCart = new ArrayList<>();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_search,menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        if(item.getItemId()==R.id.action_search){
            Intent in = new Intent(MainActivity.this,SearchActivity.class);
            in.putExtra("search",edt.getText().toString().toLowerCase());
            startActivity(in);
        }
        if(item.getItemId()==R.id.action_cart){
            Intent in = new Intent(MainActivity.this,GioHangActivity.class);
            startActivity(in);
        }
        return super.onOptionsItemSelected(item);
    }
}