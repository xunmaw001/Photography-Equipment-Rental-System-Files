package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.ShangjiazixunDao;
import com.entity.ShangjiazixunEntity;
import com.service.ShangjiazixunService;
import com.entity.vo.ShangjiazixunVO;
import com.entity.view.ShangjiazixunView;

@Service("shangjiazixunService")
public class ShangjiazixunServiceImpl extends ServiceImpl<ShangjiazixunDao, ShangjiazixunEntity> implements ShangjiazixunService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ShangjiazixunEntity> page = this.selectPage(
                new Query<ShangjiazixunEntity>(params).getPage(),
                new EntityWrapper<ShangjiazixunEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ShangjiazixunEntity> wrapper) {
		  Page<ShangjiazixunView> page =new Query<ShangjiazixunView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<ShangjiazixunVO> selectListVO(Wrapper<ShangjiazixunEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ShangjiazixunVO selectVO(Wrapper<ShangjiazixunEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ShangjiazixunView> selectListView(Wrapper<ShangjiazixunEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ShangjiazixunView selectView(Wrapper<ShangjiazixunEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
