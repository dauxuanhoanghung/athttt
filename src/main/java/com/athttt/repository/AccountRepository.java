package com.athttt.repository;

import com.athttt.entity.AccountEntity;

public interface AccountRepository extends CommonRepository<AccountEntity> {
	AccountEntity findByUsername(String username);
}
