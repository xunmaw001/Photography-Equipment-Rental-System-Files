package com.dao;

import com.entity.KouchuyajinEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.KouchuyajinVO;
import com.entity.view.KouchuyajinView;


/**
 * 扣除押金
 * 
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface KouchuyajinDao extends BaseMapper<KouchuyajinEntity> {
	
	List<KouchuyajinVO> selectListVO(@Param("ew") Wrapper<KouchuyajinEntity> wrapper);
	
	KouchuyajinVO selectVO(@Param("ew") Wrapper<KouchuyajinEntity> wrapper);
	
	List<KouchuyajinView> selectListView(@Param("ew") Wrapper<KouchuyajinEntity> wrapper);

	List<KouchuyajinView> selectListView(Pagination page,@Param("ew") Wrapper<KouchuyajinEntity> wrapper);
	
	KouchuyajinView selectView(@Param("ew") Wrapper<KouchuyajinEntity> wrapper);
	
}
