
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
;MyProject.c,48 :: 		char modes[][6]={"ARIT","CONV","SHIF","MODE:"};
	MOVLW      65
	MOVWF      choseMode_modes_L0+0
	MOVLW      82
	MOVWF      choseMode_modes_L0+1
	MOVLW      73
	MOVWF      choseMode_modes_L0+2
	MOVLW      84
	MOVWF      choseMode_modes_L0+3
	CLRF       choseMode_modes_L0+4
	CLRF       choseMode_modes_L0+5
	MOVLW      67
	MOVWF      choseMode_modes_L0+6
	MOVLW      79
	MOVWF      choseMode_modes_L0+7
	MOVLW      78
	MOVWF      choseMode_modes_L0+8
	MOVLW      86
	MOVWF      choseMode_modes_L0+9
	CLRF       choseMode_modes_L0+10
	CLRF       choseMode_modes_L0+11
	MOVLW      83
	MOVWF      choseMode_modes_L0+12
	MOVLW      72
	MOVWF      choseMode_modes_L0+13
	MOVLW      73
	MOVWF      choseMode_modes_L0+14
	MOVLW      70
	MOVWF      choseMode_modes_L0+15
	CLRF       choseMode_modes_L0+16
	CLRF       choseMode_modes_L0+17
	MOVLW      77
	MOVWF      choseMode_modes_L0+18
	MOVLW      79
	MOVWF      choseMode_modes_L0+19
	MOVLW      68
	MOVWF      choseMode_modes_L0+20
	MOVLW      69
	MOVWF      choseMode_modes_L0+21
	MOVLW      58
	MOVWF      choseMode_modes_L0+22
	CLRF       choseMode_modes_L0+23
