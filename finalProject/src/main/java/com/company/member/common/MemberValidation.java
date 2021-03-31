package com.company.member.common;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.company.member.service.MemberVO;

//구현못하겠어 일단 킵
public class MemberValidation implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberVO Member = (MemberVO) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", null, "Empty name is now allowed.");
		
		if(Member.getMemberId() == null ||  Member.getMemberId().isEmpty()) {
			errors.rejectValue("memberId", null, "memberId not null");
		}
		if(Member.getEmail() == null ||  Member.getEmail().isEmpty()) {
			errors.rejectValue("email", null, "email not null");
		}
		
	}

}
