package service.inter;

import java.util.List;

import model.Email;
import model.Leave;
import model.User;

public interface IUserService {
	//通过用户名查找User
	User findByName(User user);
	//编辑数据
	Integer updateUser(User user);
	//编辑权限
	Integer updateUserRoot(User user);
	//管理账户
	List<User> findAllUser();
	void insertUser(User user);
	//查找请假
	List<Leave> findLeave(String username);
	//提交请假信息
	void insertLeaveReason(Leave leave);
	//查找对应审批人
	List<Leave> findLeaveByCheckman(String checkman);
	//审核
	void updateStatus(Integer id);
	//不通过
	void updateStatus2(Integer id);
	//发送邮件
	void insertEmail(Email email);
	//接收邮件
	 List<Email> findEmailByreceiveUser(String receiveUser);
	 //更新是删除进入回收站
	void updateIsgarageById(Integer id);
	void updateIsgarageById2(Integer id);
	//垃圾邮件箱操作之彻底删除
	void DeleteEmailReallyById(Integer id);
	//查找没有进入回收站的数据
	List<Email> findAllEmailByIsgarage(Email email);
	//通过id查找指定的邮件（读取功能）
	Email findEmailById(Integer id);
	//更新是否未读状态(查看邮件详细信息后返回邮件列表)
	void updateIsreadById(Integer id);
	List<User> findAllAdmin(Integer isadmin);
	//审核请假详情
	Leave findLeaveById(Integer id);


	
}
