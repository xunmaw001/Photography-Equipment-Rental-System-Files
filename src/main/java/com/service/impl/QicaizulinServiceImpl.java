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


import com.dao.QicaizulinDao;
import com.entity.QicaizulinEntity;
import com.service.QicaizulinService;
import com.entity.vo.QicaizulinVO;
import com.entity.view.QicaizulinView;

@Service("qicaizulinService")
public class QicaizulinServiceImpl extends ServiceImpl<QicaizulinDao, QicaizulinEntity> implements QicaizulinService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<QicaizulinEntity> page = this.selectPage(
                new Query<QicaizulinEntity>(params).getPage(),
                new EntityWrapper<QicaizulinEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<QicaizulinEntity> wrapper) {
		  Page<QicaizulinView> page =new Query<QicaizulinView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<QicaizulinVO> selectListVO(Wrapper<QicaizulinEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public QicaizulinVO selectVO(Wrapper<QicaizulinEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<QicaizulinView> selectListView(Wrapper<QicaizulinEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public QicaizulinView selectView(Wrapper<QicaizulinEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
