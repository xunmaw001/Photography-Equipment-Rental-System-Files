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


import com.dao.KouchuyajinDao;
import com.entity.KouchuyajinEntity;
import com.service.KouchuyajinService;
import com.entity.vo.KouchuyajinVO;
import com.entity.view.KouchuyajinView;

@Service("kouchuyajinService")
public class KouchuyajinServiceImpl extends ServiceImpl<KouchuyajinDao, KouchuyajinEntity> implements KouchuyajinService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<KouchuyajinEntity> page = this.selectPage(
                new Query<KouchuyajinEntity>(params).getPage(),
                new EntityWrapper<KouchuyajinEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<KouchuyajinEntity> wrapper) {
		  Page<KouchuyajinView> page =new Query<KouchuyajinView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<KouchuyajinVO> selectListVO(Wrapper<KouchuyajinEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public KouchuyajinVO selectVO(Wrapper<KouchuyajinEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<KouchuyajinView> selectListView(Wrapper<KouchuyajinEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public KouchuyajinView selectView(Wrapper<KouchuyajinEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
