package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ShangjiazixunEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ShangjiazixunVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ShangjiazixunView;


/**
 * 商家咨询
 *
 * @author 
 * @email 
 * @date 2020-10-09 00:58:00
 */
public interface ShangjiazixunService extends IService<ShangjiazixunEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ShangjiazixunVO> selectListVO(Wrapper<ShangjiazixunEntity> wrapper);
   	
   	ShangjiazixunVO selectVO(@Param("ew") Wrapper<ShangjiazixunEntity> wrapper);
   	
   	List<ShangjiazixunView> selectListView(Wrapper<ShangjiazixunEntity> wrapper);
   	
   	ShangjiazixunView selectView(@Param("ew") Wrapper<ShangjiazixunEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ShangjiazixunEntity> wrapper);
   	
}

