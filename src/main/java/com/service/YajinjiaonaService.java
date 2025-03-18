package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.YajinjiaonaEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.YajinjiaonaVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.YajinjiaonaView;


/**
 * 押金缴纳
 *
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface YajinjiaonaService extends IService<YajinjiaonaEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<YajinjiaonaVO> selectListVO(Wrapper<YajinjiaonaEntity> wrapper);
   	
   	YajinjiaonaVO selectVO(@Param("ew") Wrapper<YajinjiaonaEntity> wrapper);
   	
   	List<YajinjiaonaView> selectListView(Wrapper<YajinjiaonaEntity> wrapper);
   	
   	YajinjiaonaView selectView(@Param("ew") Wrapper<YajinjiaonaEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<YajinjiaonaEntity> wrapper);
   	
}

