#line 1 "C:/Users/karol/OneDrive/studia_semestr_4/Programowanie mikrokontrolerów 2/Programowanie_mikrokontrolerow-projekt/Code/MyProject.c"

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

char keypadPort at PORTD;

char modes[][6]={"ARIT","CONV","SHIF","MODE:"};
char dataTypes[][4]={"BIN","DEC","OCT","HEX"};
char operationsTitles[][2]={"+","-","/","*"};

short modeIndex=0;
int dataTypeIndex[2];
short operaionIndex=0;
short shiftIndex=0;

short clickedKey;

short enterPushed = 0;

int num1=0;
int num2=0;

short numbers[2];

int detectOneEnterClick(){
 if(PORTA.B4 ==0b1){
 if(enterPushed == 0){
 enterPushed = 1;
 return 1;
 }
 }else{
 enterPushed = 0;
 }
 return 0;
}
void choseMode(){
 Lcd_Cmd(_LCD_CLEAR);
 while(1){

 if(Keypad_Key_Click()==1){
 Lcd_Cmd(_LCD_CLEAR);
 modeIndex++;
 if(modeIndex>2){
 modeIndex=0;
 }
 }
 else if(detectOneEnterClick()){
 return;
 }
 Lcd_Out(1,1,modes[3]);
 switch(modeIndex){
 case 0:
 Lcd_Out(2,1,modes[0]);
 break;
 case 1:
 Lcd_Out(2,1,modes[1]);
 break;
 case 2:
 Lcd_Out(2,1,modes[2]);
 break;


 }
 }

}
int setType(char title[],int index){
 if(Keypad_Key_Click()==1){
 Lcd_Cmd(_LCD_CLEAR);
 dataTypeIndex[index]++;
 if(dataTypeIndex[index]>3){
 dataTypeIndex[index]=0;
 }
 }
 else if(detectOneEnterClick()){
 return 1;
 }
 Lcd_Out(1,1,title);
 Lcd_Out(2,1,dataTypes[dataTypeIndex[index]]);
 return 0;
}
void choseDataTypes(){
 if(modeIndex==0||modeIndex==2){
 while(!setType("IN TYPE:",0));
 }
 else{
 while(!setType("IN TYPE:",0));
 while(!setType("OUT TYPE:",1));

 }

}
int loadNumValue(int type){
 int tmp=0;
 long val =1;
 short pos=16;
 short key;
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"NUM:");
 while(1){
 do {
 if(detectOneEnterClick())return tmp;
 key = Keypad_Key_Click();
 }while(!key);
 switch(key){
 case 14:
 Lcd_Out(2,pos,"0");
 pos--;
 val*=type;
 break;
 case 1:
 Lcd_Out(2,pos,"1");
 pos--;
 tmp += val;
 val*=type;
 break;
 }
 if(pos<6)return tmp;
 if(type==2)continue;
 switch(key){

 case 2:
 Lcd_Out(2,pos,"2");
 pos--;
 tmp += val*2;
 val*=type;
 break;
 case 3:
 Lcd_Out(2,pos,"3");
 pos--;
 tmp += val*3;
 val*=type;
 break;
 case 5:
 Lcd_Out(2,pos,"4");
 pos--;
 tmp += val*4;
 val*=type;
 break;
 case 6:
 Lcd_Out(2,pos,"5");
 pos--;
 tmp += val*5;
 val*=type;
 break;
 case 7:
 Lcd_Out(2,pos,"6");
 pos--;
 tmp += val*6;
 val*=type;
 break;
 case 9:
 Lcd_Out(2,pos,"7");
 pos--;
 tmp += val*7;
 val*=type;
 break;
 }
 if(pos<6)return tmp;
 if(type==8)continue;

 switch(key){
 case 10:
 Lcd_Out(2,pos,"8");
 pos--;
 tmp += val*8;
 val*=type;
 break;
 case 11:
 Lcd_Out(2,pos,"9");
 pos--;
 tmp += val*9;
 val*=type;
 break;

 }
 if(pos<6)return tmp;
 switch(key){
 case 4:
 Lcd_Out(2,pos,"A");
 pos--;
 tmp += val*10;
 val*=type;
 break;
 case 8:
 Lcd_Out(2,pos,"B");
 pos--;
 tmp += val*11;
 val*=type;
 break;
 case 12:
 Lcd_Out(2,pos,"C");
 pos--;
 tmp += val*12;
 val*=type;
 break;
 case 16:
 Lcd_Out(2,pos,"D");
 pos--;
 tmp += val*13;
 val*=type;
 break;
 case 15:
 Lcd_Out(2,pos,"E");
 pos--;
 tmp += val*14;
 val*=type;
 break;
 case 13:
 Lcd_Out(2,pos,"F");
 pos--;
 tmp += val*15;
 val*=type;
 break;
 }
 if(pos<6){

 return tmp;
 }
 }


}
void loadNumbers(){

 if(modeIndex==1||modeIndex==2){

 if(dataTypeIndex[0]==0){
 num1=loadNumValue(2);
 }
 else if(dataTypeIndex[0]==1){
 num1=loadNumValue(10);

 }
 else if(dataTypeIndex[0]==2){
 num1=loadNumValue(8);

 }else if(dataTypeIndex[0]==3){
 num1=loadNumValue(16);
 }
 Lcd_Cmd(_LCD_CLEAR);
 }
 else{
 if(dataTypeIndex[0]==0){
 num1=loadNumValue(2);
 Lcd_Cmd(_LCD_CLEAR);
 num2=loadNumValue(2);
 }
 else if(dataTypeIndex[0]==1){
 num1=loadNumValue(10);
 Lcd_Cmd(_LCD_CLEAR);
 num2=loadNumValue(10);
 }
 else if(dataTypeIndex[0]==2){
 num1=loadNumValue(8);
 Lcd_Cmd(_LCD_CLEAR);
 num2=loadNumValue(8);

 }else if(dataTypeIndex[0]==3){
 num1=loadNumValue(16);
 Lcd_Cmd(_LCD_CLEAR);
 num2=loadNumValue(16);
 }
 Lcd_Cmd(_LCD_CLEAR);
 }
}

