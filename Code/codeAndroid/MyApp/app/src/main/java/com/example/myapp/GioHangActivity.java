package com.example.myapp;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.text.DecimalFormat;

public class GioHangActivity extends AppCompatActivity {
    Toolbar toolbar;
    ListView listView;
    TextView txtthongbao;
    static TextView txttongtien,btnthanhtoan,btntieptucmua;
    GioHangAdapter gioHangAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_gio_hang);

        Anhxa();
        ActionBar();
        CheckData();
        EventUltil();
        CatOnItemListView();
    }

    private void CatOnItemListView() {
        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int position, long l) {
                AlertDialog.Builder builder = new AlertDialog.Builder(GioHangActivity.this);
                builder.setTitle("Xác nhận xoá?")
                        .setMessage("Bạn có muốn xoá?")
                        .setPositiveButton("Có", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                if(MainActivity.arrCart.size()<=0){
                                    txtthongbao.setVisibility(View.VISIBLE);
                                }else {
                                    MainActivity.arrCart.remove(position);
                                    gioHangAdapter.notifyDataSetChanged();
                                    EventUltil();
                                    if(MainActivity.arrCart.size()<=0){
                                        txtthongbao.setVisibility(View.VISIBLE);
                                    }else {
                                        txtthongbao.setVisibility(View.INVISIBLE);
                                        gioHangAdapter.notifyDataSetChanged();
                                        EventUltil();
                                    }
                                }
                            }
                        });
                builder.setNegativeButton("Không", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        gioHangAdapter.notifyDataSetChanged();
                        EventUltil();
                    }
                });
                builder.show();
                return true;
            }
        });
    }

    public static void EventUltil(){
        long tongtien = 0;
        for(int i =0;i<MainActivity.arrCart.size();i++){
            tongtien+=MainActivity.arrCart.get(i).getPrice();
        }
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        txttongtien.setText(decimalFormat.format(tongtien));
    }

    private void CheckData() {
        if(MainActivity.arrCart.size()<=0){
            gioHangAdapter.notifyDataSetChanged();
            txtthongbao.setVisibility(View.VISIBLE);
            listView.setVisibility(View.INVISIBLE);
        }else {
            gioHangAdapter.notifyDataSetChanged();
            txtthongbao.setVisibility(View.INVISIBLE);
            listView.setVisibility(View.VISIBLE);
        }
    }

    private void ActionBar() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }

    private void Anhxa() {
        listView = (ListView) findViewById(R.id.listview);
        txtthongbao = (TextView) findViewById(R.id.textviewthongbao);
        txttongtien = (TextView) findViewById(R.id.txtgiatri);
        btnthanhtoan = (TextView) findViewById(R.id.buttonthanhtoangiohang);
        btntieptucmua = (TextView) findViewById(R.id.buttontieptucmuahang);
        toolbar = (Toolbar) findViewById(R.id.toolbargiohang);
        gioHangAdapter = new GioHangAdapter(GioHangActivity.this,MainActivity.arrCart);
        listView.setAdapter(gioHangAdapter);

        btntieptucmua.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(GioHangActivity.this,MainActivity.class);
                startActivity(i);
                finish();
            }
        });

        btnthanhtoan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(MainActivity.arrCart.size()>0){
                    Intent i = new Intent(GioHangActivity.this,ThongTinKhacHangActivity.class);
                    startActivity(i);
                }else {
                    Toast.makeText(GioHangActivity.this,"Chưa có sản phẩm",Toast.LENGTH_LONG).show();
                }
            }
        });
    }
}