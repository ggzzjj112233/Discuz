package com.javaweb.dao;

import java.util.ArrayList;

import com.javaweb.model.Bigblock;

public interface IBigblockDaoable {
	public ArrayList<Bigblock> selectBigblocks(String where);
}
