package com.inspur.cmis.base.assist.model;

import java.util.Date;

@org.apache.ibatis.type.Alias(value = "assistBean")
public class AssistBean {
	private String ckey;	
	private String cmid;
	private String type;
	private String sub;
	private String day;
	private String aunit;
	private String aperson;
	private String remark;
	private String rday;
	private String areason;
	private String attachment;
	private String mday;
	private String mperson;
	
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getAunit() {
		return aunit;
	}
	public void setAunit(String aunit) {
		this.aunit = aunit;
	}
	public String getAperson() {
		return aperson;
	}
	public void setAperson(String aperson) {
		this.aperson = aperson;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRday() {
		return rday;
	}
	public void setRday(String rday) {
		this.rday = rday;
	}
	public String getAreason() {
		return areason;
	}
	public void setAreason(String areason) {
		this.areason = areason;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getMday() {
		return mday;
	}
	public void setMday(String mday) {
		this.mday = mday;
	}
	public String getMperson() {
		return mperson;
	}
	public void setMperson(String mperson) {
		this.mperson = mperson;
	}
	@Override
	public String toString() {
		return "AssistBean [type=" + type + ", sub=" + sub + ", day=" + day + ", aunit=" + aunit + ", aperson=" + aperson + ", remark=" + remark + ", rday=" + rday + ", areason=" + areason + ", attachment=" + attachment + "]";
	}
}