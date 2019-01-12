package com.inspur.cmis.base.assist.mapper;

import java.util.HashMap;
import java.util.List;

import com.inspur.cmis.base.assist.model.AssistBean;
import com.inspur.cmis.base.work.model.MeetBean;
import com.inspur.common.model.Pagination;

public interface AssistDao {
	 public List<AssistBean> getAssistListByPage(Pagination<AssistBean> page);
	 public List<AssistBean> getAssistList(HashMap hm);
	 public void addOneAssist(HashMap assist);
	 //查询列表
	 public List getAssistList(AssistBean assist);
	 public AssistBean getAssistByKey(String ckey);
	 public void editAssist(HashMap assist);
	 public void delAssist(String[] ckey);
}
