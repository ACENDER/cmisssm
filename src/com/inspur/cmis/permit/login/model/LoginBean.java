package com.inspur.cmis.permit.login.model;

/**
 * 登录bean
 */
@org.apache.ibatis.type.Alias(value = "loginBean")
public class LoginBean {

    private String loginName;

    private String loginPass;

    private String cname;

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPass() {
        return loginPass;
    }

    public void setLoginPass(String loginPass) {
        this.loginPass = loginPass;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

}
