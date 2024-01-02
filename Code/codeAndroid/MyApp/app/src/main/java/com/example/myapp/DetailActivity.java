package com.example.myapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;

public class DetailActivity extends AppCompatActivity {
    Toolbar toolbar;
    ImageView imageViewDetail;
    TextView txtten,txtgia,txtmota;
    Spinner spinner;
    BottomNavigationView bottomNavigationView;
    int id = 0;
    String Tenchitet = "";
    int Giachitiet;
    String Hinhanhchitiet = "";
    String Motachitiet = "";
    int Idsanpham;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);
        AnhXa();
        ActionToolBar();
        getInFormation();
        CatEventSpinner();
        a();

    }

    public void AnhXa(){
        toolbar = (Toolbar) findViewById(R.id.toolbar_detail);
        imageViewDetail = (ImageView) findViewById(R.id.img_detail);
        txtten = (TextView) findViewById(R.id.name_deail);
        txtgia = (TextView) findViewById(R.id.price_detail);
        txtmota = (TextView) findViewById(R.id.description_detail);
        spinner = (Spinner) findViewById(R.id.spinner);
        bottomNavigationView = (BottomNavigationView) findViewById(R.id.bottom_nav_detail);
    }
    public void ActionToolBar(){
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }

    public void getInFormation(){
        SanPham sanpham = (SanPham) getIntent().getSerializableExtra("detail");
        id = sanpham.getId();
        Tenchitet = sanpham.getName();
        Giachitiet = sanpham.getPrice();
        Motachitiet = sanpham.getDescription();
        Hinhanhchitiet = sanpham.getImage();
        Idsanpham = sanpham.getIdSanpham();
        txtten.setText(Tenchitet);
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        txtgia.setText("Giá : "+decimalFormat.format(Giachitiet)+ " Đ");
        txtmota.setText(Motachitiet);
        Picasso.with(getApplicationContext()).load(Hinhanhchitiet)
                .into(imageViewDetail);
    }

    public void CatEventSpinner(){
        Integer[] soluong = new Integer[]{1,2,3,4,5,6,7,8,9,10};
        ArrayAdapter<Integer> arrayAdapter = new ArrayAdapter<Integer>(this,android.R.layout.simple_spinner_item,soluong);
        spinner.setAdapter(arrayAdapter);
    }

    private void a(){
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                if(item.getItemId()==R.id.action_cart){
                    if(MainActivity.arrCart.size()>=0){
                        int sl = Integer.parseInt(spinner.getSelectedItem().toString());
                        boolean exist = false;
                        for(int i =0 ;i<MainActivity.arrCart.size();i++){
                            if(MainActivity.arrCart.get(i).getId()==id){
                                MainActivity.arrCart.get(i).setQuantity(MainActivity.arrCart.get(i).getQuantity()+sl);
                                if(MainActivity.arrCart.get(i).getQuantity()>=10){
                                    MainActivity.arrCart.get(i).setQuantity(10);
                                }
                                MainActivity.arrCart.get(i).setPrice(Giachitiet*MainActivity.arrCart.get(i).getQuantity());
                                exist = true;
                            }
                        }
                        if(exist==false){
                            int soluong = Integer.parseInt(spinner.getSelectedItem().toString());
                            long giamoi = soluong*Giachitiet;
                            MainActivity.arrCart.add(new Cart(id,Tenchitet,giamoi,Hinhanhchitiet,soluong));
                        }

                    }else {
                        int soluong = Integer.parseInt(spinner.getSelectedItem().toString());
                        long giamoi = soluong*Giachitiet;
                        MainActivity.arrCart.add(new Cart(id,Tenchitet,giamoi,Hinhanhchitiet,soluong));
                    }
                    Intent i = new Intent(getApplicationContext(),GioHangActivity.class);
                    startActivity(i);
                }
                return true;
            }
        });
    }



}