package com.javaweb.dao;

import java.util.ArrayList;

import com.javaweb.model.Bigblock;

public interface IBigblockDaoable {

	public int addBigblock(Bigblock bigblock);

	public int updateBigblock(Bigblock bigblock);

	public int deleteBigblock(int bb_id);

	public Bigblock selectOneBigblock(String where);

	public ArrayList<Bigblock> selectBigblocks(String where);
}
