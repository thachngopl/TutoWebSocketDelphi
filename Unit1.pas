unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  IdWebsocketServer, IdHTTPWebsocketClient, superobject, IdSocketIOHandling,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    LabelConnect: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  client: TIdHTTPWebsocketClient;

const
  C_CLIENT_EVENT = 'CLIENT_TO_SERVER_EVENT_TEST';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  client := TIdHTTPWebsocketClient.Create(Self);
  client.Port := 5010;
  client.Host := 'localhost';
  client.Connect;

end;

function GetValue(const AData: String;Key: String): String;
var
  JSON: ISuperObject;
  rowItem: ISuperObject;
  ADataStringStream: TStringStream;
begin
  ADataStringStream := TStringStream.Create(AData);
  JSON := TSuperObject.ParseStream(ADataStringStream, False);

    Result := JSON.AsString;

end;

end.
