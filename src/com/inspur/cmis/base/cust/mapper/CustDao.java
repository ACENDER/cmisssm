package com.inspur.cmis.base.cust.mapper;

import com.inspur.cmis.base.cust.model.CustBean;
import com.inspur.common.model.Pagination;

import java.util.List;

public interface CustDao {

    public List<CustBean> getCustListByPage(Pagination<CustBean> page);

}
