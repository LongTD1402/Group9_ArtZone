package com.Group9.ArtZone.Services;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.Group9.ArtZone.Conf.MVCConf;
import com.Group9.ArtZone.Entities.Roles;
import com.Group9.ArtZone.Entities.SaleOrder;
import com.Group9.ArtZone.Entities.Users;
import com.Group9.ArtZone.dto.UsersModel;

@Service
public class UsersService extends BaseService<Users> {
	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Override
	protected Class<Users> clazz() {
		return Users.class;
	}
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
//	@Transactional(rollbackOn = Exception.class)
//	public void saveDefaultImg(MultipartFile default_avatar, MultipartFile default_background) throws Exception {
//		try {
//			if (!isEmptyUploadFile(default_avatar)) {
//				default_avatar.transferTo(
//						new File(MVCConf.ROOT_UPLOAD_PATH + "user/default_avatar/" + default_avatar.getOriginalFilename()));
//			}
//			if (!isEmptyUploadFile(default_background)) {
//				default_background.transferTo(
//						new File(MVCConf.ROOT_UPLOAD_PATH + "user/default_background/" + default_background.getOriginalFilename()));
//			}
//		} catch (Exception e) {
//			throw e;
//		}
//	}
//	@Transactional(rollbackOn = Exception.class)
//	public void editDefaultImg(MultipartFile default_avatar, MultipartFile default_background) throws Exception {
//		File file_avar=new File(MVCConf.ROOT_UPLOAD_PATH+ "user/default_avatar/");
//		File file_bag=new File(MVCConf.ROOT_UPLOAD_PATH+ "user/default_background/");
//		try {
//			if (!isEmptyUploadFile(default_avatar)) {
//				new File(MVCConf.ROOT_UPLOAD_PATH+file_avar.list()).delete();
//				default_avatar.transferTo(
//						new File(MVCConf.ROOT_UPLOAD_PATH + "user/default_avatar/" + default_avatar.getOriginalFilename()));
//			}
//
//			if (!isEmptyUploadFile(default_background)) {
//				new File(MVCConf.ROOT_UPLOAD_PATH + file_bag.list()).delete();
//				default_background.transferTo(
//						new File(MVCConf.ROOT_UPLOAD_PATH + "user/default_background/" + default_background.getOriginalFilename()));
//			}
//		} catch (Exception e) {
//			throw e;
//		}
//	}
	@Transactional(rollbackOn = Exception.class)
	public Users save(Users user, MultipartFile avatar, MultipartFile background) throws Exception {
		try {
			if (!isEmptyUploadFile(avatar)) {
				avatar.transferTo(
						new File(MVCConf.ROOT_UPLOAD_PATH + "user/avatar/" + avatar.getOriginalFilename()));
				user.setAvatar("user/avatar/" + avatar.getOriginalFilename());
			}
			if (!isEmptyUploadFile(background)) {
				background.transferTo(
						new File(MVCConf.ROOT_UPLOAD_PATH + "user/background/" + background.getOriginalFilename()));
				user.setAvatar("user/background/" + background.getOriginalFilename());
			}
			user.setCreatedDate(new Date());
			Users saved = super.saveOrUpdate(user);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}
	@Transactional(rollbackOn = Exception.class)
	public Users saveProfile(Users user) throws Exception {
		try {
			Users userOnDb=super.getById(user.getId());
			user.setPassword(userOnDb.getPassword());
			user.setUsername(userOnDb.getUsername());
			user.setEmail(userOnDb.getEmail());
			user.setDisplayName(userOnDb.getDisplayName());
			user.setUpdatedDate(new Date());
			user.setAvatar(userOnDb.getAvatar());
			user.setCreatedDate(userOnDb.getCreatedDate());
			Users saved = super.saveOrUpdate(user);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Transactional(rollbackOn = Exception.class)
	public Users edit(Users user, MultipartFile avatar, MultipartFile background) throws Exception {
		try {
			Users userOnDb=super.getById(user.getId());
			if (!isEmptyUploadFile(avatar)) {
				new File(MVCConf.ROOT_UPLOAD_PATH + userOnDb.getAvatar()).delete();
				avatar.transferTo(
						new File(MVCConf.ROOT_UPLOAD_PATH + "user/avatar/" + avatar.getOriginalFilename()));
				user.setAvatar("user/avatar/" + avatar.getOriginalFilename());
			} else {
				user.setAvatar(userOnDb.getAvatar());
			}
			if (!isEmptyUploadFile(background)) {
				new File(MVCConf.ROOT_UPLOAD_PATH + userOnDb.getBackground()).delete();
				background.transferTo(
						new File(MVCConf.ROOT_UPLOAD_PATH + "user/background/" + background.getOriginalFilename()));
				user.setBackground("user/background/" + background.getOriginalFilename());
			} else {
				user.setBackground(userOnDb.getBackground());
			}
			user.setUpdatedDate(new Date());
			Users saved = super.saveOrUpdate(user);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}
	
	public Users loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<Users> users = this.executeNativeSql(sql);
		if (users == null || users.size() <= 0) {
			return null;
		}
		return users.get(0);
	}

	public List<Users> searchModel(UsersModel searchUser) {
		String sql = "SELECT * FROM tbl_users u WHERE 1=1";
		
		//tim User theo email
		if (!StringUtils.isEmpty(searchUser.getEmail())) { 
			sql += " and u.email ='"+searchUser.getEmail()+"'";
		}
		
		//tim theo user_id
		if (searchUser.getId()>0) {
			sql += " and u.id ="+searchUser.getId();
		}
		
		return executeNativeSql(sql);
	}
	public void deleteUserRole(Users user, Roles role) {
		String sql="DELETE FROM tbl_users_roles WHERE user_id="+user.getId()+ " and role_id=" +role.getId();
	}
}
