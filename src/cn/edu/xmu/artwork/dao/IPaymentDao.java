package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.Payment;

public interface IPaymentDao {
	public Payment findById(long id);
	public List<Payment> getPaymentsByOrderId(long id);
	public List<Payment> getPaymentsByUserId(long id);
	public List<Payment> getPaymentsByArtistId(long id);
	public List<Payment> getUnPaidPaymentsByArtistId(long id);
}