;MyProject.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,50 :: 		do{
L_choseMode3:
;MyProject.c,52 :: 		if(Keypad_Key_Click()==1){
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_choseMode6
;MyProject.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,54 :: 		modeIndex++;
	INCF       _modeIndex+0, 1
;MyProject.c,55 :: 		if(modeIndex>2){
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      _modeIndex+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_choseMode7
;MyProject.c,56 :: 		modeIndex=0;
	CLRF       _modeIndex+0
;MyProject.c,57 :: 		}
L_choseMode7:
;MyProject.c,58 :: 		}
	GOTO       L_choseMode8
L_choseMode6:
;MyProject.c,59 :: 		else if(detectOneEnterClick()){
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_choseMode9
;MyProject.c,60 :: 		return;
	GOTO       L_end_choseMode
;MyProject.c,61 :: 		}
L_choseMode9:
L_choseMode8:
;MyProject.c,62 :: 		Lcd_Out(1,1,modes[3]);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      choseMode_modes_L0+18
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,63 :: 		switch(modeIndex){
	GOTO       L_choseMode10
;MyProject.c,64 :: 		case 0:
L_choseMode12:
;MyProject.c,65 :: 		Lcd_Out(2,1,modes[0]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      choseMode_modes_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,66 :: 		break;
	GOTO       L_choseMode11
;MyProject.c,67 :: 		case 1:
L_choseMode13:
;MyProject.c,68 :: 		Lcd_Out(2,1,modes[1]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      choseMode_modes_L0+6
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,69 :: 		break;
	GOTO       L_choseMode11
;MyProject.c,70 :: 		case 2:
L_choseMode14:
;MyProject.c,71 :: 		Lcd_Out(2,1,modes[2]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      choseMode_modes_L0+12
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,72 :: 		break;
	GOTO       L_choseMode11
;MyProject.c,75 :: 		}
L_choseMode10:
	MOVF       _modeIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_choseMode12
	MOVF       _modeIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_choseMode13
	MOVF       _modeIndex+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_choseMode14
L_choseMode11:
;MyProject.c,76 :: 		}while(1);
	GOTO       L_choseMode3
;MyProject.c,78 :: 		}
L_end_choseMode:
	RETURN
; end of _choseMode

_setType:

;MyProject.c,80 :: 		void setType(char title[]){
;MyProject.c,82 :: 		char dataTypes[][4]={"BIN","DEC","OCT","HEX"};
	MOVLW      66
	MOVWF      setType_dataTypes_L0+0
	MOVLW      73
	MOVWF      setType_dataTypes_L0+1
	MOVLW      78
	MOVWF      setType_dataTypes_L0+2
	CLRF       setType_dataTypes_L0+3
	MOVLW      68
	MOVWF      setType_dataTypes_L0+4
	MOVLW      69
	MOVWF      setType_dataTypes_L0+5
	MOVLW      67
	MOVWF      setType_dataTypes_L0+6
	CLRF       setType_dataTypes_L0+7
	MOVLW      79
	MOVWF      setType_dataTypes_L0+8
	MOVLW      67
	MOVWF      setType_dataTypes_L0+9
	MOVLW      84
	MOVWF      setType_dataTypes_L0+10
	CLRF       setType_dataTypes_L0+11
	MOVLW      72
	MOVWF      setType_dataTypes_L0+12
	MOVLW      69
	MOVWF      setType_dataTypes_L0+13
	MOVLW      88
	MOVWF      setType_dataTypes_L0+14
	CLRF       setType_dataTypes_L0+15
;MyProject.c,83 :: 		do{
L_setType15:
;MyProject.c,84 :: 		if(Keypad_Key_Click()==1){
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_setType18
;MyProject.c,85 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,86 :: 		dataTypeIndex[index]++;
	MOVF       _index+0, 0
	MOVWF      R0+0
	MOVF       _index+1, 0
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
;MyProject.c,87 :: 		if(dataTypeIndex[index]>3){
	MOVF       _index+0, 0
	MOVWF      R0+0
	MOVF       _index+1, 0
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
	GOTO       L__setType158
	MOVF       R1+0, 0
	SUBLW      3
L__setType158:
	BTFSC      STATUS+0, 0
	GOTO       L_setType19
;MyProject.c,88 :: 		dataTypeIndex[index]=0;
	MOVF       _index+0, 0
	MOVWF      R0+0
	MOVF       _index+1, 0
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
;MyProject.c,89 :: 		}
L_setType19:
;MyProject.c,90 :: 		}
	GOTO       L_setType20
L_setType18:
;MyProject.c,91 :: 		else if(detectOneEnterClick()){
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_setType21
;MyProject.c,92 :: 		return;
	GOTO       L_end_setType
;MyProject.c,93 :: 		}
L_setType21:
L_setType20:
;MyProject.c,94 :: 		Lcd_Out(1,1,title);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG_setType_title+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,95 :: 		Lcd_Out(2,1,dataTypes[dataTypeIndex[index]]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _index+0, 0
	MOVWF      R0+0
	MOVF       _index+1, 0
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
	ADDLW      setType_dataTypes_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,96 :: 		}while(1);
	GOTO       L_setType15
;MyProject.c,97 :: 		}
L_end_setType:
	RETURN
; end of _setType

_choseDataTypes:

;MyProject.c,98 :: 		void choseDataTypes(){
;MyProject.c,99 :: 		if(modeIndex==0||modeIndex==2){
	MOVF       _modeIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__choseDataTypes153
	MOVF       _modeIndex+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__choseDataTypes153
	GOTO       L_choseDataTypes24
L__choseDataTypes153:
;MyProject.c,100 :: 		index=0;
	CLRF       _index+0
	CLRF       _index+1
;MyProject.c,101 :: 		setType("IN TYPE:");
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_setType_title+0
	CALL       _setType+0
;MyProject.c,102 :: 		}
	GOTO       L_choseDataTypes25
L_choseDataTypes24:
;MyProject.c,104 :: 		index=0;
	CLRF       _index+0
	CLRF       _index+1
;MyProject.c,105 :: 		setType("IN TYPE:");
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_setType_title+0
	CALL       _setType+0
;MyProject.c,106 :: 		index=1;
	MOVLW      1
	MOVWF      _index+0
	MOVLW      0
	MOVWF      _index+1
;MyProject.c,107 :: 		setType("OUT TYPE:");
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_setType_title+0
	CALL       _setType+0
;MyProject.c,109 :: 		}
L_choseDataTypes25:
;MyProject.c,111 :: 		}
L_end_choseDataTypes:
	RETURN
; end of _choseDataTypes

_loadNumValue:

;MyProject.c,112 :: 		int loadNumValue(int type){
;MyProject.c,113 :: 		int tmp=0;
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
;MyProject.c,117 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,118 :: 		Lcd_Out(1,1,"NUM:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,119 :: 		while(1){
L_loadNumValue26:
;MyProject.c,120 :: 		do {
L_loadNumValue28:
;MyProject.c,121 :: 		if(detectOneEnterClick())return tmp;
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue31
	MOVF       loadNumValue_tmp_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_tmp_L0+1, 0
	MOVWF      R0+1
	GOTO       L_end_loadNumValue
L_loadNumValue31:
;MyProject.c,122 :: 		key = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      loadNumValue_key_L0+0
;MyProject.c,123 :: 		}while(!key);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue28
;MyProject.c,124 :: 		switch(key){
	GOTO       L_loadNumValue32
;MyProject.c,125 :: 		case 14:
L_loadNumValue34:
;MyProject.c,126 :: 		Lcd_Out(2,pos,"0");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,127 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,128 :: 		val*=type;
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
;MyProject.c,129 :: 		break;
	GOTO       L_loadNumValue33
;MyProject.c,130 :: 		case 1:
L_loadNumValue35:
;MyProject.c,131 :: 		Lcd_Out(2,pos,"1");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,132 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,133 :: 		tmp += val;
	MOVF       loadNumValue_val_L0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       loadNumValue_val_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,134 :: 		val*=type;
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
;MyProject.c,135 :: 		break;
	GOTO       L_loadNumValue33
;MyProject.c,136 :: 		}
L_loadNumValue32:
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue34
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue35
L_loadNumValue33:
;MyProject.c,137 :: 		if(pos<6)return tmp;
	MOVLW      128
	XORWF      loadNumValue_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadNumValue36
	MOVF       loadNumValue_tmp_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_tmp_L0+1, 0
	MOVWF      R0+1
	GOTO       L_end_loadNumValue
L_loadNumValue36:
;MyProject.c,138 :: 		if(type==2)continue;
	MOVLW      0
	XORWF      FARG_loadNumValue_type+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumValue161
	MOVLW      2
	XORWF      FARG_loadNumValue_type+0, 0
L__loadNumValue161:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumValue37
	GOTO       L_loadNumValue26
L_loadNumValue37:
;MyProject.c,139 :: 		switch(key){
	GOTO       L_loadNumValue38
;MyProject.c,141 :: 		case 2:
L_loadNumValue40:
;MyProject.c,142 :: 		Lcd_Out(2,pos,"2");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,143 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,144 :: 		tmp += val*2;
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
;MyProject.c,145 :: 		val*=type;
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
;MyProject.c,146 :: 		break;
	GOTO       L_loadNumValue39
;MyProject.c,147 :: 		case 3:
L_loadNumValue41:
;MyProject.c,148 :: 		Lcd_Out(2,pos,"3");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,149 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,150 :: 		tmp += val*3;
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
;MyProject.c,151 :: 		val*=type;
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
;MyProject.c,152 :: 		break;
	GOTO       L_loadNumValue39
;MyProject.c,153 :: 		case 5:
L_loadNumValue42:
;MyProject.c,154 :: 		Lcd_Out(2,pos,"4");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,155 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,156 :: 		tmp += val*4;
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
;MyProject.c,157 :: 		val*=type;
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
;MyProject.c,158 :: 		break;
	GOTO       L_loadNumValue39
;MyProject.c,159 :: 		case 6:
L_loadNumValue43:
;MyProject.c,160 :: 		Lcd_Out(2,pos,"5");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,161 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,162 :: 		tmp += val*5;
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
;MyProject.c,163 :: 		val*=type;
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
;MyProject.c,164 :: 		break;
	GOTO       L_loadNumValue39
;MyProject.c,165 :: 		case 7:
L_loadNumValue44:
;MyProject.c,166 :: 		Lcd_Out(2,pos,"6");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,167 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,168 :: 		tmp += val*6;
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
;MyProject.c,169 :: 		val*=type;
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
;MyProject.c,170 :: 		break;
	GOTO       L_loadNumValue39
;MyProject.c,171 :: 		case 9:
L_loadNumValue45:
;MyProject.c,172 :: 		Lcd_Out(2,pos,"7");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,173 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,174 :: 		tmp += val*7;
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
;MyProject.c,175 :: 		val*=type;
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
;MyProject.c,176 :: 		break;
	GOTO       L_loadNumValue39
;MyProject.c,177 :: 		}
L_loadNumValue38:
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue40
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue41
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue42
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue43
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue44
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue45
L_loadNumValue39:
;MyProject.c,178 :: 		if(pos<6)return tmp;
	MOVLW      128
	XORWF      loadNumValue_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadNumValue46
	MOVF       loadNumValue_tmp_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_tmp_L0+1, 0
	MOVWF      R0+1
	GOTO       L_end_loadNumValue
L_loadNumValue46:
;MyProject.c,179 :: 		if(type==8)continue;
	MOVLW      0
	XORWF      FARG_loadNumValue_type+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumValue162
	MOVLW      8
	XORWF      FARG_loadNumValue_type+0, 0
L__loadNumValue162:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumValue47
	GOTO       L_loadNumValue26
L_loadNumValue47:
;MyProject.c,181 :: 		switch(key){
	GOTO       L_loadNumValue48
;MyProject.c,182 :: 		case 10:
L_loadNumValue50:
;MyProject.c,183 :: 		Lcd_Out(2,pos,"8");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,184 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,185 :: 		tmp += val*8;
	MOVLW      3
	MOVWF      R2+0
	MOVF       loadNumValue_val_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_val_L0+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__loadNumValue163:
	BTFSC      STATUS+0, 2
	GOTO       L__loadNumValue164
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__loadNumValue163
L__loadNumValue164:
	MOVF       R0+0, 0
	ADDWF      loadNumValue_tmp_L0+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      loadNumValue_tmp_L0+1, 1
;MyProject.c,186 :: 		val*=type;
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
;MyProject.c,187 :: 		break;
	GOTO       L_loadNumValue49
;MyProject.c,188 :: 		case 11:
L_loadNumValue51:
;MyProject.c,189 :: 		Lcd_Out(2,pos,"9");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,190 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,191 :: 		tmp += val*9;
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
;MyProject.c,192 :: 		val*=type;
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
;MyProject.c,193 :: 		break;
	GOTO       L_loadNumValue49
;MyProject.c,195 :: 		}
L_loadNumValue48:
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue50
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue51
L_loadNumValue49:
;MyProject.c,196 :: 		if(pos<6)return tmp;
	MOVLW      128
	XORWF      loadNumValue_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadNumValue52
	MOVF       loadNumValue_tmp_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_tmp_L0+1, 0
	MOVWF      R0+1
	GOTO       L_end_loadNumValue
L_loadNumValue52:
;MyProject.c,197 :: 		switch(key){
	GOTO       L_loadNumValue53
;MyProject.c,198 :: 		case 4:
L_loadNumValue55:
;MyProject.c,199 :: 		Lcd_Out(2,pos,"A");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,200 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,201 :: 		tmp += val*10;
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
;MyProject.c,202 :: 		val*=type;
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
;MyProject.c,203 :: 		break;
	GOTO       L_loadNumValue54
;MyProject.c,204 :: 		case 8:
L_loadNumValue56:
;MyProject.c,205 :: 		Lcd_Out(2,pos,"B");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,206 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,207 :: 		tmp += val*11;
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
;MyProject.c,208 :: 		val*=type;
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
;MyProject.c,209 :: 		break;
	GOTO       L_loadNumValue54
;MyProject.c,210 :: 		case 12:
L_loadNumValue57:
;MyProject.c,211 :: 		Lcd_Out(2,pos,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr17_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,212 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,213 :: 		tmp += val*12;
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
;MyProject.c,214 :: 		val*=type;
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
;MyProject.c,215 :: 		break;
	GOTO       L_loadNumValue54
;MyProject.c,216 :: 		case 16:
L_loadNumValue58:
;MyProject.c,217 :: 		Lcd_Out(2,pos,"D");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr18_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,218 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,219 :: 		tmp += val*13;
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
;MyProject.c,220 :: 		val*=type;
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
;MyProject.c,221 :: 		break;
	GOTO       L_loadNumValue54
;MyProject.c,222 :: 		case 15:
L_loadNumValue59:
;MyProject.c,223 :: 		Lcd_Out(2,pos,"E");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr19_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,224 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,225 :: 		tmp += val*14;
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
;MyProject.c,226 :: 		val*=type;
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
;MyProject.c,227 :: 		break;
	GOTO       L_loadNumValue54
;MyProject.c,228 :: 		case 13:
L_loadNumValue60:
;MyProject.c,229 :: 		Lcd_Out(2,pos,"F");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       loadNumValue_pos_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr20_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,230 :: 		pos--;
	DECF       loadNumValue_pos_L0+0, 1
;MyProject.c,231 :: 		tmp += val*15;
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
;MyProject.c,232 :: 		val*=type;
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
;MyProject.c,233 :: 		break;
	GOTO       L_loadNumValue54
;MyProject.c,234 :: 		}
L_loadNumValue53:
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue55
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue56
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue57
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue58
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue59
	MOVF       loadNumValue_key_L0+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_loadNumValue60
L_loadNumValue54:
;MyProject.c,235 :: 		if(pos<6){
	MOVLW      128
	XORWF      loadNumValue_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadNumValue61
;MyProject.c,237 :: 		return tmp;
	MOVF       loadNumValue_tmp_L0+0, 0
	MOVWF      R0+0
	MOVF       loadNumValue_tmp_L0+1, 0
	MOVWF      R0+1
	GOTO       L_end_loadNumValue
;MyProject.c,238 :: 		}
L_loadNumValue61:
;MyProject.c,239 :: 		}
	GOTO       L_loadNumValue26
;MyProject.c,242 :: 		}
L_end_loadNumValue:
	RETURN
; end of _loadNumValue

_loadNumbers:

;MyProject.c,243 :: 		void loadNumbers(){
;MyProject.c,245 :: 		if(modeIndex==1||modeIndex==2){
	MOVF       _modeIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__loadNumbers154
	MOVF       _modeIndex+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__loadNumbers154
	GOTO       L_loadNumbers64
L__loadNumbers154:
;MyProject.c,247 :: 		if(dataTypeIndex[0]==0){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers166
	MOVLW      0
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers166:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers65
;MyProject.c,248 :: 		num1=loadNumValue(2);
	MOVLW      2
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,249 :: 		}
	GOTO       L_loadNumbers66
L_loadNumbers65:
;MyProject.c,250 :: 		else if(dataTypeIndex[0]==1){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers167
	MOVLW      1
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers167:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers67
;MyProject.c,251 :: 		num1=loadNumValue(10);
	MOVLW      10
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,253 :: 		}
	GOTO       L_loadNumbers68
L_loadNumbers67:
;MyProject.c,254 :: 		else if(dataTypeIndex[0]==2){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers168
	MOVLW      2
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers168:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers69
;MyProject.c,255 :: 		num1=loadNumValue(8);
	MOVLW      8
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,257 :: 		}else if(dataTypeIndex[0]==3){
	GOTO       L_loadNumbers70
L_loadNumbers69:
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers169
	MOVLW      3
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers169:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers71
;MyProject.c,258 :: 		num1=loadNumValue(16);
	MOVLW      16
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,259 :: 		}
L_loadNumbers71:
L_loadNumbers70:
L_loadNumbers68:
L_loadNumbers66:
;MyProject.c,260 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,261 :: 		}
	GOTO       L_loadNumbers72
L_loadNumbers64:
;MyProject.c,263 :: 		if(dataTypeIndex[0]==0){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers170
	MOVLW      0
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers170:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers73
;MyProject.c,264 :: 		num1=loadNumValue(2);
	MOVLW      2
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,265 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,266 :: 		num2=loadNumValue(2);
	MOVLW      2
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num2+0
	MOVF       R0+1, 0
	MOVWF      _num2+1
;MyProject.c,267 :: 		}
	GOTO       L_loadNumbers74
L_loadNumbers73:
;MyProject.c,268 :: 		else if(dataTypeIndex[0]==1){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers171
	MOVLW      1
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers171:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers75
;MyProject.c,269 :: 		num1=loadNumValue(10);
	MOVLW      10
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,270 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,271 :: 		num2=loadNumValue(10);
	MOVLW      10
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num2+0
	MOVF       R0+1, 0
	MOVWF      _num2+1
;MyProject.c,272 :: 		}
	GOTO       L_loadNumbers76
L_loadNumbers75:
;MyProject.c,273 :: 		else if(dataTypeIndex[0]==2){
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers172
	MOVLW      2
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers172:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers77
;MyProject.c,274 :: 		num1=loadNumValue(8);
	MOVLW      8
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,275 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,276 :: 		num2=loadNumValue(8);
	MOVLW      8
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num2+0
	MOVF       R0+1, 0
	MOVWF      _num2+1
;MyProject.c,278 :: 		}else if(dataTypeIndex[0]==3){
	GOTO       L_loadNumbers78
L_loadNumbers77:
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loadNumbers173
	MOVLW      3
	XORWF      _dataTypeIndex+0, 0
L__loadNumbers173:
	BTFSS      STATUS+0, 2
	GOTO       L_loadNumbers79
;MyProject.c,279 :: 		num1=loadNumValue(16);
	MOVLW      16
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num1+0
	MOVF       R0+1, 0
	MOVWF      _num1+1
;MyProject.c,280 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,281 :: 		num2=loadNumValue(16);
	MOVLW      16
	MOVWF      FARG_loadNumValue_type+0
	MOVLW      0
	MOVWF      FARG_loadNumValue_type+1
	CALL       _loadNumValue+0
	MOVF       R0+0, 0
	MOVWF      _num2+0
	MOVF       R0+1, 0
	MOVWF      _num2+1
;MyProject.c,282 :: 		}
L_loadNumbers79:
L_loadNumbers78:
L_loadNumbers76:
L_loadNumbers74:
;MyProject.c,283 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,284 :: 		}
L_loadNumbers72:
;MyProject.c,285 :: 		}
L_end_loadNumbers:
	RETURN
; end of _loadNumbers

_choseOperation:

;MyProject.c,287 :: 		void choseOperation(){
;MyProject.c,288 :: 		char operationsTitles[][2]={"+","-","/","*"};
	MOVLW      43
	MOVWF      choseOperation_operationsTitles_L0+0
	CLRF       choseOperation_operationsTitles_L0+1
	MOVLW      45
	MOVWF      choseOperation_operationsTitles_L0+2
	CLRF       choseOperation_operationsTitles_L0+3
	MOVLW      47
	MOVWF      choseOperation_operationsTitles_L0+4
	CLRF       choseOperation_operationsTitles_L0+5
	MOVLW      42
	MOVWF      choseOperation_operationsTitles_L0+6
	CLRF       choseOperation_operationsTitles_L0+7
;MyProject.c,289 :: 		while(1){
L_choseOperation80:
;MyProject.c,291 :: 		if(Keypad_Key_Click()==1){
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_choseOperation82
;MyProject.c,292 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,293 :: 		operaionIndex++;
	INCF       _operaionIndex+0, 1
;MyProject.c,294 :: 		if(operaionIndex>3){
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _operaionIndex+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_choseOperation83
;MyProject.c,295 :: 		operaionIndex=0;
	CLRF       _operaionIndex+0
;MyProject.c,296 :: 		}
L_choseOperation83:
;MyProject.c,297 :: 		}
	GOTO       L_choseOperation84
L_choseOperation82:
;MyProject.c,298 :: 		else if(detectOneEnterClick()){
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_choseOperation85
;MyProject.c,299 :: 		return;
	GOTO       L_end_choseOperation
;MyProject.c,300 :: 		}
L_choseOperation85:
L_choseOperation84:
;MyProject.c,301 :: 		Lcd_Out(1,1,"Operacja:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr21_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,302 :: 		Lcd_Out(2,1,operationsTitles[operaionIndex]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _operaionIndex+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      choseOperation_operationsTitles_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,303 :: 		}
	GOTO       L_choseOperation80
;MyProject.c,305 :: 		}
L_end_choseOperation:
	RETURN
; end of _choseOperation

_calculate:

;MyProject.c,306 :: 		int calculate(){
;MyProject.c,307 :: 		switch(operaionIndex){
	GOTO       L_calculate86
;MyProject.c,308 :: 		case 0:
L_calculate88:
;MyProject.c,309 :: 		return num1+num2;
	MOVF       _num2+0, 0
	ADDWF      _num1+0, 0
	MOVWF      R0+0
	MOVF       _num1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _num2+1, 0
	MOVWF      R0+1
	GOTO       L_end_calculate
;MyProject.c,311 :: 		case 1:
L_calculate89:
;MyProject.c,312 :: 		return num1-num2;
	MOVF       _num2+0, 0
	SUBWF      _num1+0, 0
	MOVWF      R0+0
	MOVF       _num2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _num1+1, 0
	MOVWF      R0+1
	GOTO       L_end_calculate
;MyProject.c,314 :: 		case 2:
L_calculate90:
;MyProject.c,315 :: 		return num1/num2;
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
;MyProject.c,317 :: 		case 3:
L_calculate91:
;MyProject.c,318 :: 		return num1*num2;
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
;MyProject.c,322 :: 		}
L_calculate86:
	MOVF       _operaionIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_calculate88
	MOVF       _operaionIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_calculate89
	MOVF       _operaionIndex+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_calculate90
	MOVF       _operaionIndex+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_calculate91
;MyProject.c,324 :: 		}
L_end_calculate:
	RETURN
; end of _calculate

_convertNumber:

;MyProject.c,326 :: 		void convertNumber(int num,int mode){
;MyProject.c,327 :: 		int index =9;
	MOVLW      9
	MOVWF      convertNumber_index_L0+0
	MOVLW      0
	MOVWF      convertNumber_index_L0+1
;MyProject.c,328 :: 		arr[10]='\0';
	CLRF       _arr+10
;MyProject.c,329 :: 		while(index!=-1){
L_convertNumber92:
	MOVLW      255
	XORWF      convertNumber_index_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber177
	MOVLW      255
	XORWF      convertNumber_index_L0+0, 0
L__convertNumber177:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber93
;MyProject.c,330 :: 		switch(num%mode){
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
	GOTO       L_convertNumber94
;MyProject.c,331 :: 		case 10:
L_convertNumber96:
;MyProject.c,332 :: 		arr[index]='A';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
;MyProject.c,333 :: 		break;
	GOTO       L_convertNumber95
;MyProject.c,334 :: 		case 11:
L_convertNumber97:
;MyProject.c,335 :: 		arr[index]='B';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      66
	MOVWF      INDF+0
;MyProject.c,336 :: 		break;
	GOTO       L_convertNumber95
;MyProject.c,337 :: 		case 12:
L_convertNumber98:
;MyProject.c,338 :: 		arr[index]='C';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
;MyProject.c,339 :: 		break;
	GOTO       L_convertNumber95
;MyProject.c,340 :: 		case 13:
L_convertNumber99:
;MyProject.c,341 :: 		arr[index]='D';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      68
	MOVWF      INDF+0
;MyProject.c,342 :: 		break;
	GOTO       L_convertNumber95
;MyProject.c,343 :: 		case 14:
L_convertNumber100:
;MyProject.c,344 :: 		arr[index]='E';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
;MyProject.c,345 :: 		break;
	GOTO       L_convertNumber95
;MyProject.c,346 :: 		case 15:
L_convertNumber101:
;MyProject.c,347 :: 		arr[index]='F';
	MOVF       convertNumber_index_L0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVLW      70
	MOVWF      INDF+0
;MyProject.c,348 :: 		break;
	GOTO       L_convertNumber95
;MyProject.c,349 :: 		default:
L_convertNumber102:
;MyProject.c,350 :: 		arr[index]='0'+num%mode;
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
;MyProject.c,351 :: 		}
	GOTO       L_convertNumber95
L_convertNumber94:
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber178
	MOVLW      10
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber178:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber96
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber179
	MOVLW      11
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber179:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber97
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber180
	MOVLW      12
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber180:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber98
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber181
	MOVLW      13
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber181:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber99
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber182
	MOVLW      14
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber182:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber100
	MOVLW      0
	XORWF      FLOC__convertNumber+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__convertNumber183
	MOVLW      15
	XORWF      FLOC__convertNumber+1, 0
L__convertNumber183:
	BTFSC      STATUS+0, 2
	GOTO       L_convertNumber101
	GOTO       L_convertNumber102
L_convertNumber95:
;MyProject.c,352 :: 		index--;
	MOVLW      1
	SUBWF      convertNumber_index_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       convertNumber_index_L0+1, 1
;MyProject.c,353 :: 		num/=mode;
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
;MyProject.c,354 :: 		}
	GOTO       L_convertNumber92
L_convertNumber93:
;MyProject.c,355 :: 		}
L_end_convertNumber:
	RETURN
; end of _convertNumber

_choseShift:

;MyProject.c,357 :: 		void choseShift(){
;MyProject.c,358 :: 		char titleSh[6]="MODE:";
	MOVLW      77
	MOVWF      choseShift_titleSh_L0+0
	MOVLW      79
	MOVWF      choseShift_titleSh_L0+1
	MOVLW      68
	MOVWF      choseShift_titleSh_L0+2
	MOVLW      69
	MOVWF      choseShift_titleSh_L0+3
	MOVLW      58
	MOVWF      choseShift_titleSh_L0+4
	CLRF       choseShift_titleSh_L0+5
;MyProject.c,359 :: 		while(1){
L_choseShift103:
;MyProject.c,360 :: 		switch(shiftIndex){
	GOTO       L_choseShift105
;MyProject.c,361 :: 		case 0:
L_choseShift107:
;MyProject.c,362 :: 		Lcd_Out(2,1,"L");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr22_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,363 :: 		break;
	GOTO       L_choseShift106
;MyProject.c,364 :: 		case 1:
L_choseShift108:
;MyProject.c,365 :: 		Lcd_Out(2,1,"R");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr23_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,366 :: 		break;
	GOTO       L_choseShift106
;MyProject.c,367 :: 		}
L_choseShift105:
	MOVF       _shiftIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_choseShift107
	MOVF       _shiftIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_choseShift108
L_choseShift106:
;MyProject.c,368 :: 		if(Keypad_Key_Click()==1){
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_choseShift109
;MyProject.c,369 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,370 :: 		shiftIndex++;
	INCF       _shiftIndex+0, 1
;MyProject.c,371 :: 		if(shiftIndex>1){
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _shiftIndex+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_choseShift110
;MyProject.c,372 :: 		shiftIndex=0;
	CLRF       _shiftIndex+0
;MyProject.c,373 :: 		}
L_choseShift110:
;MyProject.c,374 :: 		}
	GOTO       L_choseShift111
L_choseShift109:
;MyProject.c,375 :: 		else if(detectOneEnterClick()){
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_choseShift112
;MyProject.c,376 :: 		return;
	GOTO       L_end_choseShift
;MyProject.c,377 :: 		}
L_choseShift112:
L_choseShift111:
;MyProject.c,378 :: 		Lcd_Out(1,1,titleSh);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      choseShift_titleSh_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,380 :: 		}
	GOTO       L_choseShift103
;MyProject.c,382 :: 		}
L_end_choseShift:
	RETURN
; end of _choseShift

_doShift:

;MyProject.c,383 :: 		void doShift(){
;MyProject.c,384 :: 		switch(shiftIndex){
	GOTO       L_doShift113
;MyProject.c,385 :: 		case 0:
L_doShift115:
;MyProject.c,386 :: 		switch(dataTypeIndex[0]){
	GOTO       L_doShift116
;MyProject.c,387 :: 		case 0:
L_doShift118:
;MyProject.c,388 :: 		convertNumber(num1<<1,2);
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
;MyProject.c,389 :: 		break;
	GOTO       L_doShift117
;MyProject.c,390 :: 		case 1:
L_doShift119:
;MyProject.c,391 :: 		convertNumber(num1<<1,10);
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
;MyProject.c,392 :: 		break;
	GOTO       L_doShift117
;MyProject.c,393 :: 		case 2:
L_doShift120:
;MyProject.c,394 :: 		convertNumber(num1<<1,8);
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
;MyProject.c,395 :: 		break;
	GOTO       L_doShift117
;MyProject.c,396 :: 		case 3:
L_doShift121:
;MyProject.c,397 :: 		convertNumber(num1<<1,16);
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
;MyProject.c,398 :: 		break;
	GOTO       L_doShift117
;MyProject.c,399 :: 		}
L_doShift116:
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift186
	MOVLW      0
	XORWF      _dataTypeIndex+0, 0
L__doShift186:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift118
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift187
	MOVLW      1
	XORWF      _dataTypeIndex+0, 0
L__doShift187:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift119
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift188
	MOVLW      2
	XORWF      _dataTypeIndex+0, 0
L__doShift188:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift120
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift189
	MOVLW      3
	XORWF      _dataTypeIndex+0, 0
L__doShift189:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift121
L_doShift117:
;MyProject.c,400 :: 		break;
	GOTO       L_doShift114
;MyProject.c,401 :: 		case 1:
L_doShift122:
;MyProject.c,402 :: 		switch(dataTypeIndex[0]){
	GOTO       L_doShift123
;MyProject.c,403 :: 		case 0:
L_doShift125:
;MyProject.c,404 :: 		convertNumber(num1>>1,2);
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
;MyProject.c,405 :: 		break;
	GOTO       L_doShift124
;MyProject.c,406 :: 		case 1:
L_doShift126:
;MyProject.c,407 :: 		convertNumber(num1>>1,10);
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
;MyProject.c,408 :: 		break;
	GOTO       L_doShift124
;MyProject.c,409 :: 		case 2:
L_doShift127:
;MyProject.c,410 :: 		convertNumber(num1>>1,8);
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
;MyProject.c,411 :: 		break;
	GOTO       L_doShift124
;MyProject.c,412 :: 		case 3:
L_doShift128:
;MyProject.c,413 :: 		convertNumber(num1>>1,16);
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
;MyProject.c,414 :: 		break;
	GOTO       L_doShift124
;MyProject.c,415 :: 		}
L_doShift123:
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift190
	MOVLW      0
	XORWF      _dataTypeIndex+0, 0
L__doShift190:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift125
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift191
	MOVLW      1
	XORWF      _dataTypeIndex+0, 0
L__doShift191:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift126
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift192
	MOVLW      2
	XORWF      _dataTypeIndex+0, 0
L__doShift192:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift127
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doShift193
	MOVLW      3
	XORWF      _dataTypeIndex+0, 0
L__doShift193:
	BTFSC      STATUS+0, 2
	GOTO       L_doShift128
L_doShift124:
;MyProject.c,416 :: 		break;
	GOTO       L_doShift114
;MyProject.c,418 :: 		}
L_doShift113:
	MOVF       _shiftIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_doShift115
	MOVF       _shiftIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_doShift122
L_doShift114:
;MyProject.c,419 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,420 :: 		Lcd_Out(2,1,arr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _arr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,421 :: 		}
L_end_doShift:
	RETURN
; end of _doShift

_doConvert:

;MyProject.c,422 :: 		void doConvert(){
;MyProject.c,424 :: 		switch(dataTypeIndex[1]){
	GOTO       L_doConvert129
;MyProject.c,425 :: 		case 0:
L_doConvert131:
;MyProject.c,426 :: 		convertNumber(num1,2);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      2
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,427 :: 		break;
	GOTO       L_doConvert130
;MyProject.c,428 :: 		case 1:
L_doConvert132:
;MyProject.c,429 :: 		convertNumber(num1,10);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      10
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,430 :: 		break;
	GOTO       L_doConvert130
;MyProject.c,431 :: 		case 2:
L_doConvert133:
;MyProject.c,432 :: 		convertNumber(num1,8);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      8
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,433 :: 		break;
	GOTO       L_doConvert130
;MyProject.c,434 :: 		case 3:
L_doConvert134:
;MyProject.c,435 :: 		convertNumber(num1,16);
	MOVF       _num1+0, 0
	MOVWF      FARG_convertNumber_num+0
	MOVF       _num1+1, 0
	MOVWF      FARG_convertNumber_num+1
	MOVLW      16
	MOVWF      FARG_convertNumber_mode+0
	MOVLW      0
	MOVWF      FARG_convertNumber_mode+1
	CALL       _convertNumber+0
;MyProject.c,436 :: 		break;
	GOTO       L_doConvert130
;MyProject.c,438 :: 		}
L_doConvert129:
	MOVLW      0
	XORWF      _dataTypeIndex+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doConvert195
	MOVLW      0
	XORWF      _dataTypeIndex+2, 0
L__doConvert195:
	BTFSC      STATUS+0, 2
	GOTO       L_doConvert131
	MOVLW      0
	XORWF      _dataTypeIndex+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doConvert196
	MOVLW      1
	XORWF      _dataTypeIndex+2, 0
L__doConvert196:
	BTFSC      STATUS+0, 2
	GOTO       L_doConvert132
	MOVLW      0
	XORWF      _dataTypeIndex+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doConvert197
	MOVLW      2
	XORWF      _dataTypeIndex+2, 0
L__doConvert197:
	BTFSC      STATUS+0, 2
	GOTO       L_doConvert133
	MOVLW      0
	XORWF      _dataTypeIndex+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doConvert198
	MOVLW      3
	XORWF      _dataTypeIndex+2, 0
L__doConvert198:
	BTFSC      STATUS+0, 2
	GOTO       L_doConvert134
L_doConvert130:
;MyProject.c,439 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,440 :: 		Lcd_Out(2,1,arr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _arr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,441 :: 		}
L_end_doConvert:
	RETURN
; end of _doConvert

_init_program:

;MyProject.c,442 :: 		void init_program(){
;MyProject.c,443 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;MyProject.c,447 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,448 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,449 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,450 :: 		}
L_end_init_program:
	RETURN
; end of _init_program

_main:

;MyProject.c,451 :: 		void main() {
;MyProject.c,453 :: 		init_program();
	CALL       _init_program+0
;MyProject.c,455 :: 		do{
L_main135:
;MyProject.c,456 :: 		choseMode();
	CALL       _choseMode+0
;MyProject.c,457 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,458 :: 		choseDataTypes();
	CALL       _choseDataTypes+0
;MyProject.c,459 :: 		loadNumbers();
	CALL       _loadNumbers+0
;MyProject.c,460 :: 		switch(modeIndex){
	GOTO       L_main138
;MyProject.c,461 :: 		case 0:
L_main140:
;MyProject.c,462 :: 		choseOperation();
	CALL       _choseOperation+0
;MyProject.c,464 :: 		switch(dataTypeIndex[0]){
	GOTO       L_main141
;MyProject.c,465 :: 		case 0:
L_main143:
;MyProject.c,466 :: 		convertNumber(calculate(),2);
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
;MyProject.c,467 :: 		break;
	GOTO       L_main142
;MyProject.c,468 :: 		case 1:
L_main144:
;MyProject.c,469 :: 		convertNumber(calculate(),10);
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
;MyProject.c,470 :: 		break;
	GOTO       L_main142
;MyProject.c,472 :: 		case 2:
L_main145:
;MyProject.c,473 :: 		convertNumber(calculate(),8);
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
;MyProject.c,474 :: 		break;
	GOTO       L_main142
;MyProject.c,476 :: 		case 3:
L_main146:
;MyProject.c,477 :: 		convertNumber(calculate(),16);
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
;MyProject.c,478 :: 		break;
	GOTO       L_main142
;MyProject.c,480 :: 		}
L_main141:
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main201
	MOVLW      0
	XORWF      _dataTypeIndex+0, 0
L__main201:
	BTFSC      STATUS+0, 2
	GOTO       L_main143
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main202
	MOVLW      1
	XORWF      _dataTypeIndex+0, 0
L__main202:
	BTFSC      STATUS+0, 2
	GOTO       L_main144
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main203
	MOVLW      2
	XORWF      _dataTypeIndex+0, 0
L__main203:
	BTFSC      STATUS+0, 2
	GOTO       L_main145
	MOVLW      0
	XORWF      _dataTypeIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main204
	MOVLW      3
	XORWF      _dataTypeIndex+0, 0
L__main204:
	BTFSC      STATUS+0, 2
	GOTO       L_main146
L_main142:
;MyProject.c,481 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,482 :: 		Lcd_Out(2,1,arr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _arr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,484 :: 		break;
	GOTO       L_main139
;MyProject.c,485 :: 		case 1:
L_main147:
;MyProject.c,486 :: 		doConvert();
	CALL       _doConvert+0
;MyProject.c,487 :: 		break;
	GOTO       L_main139
;MyProject.c,488 :: 		case 2:
L_main148:
;MyProject.c,489 :: 		choseShift();
	CALL       _choseShift+0
;MyProject.c,490 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,492 :: 		if(shiftIndex){
	MOVF       _shiftIndex+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main149
;MyProject.c,493 :: 		doShift();
	CALL       _doShift+0
;MyProject.c,494 :: 		}else
	GOTO       L_main150
L_main149:
;MyProject.c,496 :: 		doShift();
	CALL       _doShift+0
;MyProject.c,497 :: 		}
L_main150:
;MyProject.c,499 :: 		break;
	GOTO       L_main139
;MyProject.c,500 :: 		}
L_main138:
	MOVF       _modeIndex+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main140
	MOVF       _modeIndex+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main147
	MOVF       _modeIndex+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main148
L_main139:
;MyProject.c,501 :: 		while(!detectOneEnterClick());
L_main151:
	CALL       _detectOneEnterClick+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main152
	GOTO       L_main151
L_main152:
;MyProject.c,502 :: 		}while(1);
	GOTO       L_main135
;MyProject.c,504 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
