package com.inspur.cmis.base.cust.action;

import com.inspur.cmis.base.cust.model.CustBean;
import com.inspur.cmis.base.cust.service.CustService;
import com.inspur.common.model.Pagination;
import com.inspur.common.util.ConstUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/cust")
public class CustController {

    private static final Logger log = LoggerFactory.getLogger(CustController.class);

    @Autowired
    CustService custService;
    @Resource
    HttpServletRequest request;

    @RequestMapping("/getCustListByPage")
    public String getCustListByPage(int pageNo,int pageSize, Model model) {

        Pagination<CustBean> page = new Pagination<CustBean>(pageNo, pageSize);
        log.debug("CustController getCustListByPage = "+page);
        custService.getCustListByPage(page);
        request.setAttribute("custlist", page);
        return "base/cust/cust_list";
    }
}
