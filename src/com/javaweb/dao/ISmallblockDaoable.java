package com.javaweb.dao;

import java.util.ArrayList;

import com.javaweb.model.Smallblock;

public interface ISmallblockDaoable {
	public int addSmallblock(Smallblock smallblock);

	public int updateSmallblock(Smallblock smallblock);

	public int deleteSmallblock(int sb_id);

	public Smallblock selectOneSmallblock(String where);

	public ArrayList<Smallblock> selectSmallblocks(String where);
}
