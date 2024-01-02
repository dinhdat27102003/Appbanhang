package com.example.myapp;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class GioHangAdapter extends BaseAdapter {
    Context context;
    ArrayList<Cart> arraygiohang;

    public GioHangAdapter(Context context, ArrayList<Cart> arraygiohang) {
        this.context = context;
        this.arraygiohang = arraygiohang;
    }

    @Override
    public int getCount() {
        return arraygiohang.size();
    }

    @Override
    public Object getItem(int i) {
        return arraygiohang.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }

    public class ViewHolder{
        public TextView txttengiohang,txtgiagiohang;
        public ImageView imggiohang;
        public Button btnminus,btnvalues,btnplus;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder =null;
        if(view==null){
            viewHolder = new ViewHolder();
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            view = inflater.inflate(R.layout.item_cart,null);
            viewHolder.txttengiohang =(TextView) view.findViewById(R.id.textviewtengiohang);
            viewHolder.txtgiagiohang = (TextView) view.findViewById(R.id.textviewgiagiohang);
            viewHolder.imggiohang = (ImageView) view.findViewById(R.id.imageviewgiohang);
            viewHolder.btnminus = (Button) view.findViewById(R.id.buttonminus);
            viewHolder.btnvalues = (Button) view.findViewById(R.id.buttonvalues);
            viewHolder.btnplus = (Button) view.findViewById(R.id.buttonplus);
            view.setTag(viewHolder);
        }else {
            viewHolder = (ViewHolder) view.getTag();
        }
        Cart gioHang = (Cart) getItem(i);
        viewHolder.txttengiohang.setText(gioHang.getName());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        viewHolder.txtgiagiohang.setText(decimalFormat.format(gioHang.getPrice())+"Đ");
        Picasso.with(context).load(gioHang.getImage())
                .into(viewHolder.imggiohang);
        viewHolder.btnvalues.setText(gioHang.getQuantity()+"");
        int sl = Integer.parseInt(viewHolder.btnvalues.getText().toString());
        if(sl>=10){
            viewHolder.btnplus.setVisibility(View.INVISIBLE);
            viewHolder.btnminus.setVisibility(View.VISIBLE);
        }else if (sl<=1){
            viewHolder.btnminus.setVisibility(View.INVISIBLE);
        } else if (sl>=1) {
            viewHolder.btnminus.setVisibility(View.VISIBLE);
            viewHolder.btnplus.setVisibility(View.VISIBLE);
        }

        ViewHolder a = viewHolder;
        viewHolder.btnplus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                int slmoinhat = Integer.parseInt(a.btnvalues.getText().toString())+1;
                int slhientai = MainActivity.arrCart.get(i).getQuantity();
                long giahientai = MainActivity.arrCart.get(i).getPrice();

                MainActivity.arrCart.get(i).setQuantity(slmoinhat);
                long giamoinhat = (giahientai*slmoinhat)/slhientai;
                MainActivity.arrCart.get(i).setPrice(giamoinhat);

                DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
                a.txtgiagiohang.setText(decimalFormat.format(giamoinhat)+"Đ");

                GioHangActivity.EventUltil();
                if(slmoinhat>9){
                    a.btnplus.setVisibility(View.INVISIBLE);
                    a.btnminus.setVisibility(View.VISIBLE);
                    a.btnvalues.setText(String.valueOf(slmoinhat));
                }else {
                    a.btnplus.setVisibility(View.VISIBLE);
                    a.btnminus.setVisibility(View.VISIBLE);
                    a.btnvalues.setText(String.valueOf(slmoinhat));
                }
            }
        });

        viewHolder.btnminus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                int slmoinhat = Integer.parseInt(a.btnvalues.getText().toString())-1;
                int slhientai = MainActivity.arrCart.get(i).getQuantity();
                long giahientai = MainActivity.arrCart.get(i).getPrice();

                MainActivity.arrCart.get(i).setQuantity(slmoinhat);
                long giamoinhat = (giahientai*slmoinhat)/slhientai;
                MainActivity.arrCart.get(i).setPrice(giamoinhat);

                DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
                a.txtgiagiohang.setText(decimalFormat.format(giamoinhat)+"Đ");

                GioHangActivity.EventUltil();
                if(slmoinhat<2){
                    a.btnplus.setVisibility(View.VISIBLE);
                    a.btnminus.setVisibility(View.INVISIBLE);
                    a.btnvalues.setText(String.valueOf(slmoinhat));
                }else {
                    a.btnplus.setVisibility(View.VISIBLE);
                    a.btnminus.setVisibility(View.VISIBLE);
                    a.btnvalues.setText(String.valueOf(slmoinhat));
                }
            }
        });

        return view;
    }

}
