package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.QicaizulinEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.QicaizulinVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.QicaizulinView;


/**
 * 器材租赁
 *
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
public interface QicaizulinService extends IService<QicaizulinEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<QicaizulinVO> selectListVO(Wrapper<QicaizulinEntity> wrapper);
   	
   	QicaizulinVO selectVO(@Param("ew") Wrapper<QicaizulinEntity> wrapper);
   	
   	List<QicaizulinView> selectListView(Wrapper<QicaizulinEntity> wrapper);
   	
   	QicaizulinView selectView(@Param("ew") Wrapper<QicaizulinEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<QicaizulinEntity> wrapper);
   	
}

