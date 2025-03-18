package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.KouchuyajinEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.KouchuyajinVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.KouchuyajinView;


/**
 * 扣除押金
 *
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface KouchuyajinService extends IService<KouchuyajinEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<KouchuyajinVO> selectListVO(Wrapper<KouchuyajinEntity> wrapper);
   	
   	KouchuyajinVO selectVO(@Param("ew") Wrapper<KouchuyajinEntity> wrapper);
   	
   	List<KouchuyajinView> selectListView(Wrapper<KouchuyajinEntity> wrapper);
   	
   	KouchuyajinView selectView(@Param("ew") Wrapper<KouchuyajinEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<KouchuyajinEntity> wrapper);
   	
}

