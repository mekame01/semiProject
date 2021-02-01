package everyBB.common.exception;

import everyBB.common.code.ErrorCode;

public class ToAlertException extends CustomException {
	
	private static final long serialVersionUID = -5468681185567304553L;

	public ToAlertException(ErrorCode error) {
		super(error);
	}
	
	public ToAlertException(ErrorCode error, Exception e) {
		super(error, e);
	}
}
