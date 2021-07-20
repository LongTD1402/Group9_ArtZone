package com.Group9.ArtZone.Services;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.Group9.ArtZone.Conf.MVCConf;
import com.Group9.ArtZone.Entities.Contact;
import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Entities.Product_images;
import com.Group9.ArtZone.Entities.Users;

@Service
public class ContactService extends BaseService<Contact>{
	
	@PersistenceContext
	EntityManager entityManager;
	
	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}
	
	@Transactional(rollbackOn = Exception.class)
	public Contact edit(Contact con) throws Exception {
		try {
			// lay thong tin san pham trong db.
			Contact contactOnDb = super.getById(con.getId());
			con.setEmail(contactOnDb.getEmail());
			con.setFull_name(contactOnDb.getFull_name());
			con.setMessage(contactOnDb.getMessage());
			con.setUpdatedDate(new Date());
			con.setStatus(false);
			Contact saved = super.saveOrUpdate(con);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}
}
