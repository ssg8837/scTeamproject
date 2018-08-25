package com.scmaster.mapper;

import java.util.List;

import com.scmaster.vo.BabyBook;

public interface BabyBookMapper {

	public void insertBabyBook(BabyBook babyBook);

	public List<BabyBook> selectList();

	public BabyBook selectOne(int boardnum);

}
