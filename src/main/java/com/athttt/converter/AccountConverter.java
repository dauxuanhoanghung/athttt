package com.athttt.converter;

import org.modelmapper.ModelMapper;

import com.athttt.entity.AccountEntity;
import com.athttt.model.AccountModel;

public class AccountConverter extends BaseConverter<AccountEntity> {

	private ModelMapper modelMapper = new ModelMapper();

	@Override
	public AccountModel entityToModel(AccountEntity accountEntity, Class<?> tClass) {

		AccountModel accountModel = modelMapper.map(accountEntity, AccountModel.class);
		accountModel.setId(accountEntity.getId());
		return accountModel;
	}

}
