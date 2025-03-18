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


import com.dao.YajinjiaonaDao;
import com.entity.YajinjiaonaEntity;
import com.service.YajinjiaonaService;
import com.entity.vo.YajinjiaonaVO;
import com.entity.view.YajinjiaonaView;

@Service("yajinjiaonaService")
public class YajinjiaonaServiceImpl extends ServiceImpl<YajinjiaonaDao, YajinjiaonaEntity> implements YajinjiaonaService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<YajinjiaonaEntity> page = this.selectPage(
                new Query<YajinjiaonaEntity>(params).getPage(),
                new EntityWrapper<YajinjiaonaEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<YajinjiaonaEntity> wrapper) {
		  Page<YajinjiaonaView> page =new Query<YajinjiaonaView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<YajinjiaonaVO> selectListVO(Wrapper<YajinjiaonaEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public YajinjiaonaVO selectVO(Wrapper<YajinjiaonaEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<YajinjiaonaView> selectListView(Wrapper<YajinjiaonaEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public YajinjiaonaView selectView(Wrapper<YajinjiaonaEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
