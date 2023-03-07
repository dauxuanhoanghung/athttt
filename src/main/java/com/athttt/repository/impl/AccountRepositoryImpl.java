package com.athttt.repository.impl;

import com.athttt.converter.AccountConverter;
import com.athttt.entity.AccountEntity;
import com.athttt.repository.AccountRepository;

public class AccountRepositoryImpl extends CommonRepositoryImpl<AccountEntity> implements AccountRepository {

	AccountConverter accountConverter = new AccountConverter();

	@Override
	public AccountEntity findByUsername(String username) {
		// TODO Auto-generated method stub
		String query = "SELECT * FROM account where username = '" + username + "'";
		return super.findByCondition(query).get(0);	
	}

}
