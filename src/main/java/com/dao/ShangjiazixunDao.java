package com.dao;

import com.entity.ShangjiazixunEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ShangjiazixunVO;
import com.entity.view.ShangjiazixunView;


/**
 * 商家咨询
 * 
 * @author 
 * @email 
 * @date 2020-10-09 00:58:00
 */
public interface ShangjiazixunDao extends BaseMapper<ShangjiazixunEntity> {
	
	List<ShangjiazixunVO> selectListVO(@Param("ew") Wrapper<ShangjiazixunEntity> wrapper);
	
	ShangjiazixunVO selectVO(@Param("ew") Wrapper<ShangjiazixunEntity> wrapper);
	
	List<ShangjiazixunView> selectListView(@Param("ew") Wrapper<ShangjiazixunEntity> wrapper);

	List<ShangjiazixunView> selectListView(Pagination page,@Param("ew") Wrapper<ShangjiazixunEntity> wrapper);
	
	ShangjiazixunView selectView(@Param("ew") Wrapper<ShangjiazixunEntity> wrapper);
	
}
