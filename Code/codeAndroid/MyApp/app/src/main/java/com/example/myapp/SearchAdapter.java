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

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.ArrayList;

import java.text.Normalizer;
import java.util.regex.Pattern;


public class SearchAdapter extends RecyclerView.Adapter<SearchAdapter.ItemHolder> implements Filterable {
    Context context;
    ArrayList<SanPham> arrSanPham;
    private ArrayList<SanPham> arrSanPhamOld;

    public SearchAdapter(Context context, ArrayList<SanPham> arrSanPham) {
        this.context = context;
        this.arrSanPham = arrSanPham;
        this.arrSanPhamOld = arrSanPham;
    }

    @NonNull
    @Override
    public ItemHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_search,null);
        ItemHolder itemHolder = new ItemHolder(view);
        return itemHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull ItemHolder holder, int position) {
        SanPham sp = arrSanPham.get(position);
        holder.txtTen.setText(sp.getName());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.txtGia.setText(decimalFormat.format(sp.getPrice()));
        Picasso.with(context).load(sp.getImage())
                .into(holder.imgSearch);

    }

    @Override
    public int getItemCount() {
        return arrSanPham.size();
    }

    @Override
    public Filter getFilter() {
        return new Filter() {
            @Override
            protected FilterResults performFiltering(CharSequence charSequence) {

                if(SearchActivity.str.isEmpty()){
                    arrSanPham = arrSanPhamOld;
                }else {
                    ArrayList<SanPham> list = new ArrayList<>();
                    for(SanPham sanPham : arrSanPhamOld){
                        if(SearchActivity.doi(sanPham.getName()).toLowerCase().contains(SearchActivity.str.toLowerCase())){
                            list.add(sanPham);
                        }
                    }
                    arrSanPham = list;
                }
                FilterResults results = new FilterResults();
                results.values = arrSanPham;
                return results;
            }

            @Override
            protected void publishResults(CharSequence charSequence, FilterResults filterResults) {
                arrSanPham = (ArrayList<SanPham>) filterResults.values;
                notifyDataSetChanged();
            }
        };
    }

    public class ItemHolder extends RecyclerView.ViewHolder{
        public ImageView imgSearch;
        public TextView txtTen,txtGia;

        public ItemHolder(@NonNull View itemView) {
            super(itemView);
            imgSearch = itemView.findViewById(R.id.img_search);
            txtTen = itemView.findViewById(R.id.txttenspsearch);
            txtGia = itemView.findViewById(R.id.txtgiaspsearch);
            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent i = new Intent(context,DetailActivity.class);
                    i.putExtra("detail",arrSanPham.get(getPosition()));
                    context.startActivity(i);
                }
            });
        }
    }
}
