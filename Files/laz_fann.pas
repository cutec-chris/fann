{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit laz_fann; 

interface

uses
  FannNetwork, FANN, LazarusPackageIntf;

implementation

procedure Register; 
begin
  RegisterUnit( 'FannNetwork', @FannNetwork.Register); 
end; 

initialization
  RegisterPackage( 'laz_fann', @Register); 
end.
