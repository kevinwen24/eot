package com.eot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.Constants;
import com.eot.model.CategoryItem;
import com.eot.service.ICategoryItemService;

@Controller
@RequestMapping(Constants.APP_URL_MANAGER)
public class CategoryItemoController {
	
	@Autowired
	public ICategoryItemService categoryItemService;
	
	@RequestMapping(value = "/view_category", method = {RequestMethod.GET})
	public ModelAndView viewCategory(
			) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<CategoryItem> categoryItems = categoryItemService.findAllCategory();
		modelAndView.addObject("categoryItems", categoryItems);
		modelAndView.addObject("forwardPage", "view_category");
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/view_item", method = {RequestMethod.GET})
	public ModelAndView viewItem() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<CategoryItem> items = categoryItemService.findAllItem();
		modelAndView.addObject("items", items);
		modelAndView.addObject("forwardPage", "view_item");
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/update_category", method = {RequestMethod.GET})
	public ModelAndView updateCategory(
										@RequestParam(value="categoryNo") String categoryNo,
										@RequestParam(value="categoryName") String categoryName,
										HttpSession session
										) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<CategoryItem> categoryItems = categoryItemService.findAllCategory();
		modelAndView.addObject("categoryItems", categoryItems);
		modelAndView.addObject("forwardPage", "view_category");
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/update_item", method = {RequestMethod.GET})
	public ModelAndView updateItem(
									@RequestParam(value="itemNo") String itemNo,
									@RequestParam(value="itemName") String itemName,
									@RequestParam(value="categoryNo") int categoryNo,
									HttpSession session
									) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<CategoryItem> items = categoryItemService.findAllItem();
		modelAndView.addObject("items", items);
		modelAndView.addObject("forwardPage", "view_item");
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/add_category", method = {RequestMethod.POST})
	public ModelAndView addCategory(
									@RequestParam(value="categoryName") String categoryName,
									HttpSession session
									) {
		ModelAndView modelAndView = new ModelAndView("redirct:/page/manager/view_category");
		
		try{
			categoryItemService.addCategory(categoryName);
			session.setAttribute("fail_message", "成功添加一条评教分类!");
		}catch (Exception e) {
			session.setAttribute("fail_message", "添加评教分类失败!");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/add_item", method = {RequestMethod.POST})
	public ModelAndView addItem(
								@RequestParam(value="itemName") String itemName,
								@RequestParam(value="categoryNo") int categoryNo,
								HttpSession session
								) {
		ModelAndView modelAndView = new ModelAndView("redirct:/page/manager/view_item");
		
		try{
			categoryItemService.addItem(categoryNo, itemName);
			session.setAttribute("fail_message", "成功添加一条评教项!");
		}catch (Exception e) {
			session.setAttribute("fail_message", "添加评教项失败!");
		}
		return modelAndView;
	}
}
