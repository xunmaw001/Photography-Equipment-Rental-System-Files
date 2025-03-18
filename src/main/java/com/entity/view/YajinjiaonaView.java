package com.entity.view;

import com.entity.YajinjiaonaEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 押金缴纳
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
@TableName("yajinjiaona")
public class YajinjiaonaView  extends YajinjiaonaEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public YajinjiaonaView(){
	}
 
 	public YajinjiaonaView(YajinjiaonaEntity yajinjiaonaEntity){
 	try {
			BeanUtils.copyProperties(this, yajinjiaonaEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
