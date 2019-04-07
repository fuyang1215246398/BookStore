package com.ustc.instance;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Map<String,CartItem> cartItem=new HashMap<String,CartItem>();
	private int totalPrice;
	private int totalNum;
	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Map<String, CartItem> getCartItem() {
		return cartItem;
	}

	public void setCartItem(Map<String, CartItem> cartItem) {
		this.cartItem = cartItem;
	}

}
