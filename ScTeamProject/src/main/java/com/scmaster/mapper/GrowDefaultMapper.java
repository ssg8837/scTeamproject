package com.scmaster.mapper;

import java.util.List;

import com.scmaster.vo.Grow_Default;

public interface GrowDefaultMapper {

	public List<Grow_Default> showDefaultValueFemale();		//표준값 -여아 
	public List<Grow_Default> showDefaultValueMale();		//표준값 -남아 
	public List<Grow_Default> showDefaultValueFemaleBMI();	//표준값 -여아 (BMI) 
	public List<Grow_Default> showDefaultValueMaleBMI();	//표준값 -남아  (BMI)
}
