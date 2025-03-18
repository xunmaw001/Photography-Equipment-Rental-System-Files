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

import com.entity.QicaizulinEntity;
import com.entity.view.QicaizulinView;

import com.service.QicaizulinService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 器材租赁
 * 后端接口
 * @author 
 * @email 
 * @date 2020-10-09 07:06:44
 */
@RestController
@RequestMapping("/qicaizulin")
public class QicaizulinController {
    @Autowired
    private QicaizulinService qicaizulinService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,QicaizulinEntity qicaizulin, HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			qicaizulin.setYonghuming((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<QicaizulinEntity> ew = new EntityWrapper<QicaizulinEntity>();
    	PageUtils page = qicaizulinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qicaizulin), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,QicaizulinEntity qicaizulin, HttpServletRequest request){
        EntityWrapper<QicaizulinEntity> ew = new EntityWrapper<QicaizulinEntity>();
    	PageUtils page = qicaizulinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qicaizulin), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( QicaizulinEntity qicaizulin){
       	EntityWrapper<QicaizulinEntity> ew = new EntityWrapper<QicaizulinEntity>();
      	ew.allEq(MPUtil.allEQMapPre( qicaizulin, "qicaizulin")); 
        return R.ok().put("data", qicaizulinService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(QicaizulinEntity qicaizulin){
        EntityWrapper< QicaizulinEntity> ew = new EntityWrapper< QicaizulinEntity>();
 		ew.allEq(MPUtil.allEQMapPre( qicaizulin, "qicaizulin")); 
		QicaizulinView qicaizulinView =  qicaizulinService.selectView(ew);
		return R.ok("查询器材租赁成功").put("data", qicaizulinView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        QicaizulinEntity qicaizulin = qicaizulinService.selectById(id);
        return R.ok().put("data", qicaizulin);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        QicaizulinEntity qicaizulin = qicaizulinService.selectById(id);
        return R.ok().put("data", qicaizulin);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody QicaizulinEntity qicaizulin, HttpServletRequest request){
    	qicaizulin.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(qicaizulin);

        qicaizulinService.insert(qicaizulin);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody QicaizulinEntity qicaizulin, HttpServletRequest request){
    	qicaizulin.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(qicaizulin);

        qicaizulinService.insert(qicaizulin);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody QicaizulinEntity qicaizulin, HttpServletRequest request){
        //ValidatorUtils.validateEntity(qicaizulin);
        qicaizulinService.updateById(qicaizulin);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        qicaizulinService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<QicaizulinEntity> wrapper = new EntityWrapper<QicaizulinEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			wrapper.eq("yonghuming", (String)request.getSession().getAttribute("username"));
		}

		int count = qicaizulinService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
