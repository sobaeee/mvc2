package service;

import mapper.CouponMapper;

public class CouponServiceImpl implements CouponService {

	@Override
	public String read(String uid) {
		
		return new CouponMapper().read(uid);
	}

}
