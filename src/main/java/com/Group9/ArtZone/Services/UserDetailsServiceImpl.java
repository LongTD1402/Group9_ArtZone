package com.Group9.ArtZone.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.Group9.ArtZone.Entities.Users;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
	@Autowired 
	UsersService usersService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users user = usersService.loadUserByUsername(username);
		return user;
	}
}
