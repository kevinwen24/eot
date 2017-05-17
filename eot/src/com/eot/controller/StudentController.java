package com.eot.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.eot.common.Constants;

@Controller
@RequestMapping(Constants.APP_URL_Student_PREFIX)
public class StudentController extends BaseController{
	@RequestMapping(value = "/index", method = {RequestMethod.GET, RequestMethod.POST})
    public String show(
                             @RequestParam(value = "currentPage", defaultValue = "") String currentPage,
                             @RequestParam(value = "pageSize", defaultValue = "") String pageSize,
                             @RequestParam(value = "search", defaultValue = "") String search,
                             @RequestParam(value = "sort", defaultValue = "") String sort
                             ) {
       

       /* if (StringUtil.isEmpty(currentPage) || currentPage.equals("null")) {
            currentPage = "1";
        }

        if (StringUtil.isEmpty(pageSize) || pageSize.equals("null")) {
            pageSize = "10";
        }

        if (!currentPage.matches("[0-9]*") || !pageSize.matches("[0-9]*") ) {
            this.addSession(Constants.FAIL_QUERYQUESTION, "Illegal data format!");
            modelAndView.setView(this.getRedirectView(OES_SHOWQUESTION_PAGE));
            return modelAndView;
        }
        String s = StringUtil.transferString(search);
        Pagination pagination = new Pagination();
        pagination.setCurrentPage(Integer.parseInt(currentPage));
        pagination.setPageSize(Integer.parseInt(pageSize));
        pagination.setSearch(s);
        pagination.setSort(sort);
        if(pagination.getPageSize() > 10) {
            pagination.setPageSize(10);
        }

        List<Question> questions = null;
        try {
            questions = questionService.query(pagination);
        } catch (ServiceException e) {
            this.addSession(Constants.FAIL_QUERYQUESTION, "Illegal data format!");
            modelAndView.setView(this.getRedirectView(OES_SHOWQUESTION_PAGE));
            return modelAndView;
            
        }
        pagination.setSearch(search);
        modelAndView.addObject("questions", questions);
        modelAndView.addObject("pagination", pagination);
        modelAndView.setViewName(OES_show_JSP);*/
        return "index";
    }
}
