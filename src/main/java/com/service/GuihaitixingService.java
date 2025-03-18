package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.GuihaitixingEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.GuihaitixingVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.GuihaitixingView;


/**
 * 归还提醒
 *
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface GuihaitixingService extends IService<GuihaitixingEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<GuihaitixingVO> selectListVO(Wrapper<GuihaitixingEntity> wrapper);
   	
   	GuihaitixingVO selectVO(@Param("ew") Wrapper<GuihaitixingEntity> wrapper);
   	
   	List<GuihaitixingView> selectListView(Wrapper<GuihaitixingEntity> wrapper);
   	
   	GuihaitixingView selectView(@Param("ew") Wrapper<GuihaitixingEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<GuihaitixingEntity> wrapper);
   	
}

