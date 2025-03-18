package com.entity.view;

import com.entity.KouchuyajinEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 扣除押金
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
@TableName("kouchuyajin")
public class KouchuyajinView  extends KouchuyajinEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public KouchuyajinView(){
	}
 
 	public KouchuyajinView(KouchuyajinEntity kouchuyajinEntity){
 	try {
			BeanUtils.copyProperties(this, kouchuyajinEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
