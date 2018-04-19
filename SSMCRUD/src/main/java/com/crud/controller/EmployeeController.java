package com.crud.controller;

import com.crud.bean.Employee;
import com.crud.bean.Msg;
import com.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;


	/**
	 * 单个id删除和批量删除二合一
	 * 多个id删除用 1-2-3-4 -号隔开
	 * 单个id删除
	 * @Pathvariable：指定从路径中取出id
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg delEmp(@PathVariable("ids") String ids) {
		List<Integer> del_ids = new ArrayList<>();
		if(ids.contains("-")){//批量删除
			String[] str_ids = ids.split("-");
			//ArrayList组装id集合
			for (String id: str_ids) {
				del_ids.add(Integer.parseInt(id));
			}
			employeeService.deleteBatch(del_ids);
		}else {//single del
			Integer id =Integer.parseInt(ids);
			employeeService.delEmp(id);
		}

		return Msg.success();
	}
//	/**
//	 * 单个id删除
//	 * @Pathvariable：指定从路径中取出id
//	 * @param id
//	 * @return
//	 */
//	@RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
//	@ResponseBody
//	public Msg delEmp(@PathVariable("id") Integer id) {
//		employeeService.delEmp(id);
//		return Msg.success();
//	}
	/**
	 *	更新员工
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
	public Msg updateEmp(Employee employee){
		System.out.println("将更新的员工数据"+employee.toString());

		employeeService.updateEmp(employee);
		return Msg.success();
	}
	/**
	 * 根据id获得员工信息
	 * @Pathvariable：指定从路径中取出id
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id) {
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp",employee);
	}


	/**
	 * 检查用户名是否重复
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkUser(@RequestParam("empName")String empName){
		//判断用户名是否符合正则表达式

		String regex = "(^[A-Za-z0-9]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
		if(!empName.matches(regex)) {
			return Msg.fail().add("va_msg", "名字必须是2-5个中文或者6-16位英文数字组合后端校验");
		}

		//判断用户名是否重复
		boolean isCheckUser = employeeService.checkUser(empName);
		if(isCheckUser){
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg","用户名已存在后端校验");
		}


	}

	/**
	 * 员工保存
	 */
	@RequestMapping(value = "/emp",method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee, BindingResult result){
		if(result.hasErrors()){
			Map<String,Object> map =new HashMap<String, Object>();
			//校验失败，返回失败，在模态框中显示错误的校验信息
			List<FieldError> error = result.getFieldErrors();
			for (FieldError fieldError:error
				 ) {
//				System.out.println("错误的字段名："+fieldError.getField());
//				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(),fieldError.getDefaultMessage());
			}

			return Msg.fail().add("errorFields",map);
		}else {
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}

	/**
	 * Ajax Json 处理/emps请求
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
		PageHelper.startPage(pn,5);
		List<Employee> emps = employeeService.getAll();
		//使用PageInfo包装查询后的结果 封装了详细的分页信息 连续传入5页
		PageInfo page = new PageInfo(emps,5);
		return Msg.success().add("pageInfo",page);


	}

	/**
	 * 返回pageinfo对象 页面无状态码
	 * @param pn
	 * @param model
	 * @return
	 */
//	@RequestMapping("/page")
//	@ResponseBody
//	public PageInfo getEmpsWithJsonPage(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//		PageHelper.startPage(pn,5);
//		List<Employee> emps = employeeService.getAll();
//		//使用PageInfo包装查询后的结果 封装了详细的分页信息 连续传入5页
//		PageInfo page = new PageInfo(emps,5);
////		model.addAttribute("pageInfo",page);  不用放在请求域中直接return
//		return page;
//
//
//	}

	/**
	 * 查询员工数据 分页查询
	 * @return 页面
	 */
//	@RequestMapping("/emps")
//	public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//		//查询前调用 传入页码以及分页的size
//		PageHelper.startPage(pn,5);
//	 	List<Employee> emps = employeeService.getAll();
//	 	//使用PageInfo包装查询后的结果 封装了详细的分页信息 连续传入5页
//		PageInfo page = new PageInfo(emps,5);
//		model.addAttribute("pageInfo",page);
//		return "list";
//	}
}
