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

import com.entity.LiaotianxinxiEntity;
import com.entity.view.LiaotianxinxiView;

import com.service.LiaotianxinxiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 聊天信息
 * 后端接口
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
@RestController
@RequestMapping("/liaotianxinxi")
public class LiaotianxinxiController {
    @Autowired
    private LiaotianxinxiService liaotianxinxiService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,LiaotianxinxiEntity liaotianxinxi, HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("shangjia")) {
			liaotianxinxi.setShangjiazhanghao((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("yonghu")) {
			liaotianxinxi.setYonghuming((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<LiaotianxinxiEntity> ew = new EntityWrapper<LiaotianxinxiEntity>();
    	PageUtils page = liaotianxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, liaotianxinxi), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,LiaotianxinxiEntity liaotianxinxi, HttpServletRequest request){
        EntityWrapper<LiaotianxinxiEntity> ew = new EntityWrapper<LiaotianxinxiEntity>();
    	PageUtils page = liaotianxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, liaotianxinxi), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( LiaotianxinxiEntity liaotianxinxi){
       	EntityWrapper<LiaotianxinxiEntity> ew = new EntityWrapper<LiaotianxinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( liaotianxinxi, "liaotianxinxi")); 
        return R.ok().put("data", liaotianxinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(LiaotianxinxiEntity liaotianxinxi){
        EntityWrapper< LiaotianxinxiEntity> ew = new EntityWrapper< LiaotianxinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( liaotianxinxi, "liaotianxinxi")); 
		LiaotianxinxiView liaotianxinxiView =  liaotianxinxiService.selectView(ew);
		return R.ok("查询聊天信息成功").put("data", liaotianxinxiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        LiaotianxinxiEntity liaotianxinxi = liaotianxinxiService.selectById(id);
        return R.ok().put("data", liaotianxinxi);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        LiaotianxinxiEntity liaotianxinxi = liaotianxinxiService.selectById(id);
        return R.ok().put("data", liaotianxinxi);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody LiaotianxinxiEntity liaotianxinxi, HttpServletRequest request){
    	liaotianxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(liaotianxinxi);

        liaotianxinxiService.insert(liaotianxinxi);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody LiaotianxinxiEntity liaotianxinxi, HttpServletRequest request){
    	liaotianxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(liaotianxinxi);

        liaotianxinxiService.insert(liaotianxinxi);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody LiaotianxinxiEntity liaotianxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(liaotianxinxi);
        liaotianxinxiService.updateById(liaotianxinxi);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        liaotianxinxiService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<LiaotianxinxiEntity> wrapper = new EntityWrapper<LiaotianxinxiEntity>();
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

		int count = liaotianxinxiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
