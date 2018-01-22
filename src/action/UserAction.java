package action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.Email;
import model.Leave;
import model.User;
import service.UserService;
import service.inter.IUserService;

@Controller
@RequestMapping(value = "/user")
public class UserAction {
	@Autowired
	IUserService ser;

	/*
	 * 转到登录页面
	 */
	@RequestMapping("/tologin.do")
	public String toLogin() {

		return "login";
	}

	/*
	 * 登录
	 */
	@RequestMapping(value = "/login.do", produces = "plain/text;charset=UTF-8")
	@ResponseBody
	public String doLogin(User user, HttpSession session) {

		User findUser = ser.findByName(user);
		if (findUser != null) {
			if (findUser.getPassword().equals(user.getPassword())) {
				// 允许登录
				session.setAttribute("sessionUser", findUser);
				return "1";
			} else {
				return "0";// 校验不通过
			}
		}

		return "0";
	}

	/*
	 * 转到首页
	 */
	@RequestMapping("/toindex.do")
	public String index() {
		return "index";
	}
	// 编辑数据
	// @RequestMapping("/editData.do")
	// public String editData(){
	// return "index";
	// }

	@RequestMapping(value = "/editData.do")
	public String doEditData(User user, HttpSession session) {
		User usersession = (User) session.getAttribute("sessionUser");
		Integer id = usersession.getId();
		user.setId(id);
		Integer updateuser = ser.updateUser(user);

		User findUser = ser.findByName(user);
		session.setAttribute("sessionUser", findUser);
		return "personInfo";

	}

	// 编辑个人权限数据
	@RequestMapping(value = "/editRootData.do")
	public String doEditRootData(User user, HttpSession session) {
		User usersession = (User) session.getAttribute("sessionUser");
		Integer id = usersession.getId();
		user.setId(id);
		Integer updateUserRoot = ser.updateUserRoot(user);

		User findUser = ser.findByName(user);
		session.setAttribute("sessionUser", findUser);
		return "personAccount";

	}

	// 管理账户
	@RequestMapping(value = "/adminAccount.do")
	public String doAdminAccount(User user, HttpSession session) {
		List<User> userList = ser.findAllUser();
		// System.out.println(userList);
		session.setAttribute("allUserSession", userList);
		return "adminAccount";
	}

	// 经理添加个人账户
	@RequestMapping(value = "/addData.do")
	public String doAddData(User user, HttpSession session) {
		System.out.println(user);
		// System.out.println(userList);
		// session.setAttribute("allUserSession", userList);
		ser.insertUser(user);
		List<User> userList = ser.findAllUser();
		session.setAttribute("allUserSession", userList);
		return "adminAccount";
	}

	// 注销
	@RequestMapping(value = "/loginOut.do")
	public String loginOut(HttpSession session) {
		session.invalidate();
		return "login";
	}

	// 跳转至休假信息页面
	@RequestMapping(value = "/forwardLeave.do")
	public String toLeave(Leave leave, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		String username = user.getUsername();
		List<Leave> findLeave = ser.findLeave(username);
		session.setAttribute("leaveSession", findLeave);
		// System.out.println(username);

		return "leave";
	}
	//跳转至申请休假页面
	@RequestMapping(value="/applyLeave.do")
	public String toApplyLeave(User user,HttpSession session){
		Integer isadmin = 1;
		List<User> userlist = ser.findAllAdmin( isadmin);
		session.setAttribute("sessionAdmin", userlist);
		
		return "applyLeave";
	}

	// 提交休假信息
	@RequestMapping(value = "/submitApply.do")
	public String toSubmitApply(Leave leave, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		String username = user.getUsername();
		ser.insertLeaveReason(leave);
		List<Leave> findLeave = ser.findLeave(username);
		session.setAttribute("leaveSession", findLeave);

		return "leave";
	}

	// 审核页面
	@RequestMapping(value = "/forwardCheck.do")
	public String toCheck(Leave leave, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		String checkman = user.getUsername();
		// System.out.println(checkman);
		List<Leave> findAllLeave = ser.findLeaveByCheckman(checkman);
		session.setAttribute("leaveSessionByCheck", findAllLeave);
		// System.out.println(username);

		return "checkLeave";
	}

