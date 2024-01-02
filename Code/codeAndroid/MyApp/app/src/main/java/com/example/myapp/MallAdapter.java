package com.example.myapp;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class MallAdapter extends RecyclerView.Adapter<MallAdapter.MallViewHolder>{
    private List<SanPham> sanPhamList;
    private Context context;

    public MallAdapter(List<SanPham> sanPhamList, Context context) {
        this.sanPhamList = sanPhamList;
        this.context = context;
    }

    @NonNull
    @Override
    public MallViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_mall,parent,false);
        return new MallViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull MallViewHolder holder, int position) {
        SanPham sp = sanPhamList.get(position);
        holder.textviewtitle.setText(sp.getName());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.textviewchannel.setText(decimalFormat.format(sp.getPrice()));
        Picasso.with(context).load(sp.getImage())
                .into(holder.img);
    }

    @Override
    public int getItemCount() {
        return sanPhamList.size();
    }



    public class MallViewHolder extends RecyclerView.ViewHolder{
        public ImageView img;
        public TextView textviewtitle,textviewchannel;

        public MallViewHolder(@NonNull View itemView) {
            super(itemView);
            img = (itemView).findViewById(R.id.img_mall);
            textviewtitle = (itemView).findViewById(R.id.txtten_mall);
            textviewchannel = (itemView).findViewById(R.id.txtgia_mall);
            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent intent = new Intent(context,DetailActivity.class);
                    intent.putExtra("detail",sanPhamList.get(getPosition()));
                    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    context.startActivity(intent);
                    //Toast.makeText(context, sanPhamList.get(getPosition()).toString(), Toast.LENGTH_SHORT).show();
                }
            });
        }
    }
}
