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

import com.entity.ShangjiazixunEntity;
import com.entity.view.ShangjiazixunView;

import com.service.ShangjiazixunService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 商家咨询
 * 后端接口
 * @author 
 * @email 
 * @date 2020-10-09 00:58:00
 */
@RestController
@RequestMapping("/shangjiazixun")
public class ShangjiazixunController {
    @Autowired
    private ShangjiazixunService shangjiazixunService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,ShangjiazixunEntity shangjiazixun, HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("shangjia")) {
			shangjiazixun.setShangjiazhanghao((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("yonghu")) {
			shangjiazixun.setYonghuming((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<ShangjiazixunEntity> ew = new EntityWrapper<ShangjiazixunEntity>();
    	PageUtils page = shangjiazixunService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, shangjiazixun), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,ShangjiazixunEntity shangjiazixun, HttpServletRequest request){
        EntityWrapper<ShangjiazixunEntity> ew = new EntityWrapper<ShangjiazixunEntity>();
    	PageUtils page = shangjiazixunService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, shangjiazixun), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( ShangjiazixunEntity shangjiazixun){
       	EntityWrapper<ShangjiazixunEntity> ew = new EntityWrapper<ShangjiazixunEntity>();
      	ew.allEq(MPUtil.allEQMapPre( shangjiazixun, "shangjiazixun")); 
        return R.ok().put("data", shangjiazixunService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ShangjiazixunEntity shangjiazixun){
        EntityWrapper< ShangjiazixunEntity> ew = new EntityWrapper< ShangjiazixunEntity>();
 		ew.allEq(MPUtil.allEQMapPre( shangjiazixun, "shangjiazixun")); 
		ShangjiazixunView shangjiazixunView =  shangjiazixunService.selectView(ew);
		return R.ok("查询商家咨询成功").put("data", shangjiazixunView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        ShangjiazixunEntity shangjiazixun = shangjiazixunService.selectById(id);
        return R.ok().put("data", shangjiazixun);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        ShangjiazixunEntity shangjiazixun = shangjiazixunService.selectById(id);
        return R.ok().put("data", shangjiazixun);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ShangjiazixunEntity shangjiazixun, HttpServletRequest request){
    	shangjiazixun.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(shangjiazixun);

        shangjiazixunService.insert(shangjiazixun);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ShangjiazixunEntity shangjiazixun, HttpServletRequest request){
    	shangjiazixun.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(shangjiazixun);

        shangjiazixunService.insert(shangjiazixun);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ShangjiazixunEntity shangjiazixun, HttpServletRequest request){
        //ValidatorUtils.validateEntity(shangjiazixun);
        shangjiazixunService.updateById(shangjiazixun);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        shangjiazixunService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<ShangjiazixunEntity> wrapper = new EntityWrapper<ShangjiazixunEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("shangjia")) {
			wrapper.eq("shangjiazhanghao", (String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("yonghu")) {
			wrapper.eq("yonghuming", (String)request.getSession().getAttribute("username"));
		}

		int count = shangjiazixunService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
