package com.dao;

import com.entity.YajinjiaonaEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.YajinjiaonaVO;
import com.entity.view.YajinjiaonaView;


/**
 * 押金缴纳
 * 
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface YajinjiaonaDao extends BaseMapper<YajinjiaonaEntity> {
	
	List<YajinjiaonaVO> selectListVO(@Param("ew") Wrapper<YajinjiaonaEntity> wrapper);
	
	YajinjiaonaVO selectVO(@Param("ew") Wrapper<YajinjiaonaEntity> wrapper);
	
	List<YajinjiaonaView> selectListView(@Param("ew") Wrapper<YajinjiaonaEntity> wrapper);

	List<YajinjiaonaView> selectListView(Pagination page,@Param("ew") Wrapper<YajinjiaonaEntity> wrapper);
	
	YajinjiaonaView selectView(@Param("ew") Wrapper<YajinjiaonaEntity> wrapper);
	
}
