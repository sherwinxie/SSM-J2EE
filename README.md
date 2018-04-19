# SSM练手项目-CRUD（RESTful）
SSM练手项目,实现一个简单的信息管理系统，即CRUD操作 (RESTful style) 附架构图：
## 系统架构
![业务架构](https://github.com/sherwinxie/SSM_J2EE/blob/master/ImgREADME/main.jpg)


## 效果展示：
![效果图](https://github.com/sherwinxie/SSM_J2EE/blob/master/ImgREADME/display.jpg)


## 功能分解

1. 查询和分页显示
2. 新增员工信息功能
	- 数据校验，需要校验用户名和邮箱是否合法
	- 前端使用jquery校验，后端使用JSR303
3. 修改员工信息功能
4. 单个删除员工
5. 批量删除员工
6. 使用Rest风格的URI

## 技术点
 - 基础框架：SpringMVC+Spring+MyBatis
 - 数据库：MySQL
 - 前端框架：BootStrapUI 
 - 项目依赖管理：Maven
 - 分页：pagehelper（Mybatis的工具）
 - 逆向工程：MyBatis Generator
