package com.example.coffee_shop.model.cart.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Item> items;

    public Cart(List<Item> items) {
        this.items = items;
    }

    public Cart() {
        this.items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Item getItemById(int id) {
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getProduct().getProductID() == id) {
                return items.get(i);
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuanitity();
    }

    public void addItem(Item item) {
        if (getItemById(item.getProduct().getProductID()) != null) {
            Item m = getItemById(item.getProduct().getProductID());
            m.setQuanitity(m.getQuanitity() + item.getQuanitity());
        } else {
            items.add(item);
        }
    }

    public void removeItem(int id){
        if (getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney(){
        double total =0;
        for (Item i: items) {
            total+=(i.getQuanitity()*i.getProduct().getProductPrice());
        }
        return total;
    }

}
