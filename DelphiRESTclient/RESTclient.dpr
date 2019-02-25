program RESTclient;

uses
  Forms,
  RESTClientUnit in 'RESTClientUnit.pas' {SimpleRESTClientForm},
  IdHTTPOverride in '..\Indy\IdHTTPOverride.pas',
  uLkJSON in '..\lkJSON-1.07\uLkJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSimpleRESTClientForm, SimpleRESTClientForm);
  Application.Run;
end.
