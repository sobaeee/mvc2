package service;

import java.util.Collection;

import domain.ListInfos;
import domain.UseHistoryVO;
//interface엔 추상메소드만 올 수 있다. 
public interface ListService {
	
	public ListInfos read(String uid);
}
