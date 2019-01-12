package com.inspur.cmis.base.work.model;


@org.apache.ibatis.type.Alias(value = "meetBean")
public class MeetBean {
	private String ckey;
	private String cmid;
	private String day;
	private String personnel;
	private String theme;
	private String attachment;

	public String getCkey() {
		return ckey;
	}

	public void setCkey(String ckey) {
		this.ckey = ckey;
	}

	public String getCmid() {
		return cmid;
	}

	public void setCmid(String cmid) {
		this.cmid = cmid;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getPersonnel() {
		return personnel;
	}

	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	@Override
	public String toString() {
		return "MeetBean [day=" + day + ", personnel=" + personnel + ", theme="
				+ theme + ", attachment=" + attachment + "]";
	}

}
