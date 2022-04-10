package com.chinasoft.news.dao;

import java.util.ArrayList;

import com.chinasoft.news.po.Kinds;

public interface IKindsDao {
	//���������������Ҫִ�еķ���(sql���)
	public boolean addKind(String kind);
	public boolean deleteKind(int kid);
	
	//����kid��ѯkname
	public String getKname(int kid);
	//���ݱ�Ų�ѯһ��
	public Kinds getKinds(int kid);
	//��ѯ���з���
	public ArrayList<Kinds> selectKinds();
	
}
