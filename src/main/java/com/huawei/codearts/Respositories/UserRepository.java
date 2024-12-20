package com.huawei.codearts.Respositories;

import org.springframework.data.repository.CrudRepository;
import com.huawei.codearts.Models.User;

public interface UserRepository extends CrudRepository<User, Integer>{}
