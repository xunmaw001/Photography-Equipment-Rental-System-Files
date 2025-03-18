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


import com.dao.ZulinfankuiDao;
import com.entity.ZulinfankuiEntity;
import com.service.ZulinfankuiService;
import com.entity.vo.ZulinfankuiVO;
import com.entity.view.ZulinfankuiView;

@Service("zulinfankuiService")
public class ZulinfankuiServiceImpl extends ServiceImpl<ZulinfankuiDao, ZulinfankuiEntity> implements ZulinfankuiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ZulinfankuiEntity> page = this.selectPage(
                new Query<ZulinfankuiEntity>(params).getPage(),
                new EntityWrapper<ZulinfankuiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ZulinfankuiEntity> wrapper) {
		  Page<ZulinfankuiView> page =new Query<ZulinfankuiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<ZulinfankuiVO> selectListVO(Wrapper<ZulinfankuiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ZulinfankuiVO selectVO(Wrapper<ZulinfankuiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ZulinfankuiView> selectListView(Wrapper<ZulinfankuiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ZulinfankuiView selectView(Wrapper<ZulinfankuiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
