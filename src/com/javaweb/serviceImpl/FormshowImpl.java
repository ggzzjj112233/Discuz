package com.javaweb.serviceImpl;

import java.util.ArrayList;
import com.javaweb.dao.IBigblockDaoable;
import com.javaweb.dao.IPostDaoable;
import com.javaweb.dao.IReplyDaoable;
import com.javaweb.dao.ISmallblockDaoable;
import com.javaweb.dao.IUserdateDaoable;
import com.javaweb.daoImpl.BigblockDaoImpl;
import com.javaweb.daoImpl.PostDaoImpl;
import com.javaweb.daoImpl.ReplyDaoImpl;
import com.javaweb.daoImpl.SmallblockDaoImpl;
import com.javaweb.daoImpl.UserdateDaoImpl;
import com.javaweb.model.Bigblock;
import com.javaweb.model.Post;
import com.javaweb.model.Reply;
import com.javaweb.model.Smallblock;
import com.javaweb.model.Userdate;
import com.javaweb.service.Forumshowable;

public class FormshowImpl implements Forumshowable {
	IBigblockDaoable bbd = new BigblockDaoImpl();
	ISmallblockDaoable sbd = new SmallblockDaoImpl();
	IPostDaoable pod = new PostDaoImpl();
	IReplyDaoable rpd = new ReplyDaoImpl();
	IUserdateDaoable udd = new UserdateDaoImpl();
	Smallblock smallblock = new Smallblock();
	Reply reply1 = new Reply();

	@Override
	public ArrayList<Bigblock> getBigblocks() {
		String sql = "";
		ArrayList<Bigblock> bigblocks = bbd.selectBigblocks(sql);
		return bigblocks;
	}

	@Override
	public ArrayList<Smallblock> getSmallblocks() {
		String sql = "";
		ArrayList<Smallblock> smallblocks = sbd.selectSmallblocks(sql);
		for (Smallblock smallblock : smallblocks) {
			int count = getCount(smallblock.getSb_id());
			smallblock.setCount(count);
			int rcount=getRcount(smallblock.getSb_id());
			smallblock.setRcount(rcount);
			Post post = getLastpost(smallblock.getSb_id());
			smallblock.setPost(post);
			Reply reply = getLastReplyTime(smallblock.getPost().getPid());
			smallblock.setReply(reply);
			Userdate userdate = getLastReplayUser(smallblock.getPost().getPid());
			smallblock.setUserdate(userdate);

		}

		return smallblocks;
	}

	@Override
	public int getCount(int sb_id) {
		int i = 0;
		i = pod.getCount(sb_id);
		return i;
	}
	
	@Override
	public int getRcount(int sb_id) {
		int i = 0;
		i = rpd.getRcount(sb_id);
		return i;
	}

	@Override
	public Post getLastpost(int sb_id) {
		Post post = pod.getLastpost(sb_id);
		return post;
	}

	@Override
	public Reply getLastReplyTime(int pid) {
		Reply reply = rpd.getLastReplyTime(pid);
		return reply;
	}

	@Override
	public Userdate getLastReplayUser(int pid) {
		Userdate userdate = udd.getLastReplyUser(pid);
		return userdate;
	}

	

}
