package com.dao;

import com.entity.ZulinfankuiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ZulinfankuiVO;
import com.entity.view.ZulinfankuiView;


/**
 * 租赁反馈
 * 
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface ZulinfankuiDao extends BaseMapper<ZulinfankuiEntity> {
	
	List<ZulinfankuiVO> selectListVO(@Param("ew") Wrapper<ZulinfankuiEntity> wrapper);
	
	ZulinfankuiVO selectVO(@Param("ew") Wrapper<ZulinfankuiEntity> wrapper);
	
	List<ZulinfankuiView> selectListView(@Param("ew") Wrapper<ZulinfankuiEntity> wrapper);

	List<ZulinfankuiView> selectListView(Pagination page,@Param("ew") Wrapper<ZulinfankuiEntity> wrapper);
	
	ZulinfankuiView selectView(@Param("ew") Wrapper<ZulinfankuiEntity> wrapper);
	
}