	// 审核操作
	@RequestMapping(value = "/checkStatus.do")
	public String toCheckStatus(Leave leave, HttpSession session,HttpServletRequest requset) {
		Integer id =Integer.valueOf(requset.getParameter("id"));
		Leave checkleave = ser.findLeaveById(id);
		session.setAttribute("leaveInfo", checkleave);

		return "checkLeaveInfo";
	}
	//审核通过
	@RequestMapping(value = "/checkPass.do")
	public String pass(Leave leave, HttpSession session) {
		List<Leave> leaveStatus = (List<Leave>) session.getAttribute("leaveSessionByCheck");
		for (Leave leave2 : leaveStatus) {
			ser.updateStatus(leave2.getId());
		}
		User user = (User) session.getAttribute("sessionUser");
		String checkman = user.getUsername();
		List<Leave> findAllLeave = ser.findLeaveByCheckman(checkman);
		session.setAttribute("leaveSessionByCheck", findAllLeave);

		return "checkLeave";
	}
	//审核不通过
	@RequestMapping(value = "/checkFail.do")
	public String fail(Leave leave, HttpSession session) {
		List<Leave> leaveStatus = (List<Leave>) session.getAttribute("leaveSessionByCheck");
		for (Leave leave2 : leaveStatus) {
			ser.updateStatus2(leave2.getId());
		}
		User user = (User) session.getAttribute("sessionUser");
		String checkman = user.getUsername();
		List<Leave> findAllLeave = ser.findLeaveByCheckman(checkman);
		session.setAttribute("leaveSessionByCheck", findAllLeave);

		return "checkLeave";
	}

	// 写邮件writeEmail.do
	@RequestMapping(value = "/writeEmail.do")
	public String toWriteEmail(User user, HttpSession session) {
		List<User> userList = ser.findAllUser();
		session.setAttribute("allUserSession", userList);
		List<User> allUserList = (List<User>) session.getAttribute("allUserSession");
		return "writeEmail";
	}

		// 发送邮件,
		@RequestMapping(value = "/sendEmail.do",method=RequestMethod.POST)
		public String toSendEmail(Email email, HttpSession session,MultipartFile file) throws IllegalStateException, IOException {
			User user = (User) session.getAttribute("sessionUser");
			String senduser = user.getUsername();
			email.setSenduser(senduser);	
			 String picName = UUID.randomUUID().toString();
			 // 截取文件的扩展名(如.jpg)
		    String oriName = file.getOriginalFilename();
			    String extName = oriName.substring(oriName.lastIndexOf("."));
			    // 保存文件
			    System.out.println("都是开发"+file);
			    file.transferTo(new File("E:\\upload\\" + picName + extName));
			    email.setFujian(picName + extName);
			ser.insertEmail(email);
			 
			return "writeEmail";
		}
		//收邮件receiveEmail.do
		@RequestMapping(value = "/receiveEmail.do")
		public String toReceiveEmail(User user, HttpSession session) {
			List<Email> findEmail=null;
			User userReceive = (User) session.getAttribute("sessionUser");
			 String receiveUser = userReceive.getUsername();
			 List<Email> findEmailByreceiveUser = (List<Email>) ser.findEmailByreceiveUser(receiveUser);
			for (Email email : findEmailByreceiveUser) {
				Integer isgarage = email.getIsgarage();
				if(isgarage==0) {
					findEmail =ser.findAllEmailByIsgarage(email);
				}
			}
			System.out.println(findEmail);
			 
			 session.setAttribute("sessionEmail", findEmail);
			return "receiveEmail";
		}
		
