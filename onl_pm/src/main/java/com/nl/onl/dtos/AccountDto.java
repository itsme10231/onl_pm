package com.nl.onl.dtos;

public class AccountDto {
	
	private String id;
	private String bank_code;
	private String account_number;
	private String name;
	
	private int tran_amt;
	
	public AccountDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public AccountDto(String id, String bank_code, String account_number, String name, int tran_amt) {
		super();
		this.id = id;
		this.bank_code = bank_code;
		this.account_number = account_number;
		this.name = name;
		this.tran_amt = tran_amt;
	}
	
	



	public AccountDto(String id, String bank_code, String account_number, String name) {
		super();
		this.id = id;
		this.bank_code = bank_code;
		this.account_number = account_number;
		this.name = name;
	}



	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBank_code() {
		return bank_code;
	}
	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	



	public int getTran_amt() {
		return tran_amt;
	}



	public void setTran_amt(int tran_amt) {
		this.tran_amt = tran_amt;
	}



	@Override
	public String toString() {
		return "AccountDto [id=" + id + ", bank_code=" + bank_code + ", account_number=" + account_number + ", name="
				+ name + ", tran_amt=" + tran_amt + "]";
	}



	
	
	
	
	
}