void choseOperation(){
 while(1){

 if(Keypad_Key_Click()==1){
 Lcd_Cmd(_LCD_CLEAR);
 operaionIndex++;
 if(operaionIndex>3){
 operaionIndex=0;
 }
 }
 else if(detectOneEnterClick()){
 return;
 }
 Lcd_Out(1,1,"Operacja:");
 Lcd_Out(2,1,operationsTitles[operaionIndex]);
 }

}
int calculate(){
 switch(operaionIndex){
 case 0:
 return num1+num2;
 break;
 case 1:
 return num1-num2;
 break;
 case 2:
 return num1/num2;
 break;
 case 3:
 return num1*num2;
 break;


 }

}
char arr[11]="";
void convertNumber(int num,int mode){
 int index =9;
 arr[10]='\0';
 while(index!=-1){
 switch(num%mode){
 case 10:
 arr[index]='A';
 break;
 case 11:
 arr[index]='B';
 break;
 case 12:
 arr[index]='C';
 break;
 case 13:
 arr[index]='D';
 break;
 case 14:
 arr[index]='E';
 break;
 case 15:
 arr[index]='F';
 break;
 default:
 arr[index]='0'+num%mode;
 }
 index--;
 num/=mode;
 }
}

 void choseShift(){
 while(1){
 switch(shiftIndex){
 case 0:
 Lcd_Out(2,1,"L");
 break;
 case 1:
 Lcd_Out(2,1,"R");
 break;
 }
 if(Keypad_Key_Click()==1){
 Lcd_Cmd(_LCD_CLEAR);
 shiftIndex++;
 if(shiftIndex>1){
 shiftIndex=0;
 }
 }
 else if(detectOneEnterClick()){
 return;
 }
 Lcd_Out(1,1,modes[3]);

 }

 }
 void doShift(){
 switch(shiftIndex){
 case 0:
 switch(dataTypeIndex[0]){
 case 0:
 convertNumber(num1<<1,2);
 break;
 case 1:
 convertNumber(num1<<1,10);
 break;
 case 2:
 convertNumber(num1<<1,8);
 break;
 case 3:
 convertNumber(num1<<1,16);
 break;
 }
 break;
 case 1:
 switch(dataTypeIndex[0]){
 case 0:
 convertNumber(num1>>1,2);
 break;
 case 1:
 convertNumber(num1>>1,10);
 break;
 case 2:
 convertNumber(num1>>1,8);
 break;
 case 3:
 convertNumber(num1>>1,16);
 break;
 }
 break;
 break;
 }
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2,1,arr);
 }
void doConvert(){

 switch(dataTypeIndex[1]){
 case 0:
 convertNumber(num1,2);
 break;
 case 1:
 convertNumber(num1,10);
 break;
 case 2:
 convertNumber(num1,8);
 break;
 case 3:
 convertNumber(num1,16);
 break;

 }
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2,1,arr);
}
void init_program(){
 ANSELA = 0;
 ANSELB = 0;
 ANSELD = 0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Keypad_Init();
}
void main() {

 init_program();
 while(1){
 choseMode();
 Lcd_Cmd(_LCD_CLEAR);
 choseDataTypes();
 loadNumbers();
 switch(modeIndex){
 case 0:
 choseOperation();

 switch(dataTypeIndex[0]){
 case 0:
 convertNumber(calculate(),2);
 break;
 case 1:
 convertNumber(calculate(),10);
 break;

 case 2:
 convertNumber(calculate(),8);
 break;

 case 3:
 convertNumber(calculate(),16);
 break;

 }
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2,1,arr);

 break;
 case 1:
 doConvert();
 break;
 case 2:
 choseShift();
 Lcd_Cmd(_LCD_CLEAR);

 if(shiftIndex){
 doShift();
 }else
 {
 doShift();
 }

 break;
 }
 while(!detectOneEnterClick());
 }
}
