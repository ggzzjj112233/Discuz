package com.javaweb.dao;

import java.util.ArrayList;

import com.javaweb.model.Smallblock;

public interface ISmallblockDaoable {
	public ArrayList<Smallblock> selectSmallblocks(String where);
}
