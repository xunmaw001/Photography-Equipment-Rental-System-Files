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


import com.dao.DiscussqicaixinxiDao;
import com.entity.DiscussqicaixinxiEntity;
import com.service.DiscussqicaixinxiService;
import com.entity.vo.DiscussqicaixinxiVO;
import com.entity.view.DiscussqicaixinxiView;

@Service("discussqicaixinxiService")
public class DiscussqicaixinxiServiceImpl extends ServiceImpl<DiscussqicaixinxiDao, DiscussqicaixinxiEntity> implements DiscussqicaixinxiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DiscussqicaixinxiEntity> page = this.selectPage(
                new Query<DiscussqicaixinxiEntity>(params).getPage(),
                new EntityWrapper<DiscussqicaixinxiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DiscussqicaixinxiEntity> wrapper) {
		  Page<DiscussqicaixinxiView> page =new Query<DiscussqicaixinxiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<DiscussqicaixinxiVO> selectListVO(Wrapper<DiscussqicaixinxiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public DiscussqicaixinxiVO selectVO(Wrapper<DiscussqicaixinxiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<DiscussqicaixinxiView> selectListView(Wrapper<DiscussqicaixinxiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DiscussqicaixinxiView selectView(Wrapper<DiscussqicaixinxiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
