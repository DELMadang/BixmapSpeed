unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    Image1: TImage;
    eMemo: TMemo;
    btnPixel: TButton;
    btnScanline: TButton;
    procedure btnPixelClick(Sender: TObject);
    procedure btnScanlineClick(Sender: TObject);
  private
    procedure Test1;
    procedure Test2;
  public
    procedure Run(const AName: string; const AProc: TProc);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  System.Diagnostics,
  System.Math;

{ TForm1 }

procedure TfrmMain.btnPixelClick(Sender: TObject);
begin
  Run(
    'Use Pixel',
    procedure
    begin
      Test1();
    end
  );
end;

procedure TfrmMain.Test1;
begin
  var LBitmap := TBitmap.Create(800, 600);
  try
    LBitmap.PixelFormat := pf8bit;
    for var row := 0 to 599 do
      for var col := 0 to 799 do
        LBitmap.Canvas.Pixels[col, row] := RGB(Random(255), Random(255), Random(255));

    Image1.Picture.Bitmap.Assign(LBitmap);
  finally
    LBitmap.Free;
  end;
end;

procedure TfrmMain.Test2;
begin
  var LBitmap := TBitmap.Create(800, 600);
  try
    LBitmap.PixelFormat := pf8bit;

    var LData: TBytes;
    SetLength(LData, 800 * 600);

    for var i := 0 to High(LData) do
      LData[i] := Byte(RGB(Random(255), Random(255), Random(255)));;

    var LPointer := LBitmap.ScanLine[599];
    Move(PByte(LData)^, LPointer^, 800 * 600);
    Image1.Picture.Bitmap.Assign(LBitmap);
  finally
    LBitmap.Free;
  end;
end;

procedure TfrmMain.btnScanlineClick(Sender: TObject);
begin
  Run(
    'Use Scanline',
    procedure
    begin
      Test2();
    end
  );
end;

procedure TfrmMain.Run(const AName: string; const AProc: TProc);
begin
  var LStopWatch := TStopWatch.StartNew;
  try
    AProc();
  finally
    LStopWatch.Stop;
    eMemo.Lines.Add(AName + ', Ellipse TimeL ' + LStopWatch.ElapsedMilliseconds.ToString + ' ms');
  end;
end;

initialization
  Randomize;
end.
