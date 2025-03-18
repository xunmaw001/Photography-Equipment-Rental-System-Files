package com.dao;

import com.entity.DiscussqicaixinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DiscussqicaixinxiVO;
import com.entity.view.DiscussqicaixinxiView;


/**
 * 器材信息评论表
 * 
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface DiscussqicaixinxiDao extends BaseMapper<DiscussqicaixinxiEntity> {
	
	List<DiscussqicaixinxiVO> selectListVO(@Param("ew") Wrapper<DiscussqicaixinxiEntity> wrapper);
	
	DiscussqicaixinxiVO selectVO(@Param("ew") Wrapper<DiscussqicaixinxiEntity> wrapper);
	
	List<DiscussqicaixinxiView> selectListView(@Param("ew") Wrapper<DiscussqicaixinxiEntity> wrapper);

	List<DiscussqicaixinxiView> selectListView(Pagination page,@Param("ew") Wrapper<DiscussqicaixinxiEntity> wrapper);
	
	DiscussqicaixinxiView selectView(@Param("ew") Wrapper<DiscussqicaixinxiEntity> wrapper);
	
}
