package com.inspur.cmis.base.work.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import com.inspur.cmis.base.work.model.MeetBean;
import com.inspur.cmis.base.work.service.MeetService;
import com.inspur.cmis.permit.login.model.LoginBean;
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
@RequestMapping("/work")
public class WorkController {

	private static final Logger log = LoggerFactory
			.getLogger(WorkController.class);

	@Autowired
	MeetService meetService;
	@Resource
	HttpServletRequest request;

	private Object meet;

	@RequestMapping("/getMeetListByPage")
	public String getMeetListByPage(int pageNo, int pageSize, Model model) {

		Pagination<MeetBean> page = new Pagination<MeetBean>(pageNo, pageSize);
		log.debug("workController getMeetListByPage = " + page);
		// 获取会议记录
		meetService.getMeetListByPage(page);
		request.setAttribute("meetlist", page);
		return "base/work/meet_list";
	}

	// 查询
	@RequestMapping("/getMeetList")
	public String getMeetList(int pageNo, int pageSize, MeetBean meet)
			throws ParseException {
		Pagination<MeetBean> page = new Pagination<MeetBean>(pageNo, pageSize);
		log.debug("workController getMeetListByPage = " + page);

		HashMap hm = new HashMap();
		hm.put("page", page);
		hm.put("meet", meet);
		meetService.getMeetList(hm);

		// 获取会议记录
		// meetService.getMeetListByPage(page);
		request.setAttribute("meetlist", page);
		return "base/work/meet_list";
	}

	@RequestMapping("/addMeet")
	public String addMeet() {
		return "base/work/add_meet";
	}

	// 添加
	@RequestMapping("/addOneMeet")
	public String addOneMeet(MeetBean meet) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String day = meet.getDay();
		Date day_d = sdf.parse(meet.getDay());

		HashMap hm = new HashMap();
		hm.put("theme", meet.getTheme());
		hm.put("day", sdf.parse(meet.getDay()));
		hm.put("personnel", meet.getPersonnel());
		hm.put("attachment", meet.getAttachment());

		meetService.addOneMeet(hm);
		return "base/work/add_meet";
	}

	// System.out.println(day+":"+day_d);
	// LoginBean user = (LoginBean)
	// request.getSession().getAttribute(ConstUtils.USER_SESSION_KEY);
	// String cname = user.getCname();
	// System.out.println(cname);
//修改
	@RequestMapping("/modiMeet")
	public String modiMeet(String ckey) throws ParseException {
		System.out.println(ckey);
		MeetBean meet = meetService.getMeetByKey(ckey);

        request.setAttribute("meet", meet);
		return "base/work/meet_modi";
	}
	
	@RequestMapping("/editMeet")
	public String editMeet(MeetBean meet) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String day = meet.getDay();
		Date day_d = sdf.parse(meet.getDay());

		HashMap hm = new HashMap();
		hm.put("ckey", meet.getCkey());
		hm.put("cmid", meet.getCmid());
		hm.put("theme", meet.getTheme());
		hm.put("day", sdf.parse(meet.getDay()));
		hm.put("personnel", meet.getPersonnel());
		hm.put("attachment", meet.getAttachment());

		meetService.editMeet(hm);
		return "forward:getMeetListByPage?pageNo=1&pageSize=10";
	}
	
	@RequestMapping("/delMeet")
    public String delMeet(String ckey) {
    	// 1,2
    	meetService.delMeet(ckey.substring(1));
    	
    	// forward:转发：调用的是进入页面的请求，本方法的model信息可以传到新页面
    	// redirect 重定向：调用的是进入页面的请求，本方法的model信息不可以传到新页面
    	
        return "forward:getMeetListByPage?pageNo=1&pageSize=10";
    }
}
