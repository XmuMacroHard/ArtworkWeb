package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IPaymentDao;
import cn.edu.xmu.artwork.entity.Payment;
@Repository
public class PaymentDao extends GenericDao implements IPaymentDao{

	@Override
	public Payment findById(long id) {
		Payment payment = null;
		try {
			Query query = getSession().getNamedQuery("Payment.getById");
			query.setParameter("id", id);
			payment = (Payment) query.uniqueResult();
		} catch (Exception e) {
			// TODO: handle exception
		}
		// TODO Auto-generated method stub
		return payment;
	}

	@Override
	public List<Payment> getPaymentsByOrderId(long id) {
		List<Payment> payments = null;
		try {
			Query query = getSession().getNamedQuery("Payment.getByOrderId");
			query.setParameter("id", id);
			payments = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return payments;
	}


	@Override
	public List<Payment> getUnPaidPaymentsByArtistId(long id) {

		List<Payment> payments = null;
		try {
			Query query = getSession().getNamedQuery("Payment.getUnPaiedByOrderId");
			query.setParameter("id", id);
			payments = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return payments;
	}
	
	@Override
	public List<Payment> getPaymentsByUserId(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Payment> getPaymentsByArtistId(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
