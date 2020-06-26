package com.nl.onl.dtos;

import java.util.Date;

public class MerchantDto {
	
	private int seq;
	private String id;
	private String pay_method;
	private String merchant_uid;
	private int paid_amount;
	private String apply_num;
	private Date regdate;
	
	private String imp_uid;
	
	
	public MerchantDto() {
		super();
		// TODO Auto-generated constructor stub
	}



	public MerchantDto(int seq, String id, String pay_method, String merchant_uid, int paid_amount,
			String apply_num, String imp_uid) {
		super();
		this.seq = seq;
		this.id = id;
		this.pay_method = pay_method;
		this.merchant_uid = merchant_uid;
		this.paid_amount = paid_amount;
		this.apply_num = apply_num;
		this.imp_uid = imp_uid;
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



	public String getPay_method() {
		return pay_method;
	}



	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}



	public String getMerchant_uid() {
		return merchant_uid;
	}



	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}



	public int getPaid_amount() {
		return paid_amount;
	}



	public void setPaid_amount(int paid_amount) {
		this.paid_amount = paid_amount;
	}



	public String getApply_num() {
		return apply_num;
	}



	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}


	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	


	public String getImp_uid() {
		return imp_uid;
	}



	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}



	@Override
	public String toString() {
		return "MerchantDto [seq=" + seq + ", id=" + id + ", pay_method=" + pay_method + ", merchant_uid="
				+ merchant_uid + ", paid_amount=" + paid_amount + ", apply_num=" + apply_num + ", regdate=" + regdate
				+ ", imp_uid=" + imp_uid + "]";
	}

	
	
	
	
}
