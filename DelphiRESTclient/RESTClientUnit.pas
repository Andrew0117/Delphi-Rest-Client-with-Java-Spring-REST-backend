unit RESTClientUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  IdHTTP, IdHTTPOverride, uLkJSON;

  const startURL = 'http://localhost:8080';

type
  TSimpleRESTClientForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    idEdit: TEdit;
    nameEdit: TEdit;
    traceMemo: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SimpleRESTClientForm: TSimpleRESTClientForm;

implementation

{$R *.dfm}

procedure TSimpleRESTClientForm.Button1Click(Sender: TObject);
var
  http : TIdHTTP;
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
begin
   traceMemo.Clear;
   
   http := TIdHTTP.Create(nil);

   Json := '{"name" : "' + nameEdit.Text + '"}';
   JsonToSend := TStringStream.Create(Utf8Encode(Json));
  try
    http.AllowCookies := true;
    http.Request.UserAgent := 'Indy Library';
    http.Request.ContentType := 'application/json';
    try
      sResponse := http.Post(startURL + '/orgs/orgs', JsonToSend);
    finally
      FreeAndNil(JsonToSend);
      FreeAndNil(http);
    end;
  except
    on E: Exception do
      ShowMessage('Error on request: '#13#10 + e.Message);
  end;

  traceMemo.Text := sResponse;
end;

procedure TSimpleRESTClientForm.Button2Click(Sender: TObject);
var
  http       : TIdHTTP;
  Json       : string;
  sResponse  : string;
  JsonToSend : TStringStream;
begin
   traceMemo.Clear;

   http := TIdHTTP.Create(nil);

   Json := '{"name" : "' + nameEdit.Text + '"}';
   JsonToSend := TStringStream.Create(Utf8Encode(Json));
  try
    http.AllowCookies := true;
    http.Request.UserAgent := 'Indy Library';
    http.Request.ContentType := 'application/json';
    try
      sResponse := http.Put(startURL + '/orgs/' + idEdit.Text, JsonToSend);
    finally
      FreeAndNil(JsonToSend);
      FreeAndNil(http);
    end;
  except
    on E: Exception do
      ShowMessage('Error on request: '#13#10 + e.Message);
  end;

  traceMemo.Text := sResponse;
end;

procedure TSimpleRESTClientForm.Button3Click(Sender: TObject);
var
  http : TIdHTTPOverride;
begin
   traceMemo.Clear;

   http := TIdHTTPOverride.Create(nil);

   http.AllowCookies := true;
   http.Request.UserAgent := 'Indy Library';
   try
     http.Delete(startURL + '/orgs/' + idEdit.Text);
   except
     on E: Exception do
       ShowMessage('Error on request: '#13#10 + e.Message);
   end;
end;

procedure TSimpleRESTClientForm.Button4Click(Sender: TObject);
var
  http         : TIdHTTP;
  jsonString   : UTF8String;
  memoryStream : TMemoryStream;
  lkJSONbase   : TlkJSONbase;
begin
   traceMemo.Clear;

   http := TIdHTTP.Create(nil);
   memoryStream := TMemoryStream.Create();
  try
    http.AllowCookies := true;
    http.Request.UserAgent := 'Indy Library';
    http.Request.ContentType := 'application/json';
    try
      http.Get(startURL + '/orgs/' + idEdit.Text, memoryStream);

      memoryStream.Position := 0;
      SetLength(jsonString, memoryStream.size);
      memoryStream.ReadBuffer(jsonString[1], memoryStream.Size);

      lkJSONbase := TlkJSON.ParseText(jsonString);

      // Fill object
      traceMemo.Lines.Add(lkJSONbase.Field['id'].Value);
      traceMemo.Lines.Add(lkJSONbase.Field['name'].Value);
    finally
      FreeAndNil(memoryStream);
      FreeAndNil(lkJSONbase);
      FreeAndNil(http);
    end;
  except
    on E: Exception do
      ShowMessage('Error on request: '#13#10 + e.Message);
  end;

  traceMemo.Lines.Add(jsonString);
end;

procedure TSimpleRESTClientForm.Button5Click(Sender: TObject);
var
  http         : TIdHTTP;
  jsonString   : UTF8String;
  memoryStream : TMemoryStream;
  lkJSONbase   : TlkJSONbase;
  i            : Integer;
  item         : TlkJSONbase;
begin
   traceMemo.Clear;

   http := TIdHTTP.Create(nil);
   memoryStream := TMemoryStream.Create();
  try
    http.AllowCookies := true;
    http.Request.UserAgent := 'Indy Library';
    http.Request.ContentType := 'application/json';
    try
      http.Get(startURL + '/orgs/orgs', memoryStream);

      memoryStream.Position := 0;
      SetLength(jsonString, memoryStream.size);
      memoryStream.ReadBuffer(jsonString[1], memoryStream.Size);

      lkJSONbase := TlkJSON.ParseText(jsonString);

      for i := 0 to pred(lkJSONbase.Count) do begin
        item:=TlkJSONObject(lkJSONbase).child[i];
        // Fill objects array
        traceMemo.Lines.Add(item.Field['id'].Value);
        traceMemo.Lines.Add(item.Field['name'].Value);
      end;
    finally
      FreeAndNil(memoryStream);
      FreeAndNil(lkJSONbase);
      FreeAndNil(http);
    end;
  except
    on E: Exception do
      ShowMessage('Error on request: '#13#10 + e.Message);
  end;
  traceMemo.Lines.Add(jsonString);
end;

end.
