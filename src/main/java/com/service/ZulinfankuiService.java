package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ZulinfankuiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ZulinfankuiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ZulinfankuiView;


/**
 * 租赁反馈
 *
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface ZulinfankuiService extends IService<ZulinfankuiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ZulinfankuiVO> selectListVO(Wrapper<ZulinfankuiEntity> wrapper);
   	
   	ZulinfankuiVO selectVO(@Param("ew") Wrapper<ZulinfankuiEntity> wrapper);
   	
   	List<ZulinfankuiView> selectListView(Wrapper<ZulinfankuiEntity> wrapper);
   	
   	ZulinfankuiView selectView(@Param("ew") Wrapper<ZulinfankuiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ZulinfankuiEntity> wrapper);
   	
}

