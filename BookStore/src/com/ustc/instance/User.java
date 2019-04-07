package com.ustc.instance;

public class User {
private int id;
private String username;
private String password;
private String name;
private String email;
private String telephone;
private int state;
private String activeCode;
public int getState() {
	return state;
}
public void setState(int i) {
	this.state = i;
}
public String getActiveCode() {
	return activeCode;
}
public void setActiveCode(String activeCode) {
	this.activeCode = activeCode;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getTelephone() {
	return telephone;
}
public void setTelephone(String telephone) {
	this.telephone = telephone;
}
public User() {
	// TODO Auto-generated constructor stub
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}
