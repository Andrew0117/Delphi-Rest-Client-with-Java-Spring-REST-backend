unit IdHTTPOverride;

interface

uses IdHTTP, classes;

type
  TIdHTTPOverride = class(TIdHTTP)
  public
    constructor Create(AOwner: TComponent); override;
    procedure Delete(AURL: string; AResponseContent: TStream); overload;
    function Delete(AURL: string): string; overload;
  end;

implementation

{ TIdHTTPOverload }

constructor TIdHTTPOverride.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TIdHTTPOverride.Delete(AURL: string; AResponseContent: TStream);
begin
  DoRequest(hmDelete, AURL, nil, AResponseContent);
end;

function TIdHTTPOverride.Delete(AURL: string): string;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    Delete(AURL, Stream);
    SetLength(Result, Stream.Size);
    Move(PChar(Stream.Memory)^, PChar(Result)^, Stream.Size);
  finally
    Stream.Free;
  end;
end;

end.
