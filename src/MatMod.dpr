program MatMod;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Frame2: TFrame},
  MatModUtil in 'MatModUtil.pas';

{$E exe}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'МатМод';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
