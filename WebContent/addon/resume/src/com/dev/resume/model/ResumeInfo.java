package com.dev.resume.model;

import com.dev.sys.model.BasicItemInfo;

public class ResumeInfo extends BasicItemInfo {
	public String gender;
	public String country;
	public String company;

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
}
