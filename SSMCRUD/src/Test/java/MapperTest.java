import com.crud.bean.Department;
import com.crud.bean.Employee;
import com.crud.dao.DepartmentMapper;
import com.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	private Employee employee;
	@Resource
	SqlSession sqlSession;

	@Test
	public void testCRUD(){

//		System.out.println(departmentMapper);
//		departmentMapper.insertSelective(new Department(null,"开发部"));
//		departmentMapper.insertSelective(new Department(null,"市场部"));

//		employeeMapper.insertSelective(new Employee(null,"SherwinXie","M","sherwinxie@foxmail.com",1));
		//3. 批量插入员工，使用可以执行批量操作的sqlSession操作

//		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//		for(int i = 0;i<10;i++) {
//			String name = UUID.randomUUID().toString().substring(0, 5) + i;
//			mapper.insert(new Employee(null,name,"M",name+"@126.com",1));
//		}

	}
}
