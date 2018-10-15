package com.javaweb.service;
import java.util.ArrayList;
import com.javaweb.model.Bigblock;
import com.javaweb.model.Post;
import com.javaweb.model.Reply;
import com.javaweb.model.Smallblock;
import com.javaweb.model.Userdate;;
public interface Forumshowable {
	ArrayList<Bigblock> getBigblocks();
	ArrayList<Smallblock> getSmallblocks();
	int getCount(int sb_id);
	int getRcount(int sb_id);
	Post getLastpost(int sb_id);
	Reply getLastReplyTime(int pid);
	Userdate getLastReplayUser(int pid);
}
