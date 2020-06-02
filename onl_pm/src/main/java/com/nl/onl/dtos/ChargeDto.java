package com.nl.onl.dtos;

import java.util.Date;

public class ChargeDto {
	private int seq;
	private String id;
	private int money;
	private Date regdate;
	private int balance;
	private String cancelflag;
	private String type;
	
	private int allbal;
	
	public ChargeDto() {

	}

	public ChargeDto(int seq, String id, int money, Date regdate, int balance, String cancelflag, String type) {
		super();
		this.seq = seq;
		this.id = id;
		this.money = money;
		this.regdate = regdate;
		this.balance = balance;
		this.cancelflag = cancelflag;
		this.type = type;
	}
	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getCancelflag() {
		return cancelflag;
	}

	public void setCancelflag(String cancelflag) {
		this.cancelflag = cancelflag;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getAllbal() {
		return allbal;
	}

	public void setAllbal(int allbal) {
		this.allbal = allbal;
	}

	@Override
	public String toString() {
		return "ChargeDto [seq=" + seq + ", id=" + id + ", money=" + money + ", regdate=" + regdate + ", balance="
				+ balance + ", cancelflag=" + cancelflag + ", type=" + type + ", allbal=" + allbal + "]";
	}
	
	
}
