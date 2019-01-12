package com.inspur.cmis.permit.login.service;

import com.inspur.cmis.permit.login.mapper.LoginDao;
import com.inspur.cmis.permit.login.model.LoginBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    LoginDao loginDao;

    public LoginBean userLogin(LoginBean bean) {
        return loginDao.userLogin(bean);
    }
}
