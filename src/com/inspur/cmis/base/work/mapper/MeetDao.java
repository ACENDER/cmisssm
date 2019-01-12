package com.inspur.cmis.base.work.mapper;

import java.util.HashMap;
import java.util.List;

import com.inspur.cmis.base.work.model.MeetBean;
import com.inspur.common.model.Pagination;

public interface MeetDao {
	 public List<MeetBean> getMeetListByPage(Pagination<MeetBean> page);
	 public List<MeetBean> getMeetList(HashMap hm);
	 public void addOneMeet(HashMap meet);
	 //查询列表
	 public List getMeetList(MeetBean meeet);
	 public MeetBean getMeetByKey(String ckey);
	 public void editMeet(HashMap meet);
	 public void delMeet(String[] ckey);
}
