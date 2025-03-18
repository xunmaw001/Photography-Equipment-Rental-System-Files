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


import com.dao.GuihaitixingDao;
import com.entity.GuihaitixingEntity;
import com.service.GuihaitixingService;
import com.entity.vo.GuihaitixingVO;
import com.entity.view.GuihaitixingView;

@Service("guihaitixingService")
public class GuihaitixingServiceImpl extends ServiceImpl<GuihaitixingDao, GuihaitixingEntity> implements GuihaitixingService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GuihaitixingEntity> page = this.selectPage(
                new Query<GuihaitixingEntity>(params).getPage(),
                new EntityWrapper<GuihaitixingEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<GuihaitixingEntity> wrapper) {
		  Page<GuihaitixingView> page =new Query<GuihaitixingView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<GuihaitixingVO> selectListVO(Wrapper<GuihaitixingEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public GuihaitixingVO selectVO(Wrapper<GuihaitixingEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<GuihaitixingView> selectListView(Wrapper<GuihaitixingEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public GuihaitixingView selectView(Wrapper<GuihaitixingEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
