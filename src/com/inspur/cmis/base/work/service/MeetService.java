package com.inspur.cmis.base.work.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.base.work.mapper.MeetDao;
import com.inspur.cmis.base.work.model.MeetBean;
import com.inspur.common.model.Pagination;

@Service
public class MeetService {
	@Autowired
	MeetDao meetDao;

	public void getMeetListByPage(Pagination<MeetBean> page) {
		meetDao.getMeetListByPage(page);
	}

	public void getMeetList(HashMap hm) {
		meetDao.getMeetList(hm);
	}

	public void addOneMeet(HashMap meet) {
		meetDao.addOneMeet(meet);
	}

	public MeetBean getMeetByKey(String ckey) {
		return meetDao.getMeetByKey(ckey);
	}

	public void editMeet(HashMap meet) {
		meetDao.editMeet(meet);
	}

	public void delMeet(String keys) {
		// 1,2->{1,2}
		String[] ckey = keys.split(",");
		meetDao.delMeet(ckey);
	}
}
