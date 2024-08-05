object Form1: TForm1
  Left = 583
  Top = 297
  Width = 428
  Height = 327
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 8
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Find Nivel'
    TabOrder = 0
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 0
    Top = 0
    Width = 409
    Height = 249
    TabOrder = 1
  end
  object btn2: TButton
    Left = 96
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Set Nivel'
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 192
    Top = 256
    Width = 75
    Height = 25
    Caption = 'measure'
    TabOrder = 3
    OnClick = btn3Click
  end
  object cmprt1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnRxChar = cmprt1RxChar
    Left = 88
    Top = 136
  end
end
