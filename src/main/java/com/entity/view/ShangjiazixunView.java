package com.entity.view;

import com.entity.ShangjiazixunEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 商家咨询
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2020-10-09 00:58:00
 */
@TableName("shangjiazixun")
public class ShangjiazixunView  extends ShangjiazixunEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public ShangjiazixunView(){
	}
 
 	public ShangjiazixunView(ShangjiazixunEntity shangjiazixunEntity){
 	try {
			BeanUtils.copyProperties(this, shangjiazixunEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
