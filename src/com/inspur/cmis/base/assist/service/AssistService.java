package com.inspur.cmis.base.assist.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.base.assist.mapper.AssistDao;
import com.inspur.cmis.base.assist.model.AssistBean;
import com.inspur.common.model.Pagination;

@Service
public class AssistService {
	@Autowired
	AssistDao assistDao;

	public void getAssistListByPage(Pagination<AssistBean> page) {
		assistDao.getAssistListByPage(page);
	}

	public void getAssistList(HashMap hm) {
		assistDao.getAssistList(hm);
	}

	public void addOneAssist(HashMap assist) {
		assistDao.addOneAssist(assist);
	}


	public AssistBean getAssistByKey(String ckey) {
		return assistDao.getAssistByKey(ckey);
	}

	public void editAssist(HashMap assist) {
		assistDao.editAssist(assist);
	}

	public void delAssist(String keys) {
		// 1,2->{1,2}
		String[] ckey = keys.split(",");
		assistDao.delAssist(ckey);
	}
}

