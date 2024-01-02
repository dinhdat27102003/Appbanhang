package com.example.myapp;

import java.io.Serializable;
import java.util.ArrayList;

public class SanPham implements Serializable {
    private int Id;
    private String name;
    private int price;
    private String image;
    private String description;
    private int idSanpham;


    public SanPham(int id, String name, int price, String image, String description, int idSanpham) {
        Id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.description = description;
        this.idSanpham = idSanpham;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIdSanpham() {
        return idSanpham;
    }

    public void setIdSanpham(int idSanpham) {
        this.idSanpham = idSanpham;
    }
}
