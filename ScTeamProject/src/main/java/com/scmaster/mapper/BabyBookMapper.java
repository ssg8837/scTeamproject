package com.scmaster.mapper;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BabyBook;

public interface BabyBookMapper {

	public void insertBabyBook(BabyBook babyBook);

	public List<BabyBook> selectList();

	public BabyBook selectOne(int boardnum);

	public Collection<? extends BS_Alarm> selectBabyListLoginNo(Object loginNo);

	public ArrayList<BabyBook> selectBabyBookListLoginNo(Integer loginNo);

}
