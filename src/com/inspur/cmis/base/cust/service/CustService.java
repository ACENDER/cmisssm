package com.inspur.cmis.base.cust.service;

import com.inspur.cmis.base.cust.mapper.CustDao;
import com.inspur.cmis.base.cust.model.CustBean;
import com.inspur.common.model.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustService {

    @Autowired
    CustDao custDao;

    public void getCustListByPage(Pagination<CustBean> page) {

        custDao.getCustListByPage(page);
    }
}