		//删除邮件（进入回收站）backReceiveEmail.do
				@RequestMapping(value = "/deleteEmail.do")
				public String toDleteEmail(HttpServletRequest request,HttpSession session) {
					Integer id =Integer.valueOf(request.getParameter("id"));
					
						ser.updateIsgarageById(id);
					
					
					
					User userReceive = (User) session.getAttribute("sessionUser");
					 String receiveUser = userReceive.getUsername();
					 List<Email> findEmail = (List<Email>) ser.findEmailByreceiveUser(receiveUser);
					 session.setAttribute("sessionEmail", findEmail);
					return "receiveEmail";
				}
				//垃圾邮件箱garageEmail.do
				@RequestMapping(value = "/garageEmail.do")
				public String toGarageEmail(HttpSession session) {
					List<Email> findGarageEmail=null;
					User userReceive = (User) session.getAttribute("sessionUser");
					 String receiveUser = userReceive.getUsername();
					 List<Email> findEmailByreceiveUser = (List<Email>) ser.findEmailByreceiveUser(receiveUser);
					for (Email email : findEmailByreceiveUser) {
						Integer isgarage = email.getIsgarage();
						if(isgarage==1) {
							findGarageEmail =ser.findAllEmailByIsgarage(email);
						}
					}
					 session.setAttribute("sessionGarageEmail", findGarageEmail);
					return "garageEmail";
				}
				
				//垃圾邮件箱操作之还原reduction.do
				@RequestMapping(value = "/reduction.do")
				public String toReduction(HttpServletRequest request,HttpSession session) {
					Integer id = Integer.valueOf(request.getParameter("id"));
					ser.updateIsgarageById2(id);
					
					
					List<Email> findGarageEmail=null;
					User userReceive = (User) session.getAttribute("sessionUser");
					 String receiveUser = userReceive.getUsername();
					 List<Email> findEmailByreceiveUser = (List<Email>) ser.findEmailByreceiveUser(receiveUser);
					for (Email email : findEmailByreceiveUser) {
						Integer isgarage = email.getIsgarage();
						if(isgarage==1) {
							findGarageEmail =ser.findAllEmailByIsgarage(email);
						}
					}
					 session.setAttribute("sessionGarageEmail", findGarageEmail);
					return "garageEmail";
				}
				//垃圾邮件箱操作之彻底删除deleteEmailreally.do
				@RequestMapping(value = "/deleteEmailreally.do")
				public String toDeleteEmailreally(HttpServletRequest request,HttpSession session) {
					Integer id = Integer.valueOf(request.getParameter("id"));
					ser.DeleteEmailReallyById(id);
					
					
					List<Email> findGarageEmail=null;
					User userReceive = (User) session.getAttribute("sessionUser");
					 String receiveUser = userReceive.getUsername();
					 List<Email> findEmailByreceiveUser = (List<Email>) ser.findEmailByreceiveUser(receiveUser);
					for (Email email : findEmailByreceiveUser) {
						Integer isgarage = email.getIsgarage();
						if(isgarage==1) {
							findGarageEmail =ser.findAllEmailByIsgarage(email);
						}
					}
					 session.setAttribute("sessionGarageEmail", findGarageEmail);
					return "garageEmail";
				}
				//读邮件
				@RequestMapping(value = "/readEmail.do")
				public String toReadEmail(HttpServletRequest request,HttpSession session) {
					Integer id =Integer.valueOf(request.getParameter("id"));
						Email email = ser.findEmailById(id);
						session.setAttribute("sessionEmailInfo", email);
					return "readEmail";
				}
				//查看邮件详细信息后返回邮件列表
				@RequestMapping(value = "/backReceiveEmail.do")
				public String toReveiveEmailAgain(HttpSession session) {
					Email emailBy = (Email) session.getAttribute("sessionEmailInfo");
					Integer id = emailBy.getId();
						ser.updateIsreadById(id);
					return "redirect:receiveEmail.do";
				}
				//文件下载
				 @RequestMapping("/down.do")  
				    public void down(HttpServletRequest request,HttpServletResponse response) throws Exception{  
					 String file = request.getParameter("filename");
				        //模拟文件，myfile.txt为需要下载的文件  
				        String fileName = "E:\\upload\\"+file;  
				        //获取输入流  
				        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));  
				        //假如以中文名下载的话  
				        String filenameDown = file;  
				        //转码，免得文件名中文乱码  
				        filenameDown = URLEncoder.encode(filenameDown,"UTF-8");  
				        //设置文件下载头  
				        response.addHeader("Content-Disposition", "attachment;filename=" + filenameDown);    
				        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
				        response.setContentType("multipart/form-data");   
				        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
				        int len = 0;  
				        while((len = bis.read()) != -1){  
				            out.write(len);  
				            out.flush();  
				        }  
				        out.close();  
				    }  
}
