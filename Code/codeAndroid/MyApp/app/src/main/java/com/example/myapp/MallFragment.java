package com.example.myapp;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.ViewFlipper;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link MallFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class MallFragment extends Fragment {
    private List<SanPham> sanPhamList;
    private RecyclerView recyclerView;
    private MallAdapter mallAdapter;
    private ViewFlipper viewFlipper;

    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    public MallFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment MallFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static MallFragment newInstance(String param1, String param2) {
        MallFragment fragment = new MallFragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View rootView = inflater.inflate(R.layout.fragment_mall, container, false);
        viewFlipper = rootView.findViewById(R.id.viewfliper);
        ActionViewFlipper();
        sanPhamList = genera(load(Server.DuongdanFashion));
        recyclerView = rootView.findViewById(R.id.recyvlerview_mall);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new GridLayoutManager(getActivity(),2));
        mallAdapter = new MallAdapter(sanPhamList,getActivity());
        recyclerView.setAdapter(mallAdapter);

        return rootView;
    }

    private List<SanPham> genera(String a){
        List<SanPham> videoItems = new ArrayList<>();

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
                videoItems.add(new SanPham(Integer.parseInt(id),name,Integer.parseInt(price),image,description,Integer.parseInt(idsanpham)));
            }

        }catch (Exception e){

        }

        return videoItems;
    }

    public String load(String a){
        String urlstr = a;
        String data = "";
        try{
            URL url = new URL(urlstr);
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

    private void ActionViewFlipper() {
        ArrayList<String> mangquangcao = new ArrayList<>();
        mangquangcao.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2O36869GlnGhlHuOGlnflfx3e99XFecjSpOwFzv2UO7vPKAGUkb_IzCQlcR2TLYZYpZ4&usqp=CAU");
        mangquangcao.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNox2k71OtAR7AygGTK7hPVBf2yFeBiIaVJA&usqp=CAU");
        mangquangcao.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUhT2Xgj2-LAjGlPjyL09c-2kT9RAlPfrXJQ&usqp=CAU");
        mangquangcao.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTpLK0UCiIFETkNHVOXP0G-tLo1Vl1YgN_0g&usqp=CAU");
        for(int i = 0;i<mangquangcao.size();i++){
            ImageView imageView = new ImageView(getActivity());
            Picasso.with(getActivity()).load(mangquangcao.get(i)).into(imageView);
            imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            viewFlipper.addView(imageView);
        }

        viewFlipper.setFlipInterval(5000);
        viewFlipper.setAutoStart(true);

        Animation animation_slide_out = AnimationUtils.loadAnimation(getActivity(),R.anim.slide_out_right);

        viewFlipper.setInAnimation(animation_slide_out);

    }
}