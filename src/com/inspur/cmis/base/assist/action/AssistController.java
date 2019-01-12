package com.inspur.cmis.base.assist.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import com.inspur.cmis.base.assist.model.AssistBean;
import com.inspur.cmis.base.assist.service.AssistService;
import com.inspur.cmis.base.work.model.MeetBean;
import com.inspur.common.model.Pagination;
import com.inspur.common.util.ConstUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/assist")
public class AssistController {

    private static final Logger log = LoggerFactory.getLogger(AssistController.class);

	private static final Object assist = null;

    @Autowired
    AssistService assistService;

//
//奖惩页面
    @RequestMapping("/getAssistListByPage")
    public String getAssistListByPage(int pageNo, int pageSize, Model model) {

		Pagination<AssistBean> page = new Pagination<AssistBean>(pageNo, pageSize);
		log.debug("assistController getAssistListByPage = " + page);
		// 获取会议记录
		assistService.getAssistListByPage(page);
		request.setAttribute("assistlist", page);
		return "base/assist/assist_list";
	}

    
    
    
 //查询  
@RequestMapping("/getAssistList")
public String getAssistList(int pageNo, int pageSize, AssistBean assist)
		throws ParseException {
	Pagination<AssistBean> page = new Pagination<AssistBean>(pageNo, pageSize);
	log.debug("assistController getAssistListByPage = " + page);

	HashMap hm = new HashMap();
	hm.put("page", page);
	hm.put("assist",assist);
	assistService.getAssistList(hm);

	// 获取会议记录
	// assistService.getAssistListByPage(page);
	request.setAttribute("assistlist", page);
	return "base/assist/assist_list";
}


@RequestMapping("/addAssist")
public String addAssist() {
	return "base/assist/assist_add";
}

// 添加
@RequestMapping("/addOneAssist")
public String addOneAssist(AssistBean assist) throws ParseException {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	String day = assist.getDay();
	Date day_d = sdf.parse(assist.getDay());

	HashMap hm = new HashMap();
	hm.put("ckey", assist.getCkey());
	hm.put("cmid",assist.getCmid());
	hm.put("type",assist.getType());
	hm.put("sub",assist.getSub());
	hm.put("day", sdf.parse(assist.getDay()));
	hm.put("aunit",assist.getAunit());
	hm.put("aperson",assist.getAperson());
	hm.put("rday", sdf.parse(assist.getRday()));
	hm.put("areason",assist.getAreason());
	hm.put("remark",assist.getRemark());
	hm.put("attachment",assist.getAttachment());
	assistService.addOneAssist(hm);
	return "base/assist/assist_add";
}
@RequestMapping("/modiAssist")
public String modiAssist(String ckey) throws ParseException {
	System.out.println(ckey);
	AssistBean assist = assistService.getAssistByKey(ckey);

    request.setAttribute("assist", assist);
	return "base/assist/assist_modi";
}
//修改
@RequestMapping("/editAssist")
public String editAssist(AssistBean assist) throws ParseException {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	String day = assist.getDay();
	Date day_d = sdf.parse(assist.getDay());

	HashMap hm = new HashMap();
	hm.put("ckey", assist.getCkey());
	hm.put("cmid",assist.getCmid());
	hm.put("type",assist.getType());
	hm.put("sub",assist.getSub());
	hm.put("day", sdf.parse(assist.getDay()));
	hm.put("aunit",assist.getAunit());
	hm.put("aperson",assist.getAperson());
	hm.put("rday", sdf.parse(assist.getRday()));
	hm.put("areason",assist.getAreason());
	hm.put("remark",assist.getRemark());
	hm.put("attachment",assist.getAttachment());
	assistService.editAssist(hm);
	
	return "forward:getAssistListByPage?pageNo=1&pageSize=10";
}
//删除
@RequestMapping("/delAssist")
public String delAssist(String ckey) {
	// 1,2
	assistService.delAssist(ckey.substring(1));
	
	// forward:转发：调用的是进入页面的请求，本方法的model信息可以传到新页面
	// redirect 重定向：调用的是进入页面的请求，本方法的model信息不可以传到新页面
	
    return "forward:getAssistListByPage?pageNo=1&pageSize=10";
}
}