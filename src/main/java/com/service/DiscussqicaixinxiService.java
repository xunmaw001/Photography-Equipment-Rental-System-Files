package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscussqicaixinxiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.DiscussqicaixinxiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscussqicaixinxiView;


/**
 * 器材信息评论表
 *
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface DiscussqicaixinxiService extends IService<DiscussqicaixinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DiscussqicaixinxiVO> selectListVO(Wrapper<DiscussqicaixinxiEntity> wrapper);
   	
   	DiscussqicaixinxiVO selectVO(@Param("ew") Wrapper<DiscussqicaixinxiEntity> wrapper);
   	
   	List<DiscussqicaixinxiView> selectListView(Wrapper<DiscussqicaixinxiEntity> wrapper);
   	
   	DiscussqicaixinxiView selectView(@Param("ew") Wrapper<DiscussqicaixinxiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscussqicaixinxiEntity> wrapper);
   	
}

