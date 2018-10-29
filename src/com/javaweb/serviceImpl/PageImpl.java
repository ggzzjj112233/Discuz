package com.javaweb.serviceImpl;

import com.javaweb.service.Pageable;
import com.javaweb.service.Postable;

public class PageImpl implements Pageable {
	Postable psa = new PostImpl();

	@Override
	public int getPage(int smallid) {
		int page = 0;
		int count = psa.getCount(smallid);
		if (count % 3 == 0) {
			page = count / 3;
		} else{
			page = count / 3 + 1; 
		}
		return page;
	}

}
