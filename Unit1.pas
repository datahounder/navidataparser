



unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPort, StdCtrls, CPortCtl, sEdit;

type
  TForm1 = class(TForm)
    btn1: TButton;
    mmo1: TMemo;
    cmprt1: TComPort;
    btn2: TButton;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure cmprt1RxChar(Sender: TObject; Count: Integer);
    procedure SendSMS(AMsg: string);
   // procedure cmprt1RxFlag(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn3Click(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Speed: integer = 9600;
  Byte1: DWORD;
  Byte2: DWORD;
  wait: boolean;

implementation

{$R *.dfm}

procedure Tform1.SendSMS(AMsg: string);
VAR
  i: integer;
  s:string;
begin
   try
   AMsg:=  StringReplace(Amsg,' ','',[rfReplaceAll]);
      for i := 1 to length(AMsg) div 2 do begin
        s :=  s + Char(StrToInt('$'+Copy(AMsg,(i-1)*2+1,2)));
      end;
   cmprt1.WriteStr(s+char($0D)+char($0A));
                     finally

  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
cmprt1.Open;
cmprt1.Connected:=true;


SendSMS('16 02 4e 31 43 31 20 52 42 20 44 03 0d 0a');
SendSMS('16 02 4e 32 43 31 20 52 42 20 44 03 0d 0a');
SendSMS('16 02 4e 33 43 31 20 52 42 20 44 03 0d 0a');
SendSMS('16 02 4e 34 43 31 20 52 42 20 44 03 0d 0a');

end;

procedure Delay(dwMilliseconds: Longint);
var
  iStart, Istop: DWORD;
  begin
    iStart:=GetTickCount;
    repeat
      istop:=gettickcount;
      application.ProcessMessages;
      until (istop -istart) >= DWORD(dwMilliseconds);
  end;

procedure TForm1.cmprt1RxChar(Sender: TObject; Count: Integer);
var
  str: string;
begin
  cmprt1.ReadStr(str, count);
  mmo1.Lines.Add(str);
  btn2.Visible:=true;
  end;






procedure TForm1.btn2Click(Sender: TObject);
var
str: string;
begin
   SendSMS('16 02 4e 34 43 31 20 52 53 20 43 03 0d 0a');  //..N4C1 RS C...
    delay(500);
   SendSMS('16 02 4e 34 43 31 20 52 53 20 4d 03 0d 0a'); //..N4C1 RS M...
   delay(500);
   SendSMS('16 02 4e 34 43 31 20 47 20 41 03 0d 0a');  // ..N4C1 G A...
    delay(500);
   SendSMS('16 02 4e 34 43 31 20 52 42 20 49 03 0d 0a');  // ..N4C1 RB I...
 delay(500);
   SendSMS('16 02 4e 34 43 31 20 52 20 4e 03 0d 0a');  // ..N4C1 R N...
    delay(500);
   SendSMS('16 02 4e 34 43 31 20 52 42 20 41 03 0d 0a');  // ..N4C1 RB A...
   delay(500);
   SendSMS('16 02 4e 34 43 31 20 52 53 20 4d 03 0d 0a');  // ..N4C1 RS M...
    delay(500);
   SendSMS('16 02 4e 34 43 31 20 52 50 20 4f 58 03 0d 0a');  // ..N4C1 RP OX...
    delay(500);
   SendSMS('16 02 4e 34 43 31 20 52 50 20 4f 59 03 0d 0a');  // ..N4C1 RP OY...
    delay(500);
   SendSMS('16 02 4e 34 43 31 20 52 50 20 4f 54 03 0d 0a');  // ..N4C1 RP OT...
    delay(500);
    btn3.Visible:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    btn2.Visible:=false;
    wait:=false;
    btn3.Visible:=false;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cmprt1.Connected:=false;
  cmprt1.Close;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
wait:= not wait;
while not wait  do
begin
  SendSMS('16 02 4e 34 43 31 20 47 20 41 03 0d 0a');  // ..N4C1 G A...
  delay(500);

end;
   end;
END.

{SendSMS('N4C1 RS C');
SendSMS('N4C1 RS M');
SendSMS('N4C1 G A');
SendSMS('N4C1 RB I');
SendSMS('N4C1 R N');
SendSMS('N4C1 RB A');
SendSMS('N4C1 RS M');
SendSMS('N4C1 RS M');
SendSMS('N4C1 RP OX');
SendSMS('N4C1 RP OY');
SendSMS('N4C1 RP OZ');   }

  {procedure TForm1.cmprt1RxFlag(Sender: TObject);
VAR

  count: integer;
   str: string;
begin
     cmprt1.ReadStr(str, count);
    mmo1.Lines.Add(str);
end;    }


{procedure init;
var
  COMDCB: DCB;
  COMTimes: COMMTIMEOUTS;
  begin
    if (HCom<>INVALID_HANDLE_VALUE)    then
    begin
      FileClose(HCom);
      HCom:=INVALID_HANDLE_VALUE;
          end;
      HCom:=CreateFile(PChar('COM'+inttostr(CN)), (GENERIC_READ or GENERIC_WRITE), 0, NIL, OPEN_EXISTING, 0, 0);
      IF(HCom<>INVALID_HANDLE_VALUE)       then
      begin
        PurgeComm(HCom, PURGE_TXABORT or PURGE_RXABORT or PURGE_TXCLEAR or PURGE_RXCLEAR);
        if(GetCommState(HCom, COMDCB)=false) or (GetCommTimeouts(HCom, COMTimes)=false) then
        begin
          FileClose(HCom);
          HCom:=INVALID_HANDLE_VALUE;
          Showmessage('Otkazano v dostupe k COM'+Inttostr(CN));
          exit;

                  end;
      end;
      Comtimes.ReadIntervalTimeout:=0;
      Comtimes.ReadTotalTimeoutMultiplier:=0;
      Comtimes.ReadTotalTimeoutConstant:=0;
      Comtimes.WriteTotalTimeoutMultiplier:=0;
      Comtimes.WriteTotalTimeoutConstant:=0;
     if not  SetupComm(Hcom, byte1, byte2)   then
   begin
        Showmessage('nastroiki buffera ne proshli');
   end;

      COMDCB.BaudRate:=Speed;

      COMDCB.XonLim:=2048;
      COMDCB.XoffLim:=512;
      EscapeCommFunction(HCom, CLRRTS);
      EscapeCommFunction(HCom, SETDTR);
      COMDCB.EofChar:=#0;
      COMDCB.ErrorChar:=#0;
      COMDCB.EvtChar:=#3;
      COMDCB.XonChar:=#17;
      COMDCB.XoffChar:=#19;
      SetCommMask(Hcom, EV_RING and EV_RXCHAR and EV_RXFLAG);
      COMDCB.Flags:=COMDCB.Flags or (DTR_CONTROL_HANDSHAKE shl 11) or (RTS_CONTROL_HANDSHAKE shl 12);
      COMDCB.XonLim:=100;
      COMDCB.XoffLim:=100;
      COMDCB.ByteSize:=BS;
      COMDCB.Parity:=NOPARITY;
      COMDCB.StopBits:=1;
      setcommstate(HCom, COMDCB);
       end; }
