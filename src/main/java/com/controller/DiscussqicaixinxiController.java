package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.DiscussqicaixinxiEntity;
import com.entity.view.DiscussqicaixinxiView;

import com.service.DiscussqicaixinxiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 器材信息评论表
 * 后端接口
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
@RestController
@RequestMapping("/discussqicaixinxi")
public class DiscussqicaixinxiController {
    @Autowired
    private DiscussqicaixinxiService discussqicaixinxiService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DiscussqicaixinxiEntity discussqicaixinxi, HttpServletRequest request){

        EntityWrapper<DiscussqicaixinxiEntity> ew = new EntityWrapper<DiscussqicaixinxiEntity>();
    	PageUtils page = discussqicaixinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussqicaixinxi), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,DiscussqicaixinxiEntity discussqicaixinxi, HttpServletRequest request){
        EntityWrapper<DiscussqicaixinxiEntity> ew = new EntityWrapper<DiscussqicaixinxiEntity>();
    	PageUtils page = discussqicaixinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussqicaixinxi), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DiscussqicaixinxiEntity discussqicaixinxi){
       	EntityWrapper<DiscussqicaixinxiEntity> ew = new EntityWrapper<DiscussqicaixinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( discussqicaixinxi, "discussqicaixinxi")); 
        return R.ok().put("data", discussqicaixinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DiscussqicaixinxiEntity discussqicaixinxi){
        EntityWrapper< DiscussqicaixinxiEntity> ew = new EntityWrapper< DiscussqicaixinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( discussqicaixinxi, "discussqicaixinxi")); 
		DiscussqicaixinxiView discussqicaixinxiView =  discussqicaixinxiService.selectView(ew);
		return R.ok("查询器材信息评论表成功").put("data", discussqicaixinxiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DiscussqicaixinxiEntity discussqicaixinxi = discussqicaixinxiService.selectById(id);
        return R.ok().put("data", discussqicaixinxi);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DiscussqicaixinxiEntity discussqicaixinxi = discussqicaixinxiService.selectById(id);
        return R.ok().put("data", discussqicaixinxi);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DiscussqicaixinxiEntity discussqicaixinxi, HttpServletRequest request){
    	discussqicaixinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(discussqicaixinxi);

        discussqicaixinxiService.insert(discussqicaixinxi);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DiscussqicaixinxiEntity discussqicaixinxi, HttpServletRequest request){
    	discussqicaixinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(discussqicaixinxi);

        discussqicaixinxiService.insert(discussqicaixinxi);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody DiscussqicaixinxiEntity discussqicaixinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussqicaixinxi);
        discussqicaixinxiService.updateById(discussqicaixinxi);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        discussqicaixinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<DiscussqicaixinxiEntity> wrapper = new EntityWrapper<DiscussqicaixinxiEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = discussqicaixinxiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
