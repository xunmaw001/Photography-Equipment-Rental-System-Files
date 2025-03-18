package com.dao;

import com.entity.GuihaitixingEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.GuihaitixingVO;
import com.entity.view.GuihaitixingView;


/**
 * 归还提醒
 * 
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface GuihaitixingDao extends BaseMapper<GuihaitixingEntity> {
	
	List<GuihaitixingVO> selectListVO(@Param("ew") Wrapper<GuihaitixingEntity> wrapper);
	
	GuihaitixingVO selectVO(@Param("ew") Wrapper<GuihaitixingEntity> wrapper);
	
	List<GuihaitixingView> selectListView(@Param("ew") Wrapper<GuihaitixingEntity> wrapper);

	List<GuihaitixingView> selectListView(Pagination page,@Param("ew") Wrapper<GuihaitixingEntity> wrapper);
	
	GuihaitixingView selectView(@Param("ew") Wrapper<GuihaitixingEntity> wrapper);
	
}
