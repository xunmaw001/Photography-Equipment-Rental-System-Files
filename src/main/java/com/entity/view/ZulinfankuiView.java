package com.entity.view;

import com.entity.ZulinfankuiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 租赁反馈
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
@TableName("zulinfankui")
public class ZulinfankuiView  extends ZulinfankuiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public ZulinfankuiView(){
	}
 
 	public ZulinfankuiView(ZulinfankuiEntity zulinfankuiEntity){
 	try {
			BeanUtils.copyProperties(this, zulinfankuiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
