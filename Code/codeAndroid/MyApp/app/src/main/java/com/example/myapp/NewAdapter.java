package com.example.myapp;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.List;

public class NewAdapter extends RecyclerView.Adapter<NewAdapter.NewViewHolder> {
    private List<SanPham> sanPhamList;
    private Context context;

    public NewAdapter(List<SanPham> sanPhamList, Context context) {
        this.sanPhamList = sanPhamList;
        this.context = context;
    }

    @NonNull
    @Override
    public NewViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_new,parent,false);
        return new NewViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull NewViewHolder holder, int position) {
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

    public class NewViewHolder extends RecyclerView.ViewHolder{
        ImageView img;
        TextView textviewtitle,textviewchannel;

        public NewViewHolder(@NonNull View itemView) {
            super(itemView);
            img = (itemView).findViewById(R.id.img_new);
            textviewtitle = (itemView).findViewById(R.id.txtten_new);
            textviewchannel = (itemView).findViewById(R.id.txtgia_new);
            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent intent = new Intent(context,DetailActivity.class);
                    intent.putExtra("detail",sanPhamList.get(getPosition()));
                    context.startActivity(intent);
                }
            });
        }
    }
}
