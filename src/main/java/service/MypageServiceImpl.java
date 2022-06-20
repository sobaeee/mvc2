package service;

import domain.LoginVO;
import domain.MypageDTO;
import mapper.MypageMapper;

public class MypageServiceImpl implements MypageService {
	
	@Override
	public LoginVO read(MypageDTO dto) {
		return new MypageMapper().read(dto);
	}

	@Override
	public void update(LoginVO vo) {
		new MypageMapper().update(vo);
		
	}

	public void insert(LoginVO vo) {
		new MypageMapper().insert(vo);
		
	}


}
