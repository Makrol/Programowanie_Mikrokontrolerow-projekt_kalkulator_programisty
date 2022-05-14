
_detectOneEnterClick:

;MyProject.c,36 :: 		int detectOneEnterClick(){
;MyProject.c,37 :: 		if(PORTA.B4 ==0b1){
	BTFSS      PORTA+0, 4
	GOTO       L_detectOneEnterClick0
;MyProject.c,38 :: 		if(enterPushed == 0){
	MOVF       _enterPushed+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_detectOneEnterClick1
;MyProject.c,39 :: 		enterPushed = 1;
	MOVLW      1
	MOVWF      _enterPushed+0
;MyProject.c,40 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_detectOneEnterClick
;MyProject.c,41 :: 		}
L_detectOneEnterClick1:
;MyProject.c,42 :: 		}else{
	GOTO       L_detectOneEnterClick2
L_detectOneEnterClick0:
;MyProject.c,43 :: 		enterPushed = 0;
	CLRF       _enterPushed+0
;MyProject.c,44 :: 		}
L_detectOneEnterClick2:
;MyProject.c,45 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,46 :: 		}
L_end_detectOneEnterClick:
	RETURN
; end of _detectOneEnterClick

_choseMode:

;MyProject.c,47 :: 		void choseMode(){
;MyProject.c,48 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,49 :: 		while(1){
L_choseMode3:
;MyProject.c,51 :: 		if(Keypad_Key_Click()==1){
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_choseMode5
;MyProject.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,53 :: 		modeIndex++;
	INCF       _modeIndex+0, 1
;MyProject.c,54 :: 		if(modeIndex>2){
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      _modeIndex+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_choseMode6
;MyProject.c,55 :: 		modeIndex=0;
	CLRF       _modeIndex+0
;MyProject.c,56 :: 		}
L_choseMode6:
;MyProject.c,57 :: 		}
	GOTO       L_choseMode7
L_choseMode5:
;MyProject.c,58 :: 		else if(detectOneEnterClick()){
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_choseMode8
;MyProject.c,59 :: 		return;
	GOTO       L_end_choseMode
;MyProject.c,60 :: 		}
L_choseMode8:
L_choseMode7:
;MyProject.c,61 :: 		Lcd_Out(1,1,modes[3]);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _modes+18
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,62 :: 		switch(modeIndex){
	GOTO       L_choseMode9
;MyProject.c,63 :: 		case 0:
L_choseMode11:
;MyProject.c,64 :: 		Lcd_Out(2,1,modes[0]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _modes+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,65 :: 		break;
	GOTO       L_choseMode10
;MyProject.c,66 :: 		case 1:
L_choseMode12:
;MyProject.c,67 :: 		Lcd_Out(2,1,modes[1]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _modes+6
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,68 :: 		break;
	GOTO       L_choseMode10
;MyProject.c,69 :: 		case 2:
L_choseMode13:
;MyProject.c,70 :: 		Lcd_Out(2,1,modes[2]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _modes+12
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,71 :: 		break;
	GOTO       L_choseMode10
;MyProject.c,74 :: 		}
L_choseMode9:
	MOVF       _modeIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_choseMode11
	MOVF       _modeIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_choseMode12
	MOVF       _modeIndex+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_choseMode13
L_choseMode10:
;MyProject.c,75 :: 		}
	GOTO       L_choseMode3
;MyProject.c,77 :: 		}
L_end_choseMode:
	RETURN
; end of _choseMode

_setType:

;MyProject.c,78 :: 		int setType(char title[],int index){
;MyProject.c,79 :: 		if(Keypad_Key_Click()==1){
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_setType14
;MyProject.c,80 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,81 :: 		dataTypeIndex[index]++;
	MOVF       FARG_setType_index+0, 0
	MOVWF      R0+0
	MOVF       FARG_setType_index+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _dataTypeIndex+0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;MyProject.c,82 :: 		if(dataTypeIndex[index]>3){
	MOVF       FARG_setType_index+0, 0
	MOVWF      R0+0
	MOVF       FARG_setType_index+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _dataTypeIndex+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setType159
	MOVF       R1+0, 0
	SUBLW      3
L__setType159:
	BTFSC      STATUS+0, 0
	GOTO       L_setType15
;MyProject.c,83 :: 		dataTypeIndex[index]=0;
	MOVF       FARG_setType_index+0, 0
	MOVWF      R0+0
	MOVF       FARG_setType_index+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _dataTypeIndex+0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;MyProject.c,84 :: 		}
L_setType15:
;MyProject.c,85 :: 		}
	GOTO       L_setType16
L_setType14:
;MyProject.c,86 :: 		else if(detectOneEnterClick()){
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_setType17
;MyProject.c,87 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_setType
;MyProject.c,88 :: 		}
L_setType17:
L_setType16:
;MyProject.c,89 :: 		Lcd_Out(1,1,title);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG_setType_title+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,90 :: 		Lcd_Out(2,1,dataTypes[dataTypeIndex[index]]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG_setType_index+0, 0
	MOVWF      R0+0
	MOVF       FARG_setType_index+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _dataTypeIndex+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R3+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _dataTypes+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,91 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,92 :: 		}
L_end_setType:
	RETURN
; end of _setType

_choseDataTypes:

;MyProject.c,93 :: 		void choseDataTypes(){
;MyProject.c,94 :: 		if(modeIndex==0||modeIndex==2){
	MOVF       _modeIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__choseDataTypes154
	MOVF       _modeIndex+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__choseDataTypes154
	GOTO       L_choseDataTypes20
L__choseDataTypes154:
;MyProject.c,95 :: 		while(!setType("IN TYPE:",0));
L_choseDataTypes21:
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_setType_title+0
	CLRF       FARG_setType_index+0
	CLRF       FARG_setType_index+1
	CALL       _setType+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_choseDataTypes22
	GOTO       L_choseDataTypes21
L_choseDataTypes22:
;MyProject.c,96 :: 		}
	GOTO       L_choseDataTypes23
L_choseDataTypes20:
;MyProject.c,98 :: 		while(!setType("IN TYPE:",0));
L_choseDataTypes24:
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_setType_title+0
	CLRF       FARG_setType_index+0
	CLRF       FARG_setType_index+1
	CALL       _setType+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_choseDataTypes25
	GOTO       L_choseDataTypes24
L_choseDataTypes25:
;MyProject.c,99 :: 		while(!setType("OUT TYPE:",1));
L_choseDataTypes26:
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_setType_title+0
	MOVLW      1
	MOVWF      FARG_setType_index+0
	MOVLW      0
	MOVWF      FARG_setType_index+1
	CALL       _setType+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_choseDataTypes27
	GOTO       L_choseDataTypes26
L_choseDataTypes27:
;MyProject.c,101 :: 		}
L_choseDataTypes23:
;MyProject.c,103 :: 		}
L_end_choseDataTypes:
	RETURN
; end of _choseDataTypes

_loadNumValue:

;MyProject.c,104 :: 		int loadNumValue(int type){
;MyProject.c,105 :: 		int tmp=0;
	CLRF       loadNumValue_tmp_L0+0
	CLRF       loadNumValue_tmp_L0+1
	MOVLW      1
	MOVWF      loadNumValue_val_L0+0
	MOVLW      0
	MOVWF      loadNumValue_val_L0+1
	MOVLW      0
	MOVWF      loadNumValue_val_L0+2
	MOVLW      0
	MOVWF      loadNumValue_val_L0+3
	MOVLW      16
	MOVWF      loadNumValue_pos_L0+0
;MyProject.c,109 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,110 :: 		Lcd_Out(1,1,"NUM:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,111 :: 		while(1){
L_loadNumValue28:
;MyProject.c,112 :: 		do {
L_loadNumValue30:
;MyProject.c,113 :: 		if(detectOneEnterClick())return tmp;
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue33
	MOVF       loadNumValue_tmp_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_tmp_L0+1, 0
	MOVWF      R0+1
	GOTO       L_end_loadNumValue
L_loadNumValue33:
;MyProject.c,114 :: 		key = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_key_L0+0
;MyProject.c,115 :: 		}while(!key);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue30
;MyProject.c,116 :: 		switch(key){
	GOTO       L_loadNumValue34
;MyProject.c,117 :: 		case 14:
L_loadNumValue36:
;MyProject.c,118 :: 		Lcd_Out(2,pos,"0");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,119 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,120 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,121 :: 		break;
	GOTO       L_loadNumValue35
;MyProject.c,122 :: 		case 1:
L_loadNumValue37:
;MyProject.c,123 :: 		Lcd_Out(2,pos,"1");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,124 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,125 :: 		tmp += val;
	MOVF       loadNumValue_val_L0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       loadNumValue_val_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,126 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,127 :: 		break;
	GOTO       L_loadNumValue35
;MyProject.c,128 :: 		}
L_loadNumValue34:
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue36
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue37
L_loadNumValue35:
;MyProject.c,129 :: 		if(pos<6)return tmp;
	MOVLW      128
	XORWF      loadNumValue_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadNumValue38
	MOVF       loadNumValue_tmp_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_tmp_L0+1, 0
	MOVWF      R0+1
	GOTO       L_end_loadNumValue
L_loadNumValue38:
;MyProject.c,130 :: 		if(type==2)continue;
	MOVLW      0
	XORWF      FARG_loadNumValue_type+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumValue162
	MOVLW      2
	XORWF      FARG_loadNumValue_type+0, 0
L__loadNumValue162:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumValue39
	GOTO       L_loadNumValue28
L_loadNumValue39:
;MyProject.c,131 :: 		switch(key){
	GOTO       L_loadNumValue40
;MyProject.c,133 :: 		case 2:
L_loadNumValue42:
;MyProject.c,134 :: 		Lcd_Out(2,pos,"2");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,135 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,136 :: 		tmp += val*2;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,137 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,138 :: 		break;
	GOTO       L_loadNumValue41
;MyProject.c,139 :: 		case 3:
L_loadNumValue43:
;MyProject.c,140 :: 		Lcd_Out(2,pos,"3");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,141 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,142 :: 		tmp += val*3;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      3
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,143 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,144 :: 		break;
	GOTO       L_loadNumValue41
;MyProject.c,145 :: 		case 5:
L_loadNumValue44:
;MyProject.c,146 :: 		Lcd_Out(2,pos,"4");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,147 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,148 :: 		tmp += val*4;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,149 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,150 :: 		break;
	GOTO       L_loadNumValue41
;MyProject.c,151 :: 		case 6:
L_loadNumValue45:
;MyProject.c,152 :: 		Lcd_Out(2,pos,"5");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,153 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,154 :: 		tmp += val*5;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,155 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,156 :: 		break;
	GOTO       L_loadNumValue41
;MyProject.c,157 :: 		case 7:
L_loadNumValue46:
;MyProject.c,158 :: 		Lcd_Out(2,pos,"6");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,159 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,160 :: 		tmp += val*6;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      6
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,161 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,162 :: 		break;
	GOTO       L_loadNumValue41
;MyProject.c,163 :: 		case 9:
L_loadNumValue47:
;MyProject.c,164 :: 		Lcd_Out(2,pos,"7");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,165 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,166 :: 		tmp += val*7;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      7
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,167 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,168 :: 		break;
	GOTO       L_loadNumValue41
;MyProject.c,169 :: 		}
L_loadNumValue40:
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue42
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue43
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue44
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue45
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue46
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue47
L_loadNumValue41:
;MyProject.c,170 :: 		if(pos<6)return tmp;
	MOVLW      128
	XORWF      loadNumValue_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadNumValue48
	MOVF       loadNumValue_tmp_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_tmp_L0+1, 0
	MOVWF      R0+1
	GOTO       L_end_loadNumValue
L_loadNumValue48:
;MyProject.c,171 :: 		if(type==8)continue;
	MOVLW      0
	XORWF      FARG_loadNumValue_type+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumValue163
	MOVLW      8
	XORWF      FARG_loadNumValue_type+0, 0
L__loadNumValue163:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumValue49
	GOTO       L_loadNumValue28
L_loadNumValue49:
;MyProject.c,173 :: 		switch(key){
	GOTO       L_loadNumValue50
;MyProject.c,174 :: 		case 10:
L_loadNumValue52:
;MyProject.c,175 :: 		Lcd_Out(2,pos,"8");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,176 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,177 :: 		tmp += val*8;
	MOVLW      3
	MOVWF      R2+0
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__loadNumValue164:
	BTFSC      STATUS+0, 2
	GOTO       L__loadNumValue165
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__loadNumValue164
L__loadNumValue165:
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,178 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,179 :: 		break;
	GOTO       L_loadNumValue51
;MyProject.c,180 :: 		case 11:
L_loadNumValue53:
;MyProject.c,181 :: 		Lcd_Out(2,pos,"9");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,182 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,183 :: 		tmp += val*9;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      9
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,184 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,185 :: 		break;
	GOTO       L_loadNumValue51
;MyProject.c,187 :: 		}
L_loadNumValue50:
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue52
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue53
L_loadNumValue51:
;MyProject.c,188 :: 		if(pos<6)return tmp;
	MOVLW      128
	XORWF      loadNumValue_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadNumValue54
	MOVF       loadNumValue_tmp_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_tmp_L0+1, 0
	MOVWF      R0+1
	GOTO       L_end_loadNumValue
L_loadNumValue54:
;MyProject.c,189 :: 		switch(key){
	GOTO       L_loadNumValue55
;MyProject.c,190 :: 		case 4:
L_loadNumValue57:
;MyProject.c,191 :: 		Lcd_Out(2,pos,"A");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,192 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,193 :: 		tmp += val*10;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,194 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,195 :: 		break;
	GOTO       L_loadNumValue56
;MyProject.c,196 :: 		case 8:
L_loadNumValue58:
;MyProject.c,197 :: 		Lcd_Out(2,pos,"B");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,198 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,199 :: 		tmp += val*11;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      11
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,200 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,201 :: 		break;
	GOTO       L_loadNumValue56
;MyProject.c,202 :: 		case 12:
L_loadNumValue59:
;MyProject.c,203 :: 		Lcd_Out(2,pos,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr17_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,204 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,205 :: 		tmp += val*12;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      12
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,206 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,207 :: 		break;
	GOTO       L_loadNumValue56
;MyProject.c,208 :: 		case 16:
L_loadNumValue60:
;MyProject.c,209 :: 		Lcd_Out(2,pos,"D");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr18_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,210 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,211 :: 		tmp += val*13;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      13
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,212 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,213 :: 		break;
	GOTO       L_loadNumValue56
;MyProject.c,214 :: 		case 15:
L_loadNumValue61:
;MyProject.c,215 :: 		Lcd_Out(2,pos,"E");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr19_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,216 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,217 :: 		tmp += val*14;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      14
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,218 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,219 :: 		break;
	GOTO       L_loadNumValue56
;MyProject.c,220 :: 		case 13:
L_loadNumValue62:
;MyProject.c,221 :: 		Lcd_Out(2,pos,"F");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr20_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,222 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,223 :: 		tmp += val*15;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVLW      15
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,224 :: 		val*=type;
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       loadNumValue_val_L0+2, 0
	MOVWF      R0+2
	MOVF       loadNumValue_val_L0+3, 0
	MOVWF      R0+3
	MOVF       FARG_loadNumValue_type+0, 0
	MOVWF      R4+0
	MOVF       FARG_loadNumValue_type+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_val_L0+0
	MOVF       R0+1, 0
	MOVWF      loadNumValue_val_L0+1
	MOVF       R0+2, 0
	MOVWF      loadNumValue_val_L0+2
	MOVF       R0+3, 0
	MOVWF      loadNumValue_val_L0+3
;MyProject.c,225 :: 		break;
	GOTO       L_loadNumValue56
;MyProject.c,226 :: 		}
L_loadNumValue55:
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue57
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue58
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue59
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue60
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue61
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue62
L_loadNumValue56:
;MyProject.c,227 :: 		if(pos<6){
	MOVLW      128
	XORWF      loadNumValue_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadNumValue63
;MyProject.c,229 :: 		return tmp;
	MOVF       loadNumValue_tmp_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_tmp_L0+1, 0
	MOVWF      R0+1
	GOTO       L_end_loadNumValue
;MyProject.c,230 :: 		}
L_loadNumValue63:
;MyProject.c,231 :: 		}
	GOTO       L_loadNumValue28
;MyProject.c,234 :: 		}
L_end_loadNumValue:
	RETURN
; end of _loadNumValue

_loadNumbers:

;MyProject.c,235 :: 		void loadNumbers(){
;MyProject.c,237 :: 		if(modeIndex==1||modeIndex==2){
	MOVF       _modeIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__loadNumbers155
	MOVF       _modeIndex+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__loadNumbers155
	GOTO       L_loadNumbers66
L__loadNumbers155:
;MyProject.c,239 :: 		if(dataTypeIndex[0]==0){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers167
	MOVLW      0
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers167:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers67
;MyProject.c,240 :: 		num1=loadNumValue(2);
	MOVLW      2
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,241 :: 		}
	GOTO       L_loadNumbers68
L_loadNumbers67:
;MyProject.c,242 :: 		else if(dataTypeIndex[0]==1){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers168
	MOVLW      1
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers168:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers69
;MyProject.c,243 :: 		num1=loadNumValue(10);
	MOVLW      10
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,245 :: 		}
	GOTO       L_loadNumbers70
L_loadNumbers69:
;MyProject.c,246 :: 		else if(dataTypeIndex[0]==2){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers169
	MOVLW      2
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers169:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers71
;MyProject.c,247 :: 		num1=loadNumValue(8);
	MOVLW      8
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,249 :: 		}else if(dataTypeIndex[0]==3){
	GOTO       L_loadNumbers72
L_loadNumbers71:
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers170
	MOVLW      3
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers170:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers73
;MyProject.c,250 :: 		num1=loadNumValue(16);
	MOVLW      16
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,251 :: 		}
L_loadNumbers73:
L_loadNumbers72:
L_loadNumbers70:
L_loadNumbers68:
;MyProject.c,252 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,253 :: 		}
	GOTO       L_loadNumbers74
L_loadNumbers66:
;MyProject.c,255 :: 		if(dataTypeIndex[0]==0){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers171
	MOVLW      0
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers171:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers75
;MyProject.c,256 :: 		num1=loadNumValue(2);
	MOVLW      2
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,257 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,258 :: 		num2=loadNumValue(2);
	MOVLW      2
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num2+0
	MOVF       R0+1, 0
	MOVWF      _num2+1
;MyProject.c,259 :: 		}
	GOTO       L_loadNumbers76
L_loadNumbers75:
;MyProject.c,260 :: 		else if(dataTypeIndex[0]==1){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers172
	MOVLW      1
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers172:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers77
;MyProject.c,261 :: 		num1=loadNumValue(10);
	MOVLW      10
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,262 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,263 :: 		num2=loadNumValue(10);
	MOVLW      10
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num2+0
	MOVF       R0+1, 0
	MOVWF      _num2+1
;MyProject.c,264 :: 		}
	GOTO       L_loadNumbers78
L_loadNumbers77:
;MyProject.c,265 :: 		else if(dataTypeIndex[0]==2){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers173
	MOVLW      2
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers173:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers79
;MyProject.c,266 :: 		num1=loadNumValue(8);
	MOVLW      8
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,267 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,268 :: 		num2=loadNumValue(8);
	MOVLW      8
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num2+0
	MOVF       R0+1, 0
	MOVWF      _num2+1
;MyProject.c,270 :: 		}else if(dataTypeIndex[0]==3){
	GOTO       L_loadNumbers80
L_loadNumbers79:
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers174
	MOVLW      3
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers174:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers81
;MyProject.c,271 :: 		num1=loadNumValue(16);
	MOVLW      16
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,272 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,273 :: 		num2=loadNumValue(16);
	MOVLW      16
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num2+0
	MOVF       R0+1, 0
	MOVWF      _num2+1
;MyProject.c,274 :: 		}
L_loadNumbers81:
L_loadNumbers80:
L_loadNumbers78:
L_loadNumbers76:
;MyProject.c,275 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,276 :: 		}
L_loadNumbers74:
;MyProject.c,277 :: 		}
L_end_loadNumbers:
	RETURN
; end of _loadNumbers

_choseOperation:

;MyProject.c,279 :: 		void choseOperation(){
;MyProject.c,280 :: 		while(1){
L_choseOperation82:
;MyProject.c,282 :: 		if(Keypad_Key_Click()==1){
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_choseOperation84
;MyProject.c,283 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,284 :: 		operaionIndex++;
	INCF       _operaionIndex+0, 1
;MyProject.c,285 :: 		if(operaionIndex>3){
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _operaionIndex+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_choseOperation85
;MyProject.c,286 :: 		operaionIndex=0;
	CLRF       _operaionIndex+0
;MyProject.c,287 :: 		}
L_choseOperation85:
;MyProject.c,288 :: 		}
	GOTO       L_choseOperation86
L_choseOperation84:
;MyProject.c,289 :: 		else if(detectOneEnterClick()){
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_choseOperation87
;MyProject.c,290 :: 		return;
	GOTO       L_end_choseOperation
;MyProject.c,291 :: 		}
L_choseOperation87:
L_choseOperation86:
;MyProject.c,292 :: 		Lcd_Out(1,1,"Operacja:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr21_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,293 :: 		Lcd_Out(2,1,operationsTitles[operaionIndex]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _operaionIndex+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _operationsTitles+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,294 :: 		}
	GOTO       L_choseOperation82
;MyProject.c,296 :: 		}
L_end_choseOperation:
	RETURN
; end of _choseOperation

_calculate:

;MyProject.c,297 :: 		int calculate(){
;MyProject.c,298 :: 		switch(operaionIndex){
	GOTO       L_calculate88
;MyProject.c,299 :: 		case 0:
L_calculate90:
;MyProject.c,300 :: 		return num1+num2;
	MOVF       _num2+0, 0
	ADDWF      _num1+0, 0
	MOVWF      R0+0
	MOVF       _num1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _num2+1, 0
	MOVWF      R0+1
	GOTO       L_end_calculate
;MyProject.c,302 :: 		case 1:
L_calculate91:
;MyProject.c,303 :: 		return num1-num2;
	MOVF       _num2+0, 0
	SUBWF      _num1+0, 0
	MOVWF      R0+0
	MOVF       _num2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _num1+1, 0
	MOVWF      R0+1
	GOTO       L_end_calculate
;MyProject.c,305 :: 		case 2:
L_calculate92:
;MyProject.c,306 :: 		return num1/num2;
	MOVF       _num2+0, 0
	MOVWF      R4+0
	MOVF       _num2+1, 0
	MOVWF      R4+1
	MOVF       _num1+0, 0
	MOVWF      R0+0
	MOVF       _num1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	GOTO       L_end_calculate
;MyProject.c,308 :: 		case 3:
L_calculate93:
;MyProject.c,309 :: 		return num1*num2;
	MOVF       _num1+0, 0
	MOVWF      R0+0
	MOVF       _num1+1, 0
	MOVWF      R0+1
	MOVF       _num2+0, 0
	MOVWF      R4+0
	MOVF       _num2+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	GOTO       L_end_calculate
;MyProject.c,313 :: 		}
L_calculate88:
	MOVF       _operaionIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_calculate90
	MOVF       _operaionIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_calculate91
	MOVF       _operaionIndex+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_calculate92
	MOVF       _operaionIndex+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_calculate93
;MyProject.c,315 :: 		}
L_end_calculate:
	RETURN
; end of _calculate

_convertNumber:

;MyProject.c,317 :: 		void convertNumber(int num,int mode){
;MyProject.c,318 :: 		int index =9;
	MOVLW      9
	MOVWF      convertNumber_index_L0+0
	MOVLW      0
	MOVWF      convertNumber_index_L0+1
;MyProject.c,319 :: 		arr[10]='\0';
	CLRF       _arr+10
;MyProject.c,320 :: 		while(index!=-1){
L_convertNumber94:
	MOVLW      255
	XORWF      convertNumber_index_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber178
	MOVLW      255
	XORWF      convertNumber_index_L0+0, 0
L__convertNumber178:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber95
;MyProject.c,321 :: 		switch(num%mode){
	MOVF       FARG_convertNumber_mode+0, 0
	MOVWF      R4+0
	MOVF       FARG_convertNumber_mode+1, 0
	MOVWF      R4+1
	MOVF       FARG_convertNumber_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_convertNumber_num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__convertNumber+1
	MOVF       R0+1, 0
	MOVWF      FLOC__convertNumber+2
	GOTO       L_convertNumber96
;MyProject.c,322 :: 		case 10:
L_convertNumber98:
;MyProject.c,323 :: 		arr[index]='A';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
;MyProject.c,324 :: 		break;
	GOTO       L_convertNumber97
;MyProject.c,325 :: 		case 11:
L_convertNumber99:
;MyProject.c,326 :: 		arr[index]='B';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      66
	MOVWF      INDF+0
;MyProject.c,327 :: 		break;
	GOTO       L_convertNumber97
;MyProject.c,328 :: 		case 12:
L_convertNumber100:
;MyProject.c,329 :: 		arr[index]='C';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
;MyProject.c,330 :: 		break;
	GOTO       L_convertNumber97
;MyProject.c,331 :: 		case 13:
L_convertNumber101:
;MyProject.c,332 :: 		arr[index]='D';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      68
	MOVWF      INDF+0
;MyProject.c,333 :: 		break;
	GOTO       L_convertNumber97
;MyProject.c,334 :: 		case 14:
L_convertNumber102:
;MyProject.c,335 :: 		arr[index]='E';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
;MyProject.c,336 :: 		break;
	GOTO       L_convertNumber97
;MyProject.c,337 :: 		case 15:
L_convertNumber103:
;MyProject.c,338 :: 		arr[index]='F';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      70
	MOVWF      INDF+0
;MyProject.c,339 :: 		break;
	GOTO       L_convertNumber97
;MyProject.c,340 :: 		default:
L_convertNumber104:
;MyProject.c,341 :: 		arr[index]='0'+num%mode;
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FLOC__convertNumber+0
	MOVF       FARG_convertNumber_mode+0, 0
	MOVWF      R4+0
	MOVF       FARG_convertNumber_mode+1, 0
	MOVWF      R4+1
	MOVF       FARG_convertNumber_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_convertNumber_num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__convertNumber+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,342 :: 		}
	GOTO       L_convertNumber97
L_convertNumber96:
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber179
	MOVLW      10
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber179:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber98
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber180
	MOVLW      11
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber180:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber99
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber181
	MOVLW      12
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber181:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber100
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber182
	MOVLW      13
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber182:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber101
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber183
	MOVLW      14
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber183:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber102
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber184
	MOVLW      15
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber184:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber103
	GOTO       L_convertNumber104
L_convertNumber97:
;MyProject.c,343 :: 		index--;
	MOVLW      1
	SUBWF      convertNumber_index_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       convertNumber_index_L0+1, 1
;MyProject.c,344 :: 		num/=mode;
	MOVF       FARG_convertNumber_mode+0, 0
	MOVWF      R4+0
	MOVF       FARG_convertNumber_mode+1, 0
	MOVWF      R4+1
	MOVF       FARG_convertNumber_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_convertNumber_num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_convertNumber_num+1
;MyProject.c,345 :: 		}
	GOTO       L_convertNumber94
L_convertNumber95:
;MyProject.c,346 :: 		}
L_end_convertNumber:
	RETURN
; end of _convertNumber

_choseShift:

;MyProject.c,348 :: 		void choseShift(){
;MyProject.c,349 :: 		while(1){
L_choseShift105:
;MyProject.c,350 :: 		switch(shiftIndex){
	GOTO       L_choseShift107
;MyProject.c,351 :: 		case 0:
L_choseShift109:
;MyProject.c,352 :: 		Lcd_Out(2,1,"L");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr22_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,353 :: 		break;
	GOTO       L_choseShift108
;MyProject.c,354 :: 		case 1:
L_choseShift110:
;MyProject.c,355 :: 		Lcd_Out(2,1,"R");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr23_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,356 :: 		break;
	GOTO       L_choseShift108
;MyProject.c,357 :: 		}
L_choseShift107:
	MOVF       _shiftIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_choseShift109
	MOVF       _shiftIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_choseShift110
L_choseShift108:
;MyProject.c,358 :: 		if(Keypad_Key_Click()==1){
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_choseShift111
;MyProject.c,359 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,360 :: 		shiftIndex++;
	INCF       _shiftIndex+0, 1
;MyProject.c,361 :: 		if(shiftIndex>1){
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _shiftIndex+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_choseShift112
;MyProject.c,362 :: 		shiftIndex=0;
	CLRF       _shiftIndex+0
;MyProject.c,363 :: 		}
L_choseShift112:
;MyProject.c,364 :: 		}
	GOTO       L_choseShift113
L_choseShift111:
;MyProject.c,365 :: 		else if(detectOneEnterClick()){
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_choseShift114
;MyProject.c,366 :: 		return;
	GOTO       L_end_choseShift
;MyProject.c,367 :: 		}
L_choseShift114:
L_choseShift113:
;MyProject.c,368 :: 		Lcd_Out(1,1,modes[3]);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _modes+18
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,370 :: 		}
	GOTO       L_choseShift105
;MyProject.c,372 :: 		}
L_end_choseShift:
	RETURN
; end of _choseShift

_doShift:

;MyProject.c,373 :: 		void doShift(){
;MyProject.c,374 :: 		switch(shiftIndex){
	GOTO       L_doShift115
;MyProject.c,375 :: 		case 0:
L_doShift117:
;MyProject.c,376 :: 		switch(dataTypeIndex[0]){
	GOTO       L_doShift118
;MyProject.c,377 :: 		case 0:
L_doShift120:
;MyProject.c,378 :: 		convertNumber(num1<<1,2);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	RLF        FARG_convertNumber_num+0, 1
	RLF        FARG_convertNumber_num+1, 1
	BCF        FARG_convertNumber_num+0, 0
	MOVLW      2
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,379 :: 		break;
	GOTO       L_doShift119
;MyProject.c,380 :: 		case 1:
L_doShift121:
;MyProject.c,381 :: 		convertNumber(num1<<1,10);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	RLF        FARG_convertNumber_num+0, 1
	RLF        FARG_convertNumber_num+1, 1
	BCF        FARG_convertNumber_num+0, 0
	MOVLW      10
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,382 :: 		break;
	GOTO       L_doShift119
;MyProject.c,383 :: 		case 2:
L_doShift122:
;MyProject.c,384 :: 		convertNumber(num1<<1,8);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	RLF        FARG_convertNumber_num+0, 1
	RLF        FARG_convertNumber_num+1, 1
	BCF        FARG_convertNumber_num+0, 0
	MOVLW      8
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,385 :: 		break;
	GOTO       L_doShift119
;MyProject.c,386 :: 		case 3:
L_doShift123:
;MyProject.c,387 :: 		convertNumber(num1<<1,16);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	RLF        FARG_convertNumber_num+0, 1
	RLF        FARG_convertNumber_num+1, 1
	BCF        FARG_convertNumber_num+0, 0
	MOVLW      16
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,388 :: 		break;
	GOTO       L_doShift119
;MyProject.c,389 :: 		}
L_doShift118:
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift187
	MOVLW      0
	XORWF      _dataTypeIndex+0, 0
L__doShift187:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift120
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift188
	MOVLW      1
	XORWF      _dataTypeIndex+0, 0
L__doShift188:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift121
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift189
	MOVLW      2
	XORWF      _dataTypeIndex+0, 0
L__doShift189:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift122
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift190
	MOVLW      3
	XORWF      _dataTypeIndex+0, 0
L__doShift190:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift123
L_doShift119:
;MyProject.c,390 :: 		break;
	GOTO       L_doShift116
;MyProject.c,391 :: 		case 1:
L_doShift124:
;MyProject.c,392 :: 		switch(dataTypeIndex[0]){
	GOTO       L_doShift125
;MyProject.c,393 :: 		case 0:
L_doShift127:
;MyProject.c,394 :: 		convertNumber(num1>>1,2);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	RRF        FARG_convertNumber_num+1, 1
	RRF        FARG_convertNumber_num+0, 1
	BCF        FARG_convertNumber_num+1, 7
	BTFSC      FARG_convertNumber_num+1, 6
	BSF        FARG_convertNumber_num+1, 7
	MOVLW      2
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,395 :: 		break;
	GOTO       L_doShift126
;MyProject.c,396 :: 		case 1:
L_doShift128:
;MyProject.c,397 :: 		convertNumber(num1>>1,10);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	RRF        FARG_convertNumber_num+1, 1
	RRF        FARG_convertNumber_num+0, 1
	BCF        FARG_convertNumber_num+1, 7
	BTFSC      FARG_convertNumber_num+1, 6
	BSF        FARG_convertNumber_num+1, 7
	MOVLW      10
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,398 :: 		break;
	GOTO       L_doShift126
;MyProject.c,399 :: 		case 2:
L_doShift129:
;MyProject.c,400 :: 		convertNumber(num1>>1,8);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	RRF        FARG_convertNumber_num+1, 1
	RRF        FARG_convertNumber_num+0, 1
	BCF        FARG_convertNumber_num+1, 7
	BTFSC      FARG_convertNumber_num+1, 6
	BSF        FARG_convertNumber_num+1, 7
	MOVLW      8
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,401 :: 		break;
	GOTO       L_doShift126
;MyProject.c,402 :: 		case 3:
L_doShift130:
;MyProject.c,403 :: 		convertNumber(num1>>1,16);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	RRF        FARG_convertNumber_num+1, 1
	RRF        FARG_convertNumber_num+0, 1
	BCF        FARG_convertNumber_num+1, 7
	BTFSC      FARG_convertNumber_num+1, 6
	BSF        FARG_convertNumber_num+1, 7
	MOVLW      16
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,404 :: 		break;
	GOTO       L_doShift126
;MyProject.c,405 :: 		}
L_doShift125:
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift191
	MOVLW      0
	XORWF      _dataTypeIndex+0, 0
L__doShift191:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift127
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift192
	MOVLW      1
	XORWF      _dataTypeIndex+0, 0
L__doShift192:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift128
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift193
	MOVLW      2
	XORWF      _dataTypeIndex+0, 0
L__doShift193:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift129
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift194
	MOVLW      3
	XORWF      _dataTypeIndex+0, 0
L__doShift194:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift130
L_doShift126:
;MyProject.c,406 :: 		break;
	GOTO       L_doShift116
;MyProject.c,408 :: 		}
L_doShift115:
	MOVF       _shiftIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_doShift117
	MOVF       _shiftIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_doShift124
L_doShift116:
;MyProject.c,409 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,410 :: 		Lcd_Out(2,1,arr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _arr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,411 :: 		}
L_end_doShift:
	RETURN
; end of _doShift

_doConvert:

;MyProject.c,412 :: 		void doConvert(){
;MyProject.c,414 :: 		switch(dataTypeIndex[1]){
	GOTO       L_doConvert131
;MyProject.c,415 :: 		case 0:
L_doConvert133:
;MyProject.c,416 :: 		convertNumber(num1,2);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      2
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,417 :: 		break;
	GOTO       L_doConvert132
;MyProject.c,418 :: 		case 1:
L_doConvert134:
;MyProject.c,419 :: 		convertNumber(num1,10);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      10
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,420 :: 		break;
	GOTO       L_doConvert132
;MyProject.c,421 :: 		case 2:
L_doConvert135:
;MyProject.c,422 :: 		convertNumber(num1,8);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      8
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,423 :: 		break;
	GOTO       L_doConvert132
;MyProject.c,424 :: 		case 3:
L_doConvert136:
;MyProject.c,425 :: 		convertNumber(num1,16);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      16
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,426 :: 		break;
	GOTO       L_doConvert132
;MyProject.c,428 :: 		}
L_doConvert131:
	MOVLW      0
	XORWF      _dataTypeIndex+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doConvert196
	MOVLW      0
	XORWF      _dataTypeIndex+2, 0
L__doConvert196:
	BTFSC      STATUS+0, 2
	GOTO       L_doConvert133
	MOVLW      0
	XORWF      _dataTypeIndex+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doConvert197
	MOVLW      1
	XORWF      _dataTypeIndex+2, 0
L__doConvert197:
	BTFSC      STATUS+0, 2
	GOTO       L_doConvert134
	MOVLW      0
	XORWF      _dataTypeIndex+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doConvert198
	MOVLW      2
	XORWF      _dataTypeIndex+2, 0
L__doConvert198:
	BTFSC      STATUS+0, 2
	GOTO       L_doConvert135
	MOVLW      0
	XORWF      _dataTypeIndex+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doConvert199
	MOVLW      3
	XORWF      _dataTypeIndex+2, 0
L__doConvert199:
	BTFSC      STATUS+0, 2
	GOTO       L_doConvert136
L_doConvert132:
;MyProject.c,429 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,430 :: 		Lcd_Out(2,1,arr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _arr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,431 :: 		}
L_end_doConvert:
	RETURN
; end of _doConvert

_init_program:

;MyProject.c,432 :: 		void init_program(){
;MyProject.c,433 :: 		ANSELA = 0;
	CLRF       ANSELA+0
;MyProject.c,434 :: 		ANSELB = 0;
	CLRF       ANSELB+0
;MyProject.c,435 :: 		ANSELD = 0;
	CLRF       ANSELD+0
;MyProject.c,436 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,437 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,438 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,439 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;MyProject.c,440 :: 		}
L_end_init_program:
	RETURN
; end of _init_program

_main:

;MyProject.c,441 :: 		void main() {
;MyProject.c,443 :: 		init_program();
	CALL       _init_program+0
;MyProject.c,444 :: 		while(1){
L_main137:
;MyProject.c,445 :: 		choseMode();
	CALL       _choseMode+0
;MyProject.c,446 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,447 :: 		choseDataTypes();
	CALL       _choseDataTypes+0
;MyProject.c,448 :: 		loadNumbers();
	CALL       _loadNumbers+0
;MyProject.c,449 :: 		switch(modeIndex){
	GOTO       L_main139
;MyProject.c,450 :: 		case 0:
L_main141:
;MyProject.c,451 :: 		choseOperation();
	CALL       _choseOperation+0
;MyProject.c,453 :: 		switch(dataTypeIndex[0]){
	GOTO       L_main142
;MyProject.c,454 :: 		case 0:
L_main144:
;MyProject.c,455 :: 		convertNumber(calculate(),2);
	CALL       _calculate+0
	MOVF       R0+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      2
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,456 :: 		break;
	GOTO       L_main143
;MyProject.c,457 :: 		case 1:
L_main145:
;MyProject.c,458 :: 		convertNumber(calculate(),10);
	CALL       _calculate+0
	MOVF       R0+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      10
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,459 :: 		break;
	GOTO       L_main143
;MyProject.c,461 :: 		case 2:
L_main146:
;MyProject.c,462 :: 		convertNumber(calculate(),8);
	CALL       _calculate+0
	MOVF       R0+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      8
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,463 :: 		break;
	GOTO       L_main143
;MyProject.c,465 :: 		case 3:
L_main147:
;MyProject.c,466 :: 		convertNumber(calculate(),16);
	CALL       _calculate+0
	MOVF       R0+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      16
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,467 :: 		break;
	GOTO       L_main143
;MyProject.c,469 :: 		}
L_main142:
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main202
	MOVLW      0
	XORWF      _dataTypeIndex+0, 0
L__main202:
	BTFSC      STATUS+0, 2
	GOTO       L_main144
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main203
	MOVLW      1
	XORWF      _dataTypeIndex+0, 0
L__main203:
	BTFSC      STATUS+0, 2
	GOTO       L_main145
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main204
	MOVLW      2
	XORWF      _dataTypeIndex+0, 0
L__main204:
	BTFSC      STATUS+0, 2
	GOTO       L_main146
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main205
	MOVLW      3
	XORWF      _dataTypeIndex+0, 0
L__main205:
	BTFSC      STATUS+0, 2
	GOTO       L_main147
L_main143:
;MyProject.c,470 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,471 :: 		Lcd_Out(2,1,arr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _arr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,473 :: 		break;
	GOTO       L_main140
;MyProject.c,474 :: 		case 1:
L_main148:
;MyProject.c,475 :: 		doConvert();
	CALL       _doConvert+0
;MyProject.c,476 :: 		break;
	GOTO       L_main140
;MyProject.c,477 :: 		case 2:
L_main149:
;MyProject.c,478 :: 		choseShift();
	CALL       _choseShift+0
;MyProject.c,479 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,481 :: 		if(shiftIndex){
	MOVF       _shiftIndex+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main150
;MyProject.c,482 :: 		doShift();
	CALL       _doShift+0
;MyProject.c,483 :: 		}else
	GOTO       L_main151
L_main150:
;MyProject.c,485 :: 		doShift();
	CALL       _doShift+0
;MyProject.c,486 :: 		}
L_main151:
;MyProject.c,488 :: 		break;
	GOTO       L_main140
;MyProject.c,489 :: 		}
L_main139:
	MOVF       _modeIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main141
	MOVF       _modeIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main148
	MOVF       _modeIndex+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main149
L_main140:
;MyProject.c,490 :: 		while(!detectOneEnterClick());
L_main152:
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main153
	GOTO       L_main152
L_main153:
;MyProject.c,491 :: 		}
	GOTO       L_main137
;MyProject.c,492 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
