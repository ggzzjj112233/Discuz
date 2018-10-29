package com.javaweb.service;

import java.util.List;

import com.javaweb.model.Smallblock;

public interface Smallblockable {
	public String getSbname(int postid);
	List<Smallblock> getAll();
}
