package com.dao;

import com.entity.QicaizulinEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.QicaizulinVO;
import com.entity.view.QicaizulinView;


/**
 * 器材租赁
 * 
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface QicaizulinDao extends BaseMapper<QicaizulinEntity> {
	
	List<QicaizulinVO> selectListVO(@Param("ew") Wrapper<QicaizulinEntity> wrapper);
	
	QicaizulinVO selectVO(@Param("ew") Wrapper<QicaizulinEntity> wrapper);
	
	List<QicaizulinView> selectListView(@Param("ew") Wrapper<QicaizulinEntity> wrapper);

	List<QicaizulinView> selectListView(Pagination page,@Param("ew") Wrapper<QicaizulinEntity> wrapper);
	
	QicaizulinView selectView(@Param("ew") Wrapper<QicaizulinEntity> wrapper);
	
}
