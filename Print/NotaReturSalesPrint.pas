unit NotaReturSalesPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, StrUtils, Math,
  AutoBengkel, UMaster, UTransaction;

type
  TqrpNotaReturSales = class(TQuickRep)
    TitleBand1: TQRBand;
    SummaryBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    qrlTitle: TQRLabel;
    qrShapeKiriNomor: TQRShape;
    qrShapeKiriNama: TQRShape;
    qrShapeKiriQty: TQRShape;
    qrShapeKiriPrice: TQRShape;
    qrShapeKiriAMount: TQRShape;
    qrlNomor: TQRLabel;
    qrlNama: TQRLabel;
    qrlQty: TQRLabel;
    qrlPrice: TQRLabel;
    qrlAMount: TQRLabel;
    qrShapeKananAmount: TQRShape;
    qrShapeTopBottom: TQRShape;
    QRLabel1: TQRLabel;
    qrSumTotal: TQRLabel;
    qrlRow: TQRLabel;
    qrlRealRow: TQRLabel;
    QRMemo1: TQRMemo;
    qrShapeKiriDisc: TQRShape;
    qrlDisc: TQRLabel;
    qrShapeKiriNett: TQRShape;
    qrlNett: TQRLabel;
    qrShapeKiriCode: TQRShape;
    qrlCode: TQRLabel;
    qrlSumDisc: TQRLabel;
    qrlSumNett: TQRLabel;
    adoMaster: TADOQuery;
    adoMasterShip_id: TLargeintField;
    adoMasterShip_Num: TStringField;
    adoMasterShip_Type: TStringField;
    adoMasterUser_insert: TStringField;
    adoMasterShip_Date: TDateTimeField;
    adoMasterPerson_id: TLargeintField;
    adoMasteraddress: TStringField;
    adoMastercity: TStringField;
    adoMasterPhone1: TStringField;
    adoMastertotal: TBCDField;
    adoMasterNotes: TStringField;
    adoMasteritem_id: TLargeintField;
    adoMasteritem_code: TStringField;
    adoMasteritem_name: TStringField;
    adoMasterquantity: TFloatField;
    adoMasterprice_tampil: TBCDField;
    adoMasterAmount: TBCDField;
    adoMastertipe: TStringField;
    adoMasterdetail_seq: TLargeintField;
    adoMastermekanik: TStringField;
    adoMasterPerson_name: TStringField;
    adoMasterPerson_code: TStringField;
    adoMastermotor_name: TStringField;
    adoMastermtr_year: TIntegerField;
    adoMastermtr_rangka: TStringField;
    adoMastermtr_mesin: TStringField;
    adoMasterdiscount: TFloatField;
    adoMastermaster_discount: TBCDField;
    adoMastersubtotal: TBCDField;
    qrlCompany: TQRLabel;
    qrlMoto: TQRLabel;
    qrlAddress: TQRLabel;
    qrMemoInfo: TQRMemo;
    qrlSUmDp: TQRLabel;
    adoMasterdown_payment: TBCDField;
    qrlNetto: TQRLabel;
    adoMasteris_post: TSmallintField;
    QRSysData1: TQRSysData;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
//    OfferFilter: TOffer_Arr;
    isDetail: Boolean;
    vTipe : string;
    gNoUrut,vRealRow,vTotalRecord,vTampungan,vPosisiRecord,vRow,vCounterKosong: Integer;
    vTotal,vGrantTotal,vTotalTransisi :Double;
    vDisc, vGrandDisc, vDiscTransisi,
    vNett, vGrantNett, vNettTransisi : Double;
    function NeoLoadData(AOfferSeq:integer): Boolean;
    procedure SetFooterBand;
    procedure SetColumHeader(AType:String);
    procedure SetColumHeaderAll(AType:string);
    procedure SetDetailAll(ANomor:integer;ANama,ACode:string;AQty,APrice,AAMount,ADisc:real;AType:string);
    procedure SetDetail(ANomor:integer;ANama:string;AKonversi,AQty,APrice,AAMount:real;AType:string);
    procedure SetEmpty(AType:string);
    procedure SetFooter(AType:string;ATotal,ADisc,ANett:Double);
  public
//    procedure Executes(AOfferArr: TOffer_Arr; ADetail: Boolean);
    procedure Executes(AServiceSeq:integer);
  end;

var
  qrpNotaReturSales: TqrpNotaReturSales;

implementation

uses SQLServerConnections, un_ryu, UConst;

const TOTAL_ROW = 40;
      ROW_BARU  = 48;
      BATAS_EMPTY = 1;
{$R *.DFM}

{ TqrpRekapPO }

{procedure TqrpOfferGabungObject.Executes(AOfferArr: TOffer_Arr; ADetail: Boolean);
begin
  OfferFilter := AOfferArr;
  isDetail := ADetail;
  DetailBand1.Enabled := ADetail;
  QRBand1.Enabled     := ADetail;
  ReportTitle := qrlTitle.Caption;
  if NeoLoadData(0) then
    PreviewModal
  else
    Inform(MSG_NO_DATA_FOUND);
end;
 }
procedure TqrpNotaReturSales.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  gNoUrut := 0;
  vTotal := 0; vDisc := 0; vNett := 0;
  vGrantTotal := 0; vGrandDisc:=0; vGrantNett:=0;
  vTotalTransisi := 0;vDiscTransisi:=0; vNettTransisi:=0;
  vRealRow :=  0;
  vCounterKosong :=0;
  vPosisiRecord := 0;
  adoMaster.First;
  vRow := 0;
  vTipe := '';
end;

procedure TqrpNotaReturSales.QRDBText14Print(sender: TObject; var Value: String);
begin
  if Value <> '' then
    gNoUrut := gNoUrut + 1;
    Value := IntToStr(gNoUrut);
end;

function TqrpNotaReturSales.NeoLoadData(AOfferSeq:integer): Boolean;
var
  Sql: String;
begin
//  vFilter := '';
//  if AOfferSeq <> 0 then
  //  vFilter := vFilter + ' AND S.ship_id ='+FormatSQLNumber(AOfferSeq);



  Sql := 'SELECT S.Ship_id, S.Ship_Num, S.Ship_Type, S.User_insert, S.Ship_Date, '+
          ' S.Person_id, P.Person_name, P.address,p.city, P.Phone1,S.total,   S.Notes, '+
          ' b.item_id, i.item_code, i.item_name, d.quantity, d.price as price_tampil,'+
          ' d.Amount, ''B'' as tipe, item_detail_id as detail_seq,dbo.get_mekanik(s.mekanik_id) as mekanik,p.Person_code,'+
          ' m.motor_name, p.mtr_year, p.mtr_rangka, p.mtr_mesin, d.discount, s.down_payment '+
          ' FROM Shipment s, Persons P, item_balance b, item_detail d, items i, motor m'+
          ' WHERE S.Person_id = P.Person_id AND m.motor_id = p.motor_id and '+
          ' S.Ship_id = d.Ship_id and d.item_balance_id = b.item_balance_id and b.item_id = i.item_id';
    //       vFilter;
    {      ' UNION '+
          '   SELECT S.Ship_id, S.Ship_Num, S.Ship_Type, S.User_insert, S.Ship_Date,'+
          ' S.Person_id, P.person_name, P.address,p.city, P.Phone1,S.total,  S.Notes,'+
          ' v.service_id, v.service_code, v.service_name, d.quantity, d.price as price_tampil, '+
          ' d.Amount, ''S'' as tipe,service_detail_id as detail_seq,dbo.get_mekanik(s.mekanik_id) as mekanik,p.Person_code '+
          ' FROM Shipment S, Persons P, service_detail d, services v '+
          ' WHERE S.Person_id = P.Person_id AND '+
          ' S.Ship_id = d.Ship_id and d.service_id =v.service_id '+
           vFilter;}

  Sql := 'SELECT TOP 100 PERCENT s.ship_id, s.ship_num, s.ship_type, s.user_insert, s.ship_date, s.person_id, P.person_name, P.address, P.city, P.phone1, s.total, '+
         ' s.notes, b.item_id, i.item_code, i.item_name, d.quantity, d.price AS price_tampil, d.amount, ''B'' AS tipe, d.item_detail_id AS detail_seq, '+
          ' dbo.get_mekanik(s.mekanik_id) AS mekanik, P.person_code, m.motor_name, P.mtr_year, P.mtr_rangka, P.mtr_mesin, d.discount,s.discount, '+
          's.discount as master_discount, s.subtotal, s.down_payment, s.is_post '+
          ' FROM dbo.Shipment s INNER JOIN '+
           '  dbo.Persons P ON s.person_id = P.person_id INNER JOIN '+
           '  dbo.Item_Detail d ON s.ship_id = d.ship_id INNER JOIN '+
           '  dbo.Item_Balance b ON d.item_balance_id = b.item_balance_id INNER JOIN '+
           '  dbo.Items i ON b.item_id = i.item_id LEFT OUTER JOIN '+
           '  dbo.Motor m ON P.motor_id = m.motor_id '+
            ' WHERE     (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')'+
           ' UNION ALL '+
           ' SELECT TOP 100 PERCENT s.ship_id, s.ship_num, s.ship_type, s.user_insert, s.ship_date, s.person_id, '+
           ' P.person_name, P.address, P.city, P.phone1, s.total,  s.notes, d.item_id, i.item_code, i.item_name, d.quantity,'+
           ' d.price AS price_tampil, d.amount, ''B'' AS tipe, d.dump_id AS detail_seq,  dbo.get_mekanik(s.mekanik_id) AS mekanik,'+
           '  P.person_code, m.motor_name, P.mtr_year, P.mtr_rangka, P.mtr_mesin, d.discount,s.discount, s.discount as master_discount,'+
           '  s.subtotal, s.down_payment, s.is_post'+
           ' FROM dbo.Shipment s INNER JOIN   dbo.Persons P ON s.person_id = P.person_id'+
           ' INNER JOIN   dbo.dummy_Item_Detail d ON s.ship_id = d.ship_id'+
           ' INNER JOIN   dbo.Items i ON d.item_id = i.item_id LEFT OUTER JOIN   dbo.Motor m ON P.motor_id = m.motor_id'+
             ' WHERE     (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')';

  Sql := Sql + ' Order By s.ship_id,ship_date,tipe, detail_seq ';
  adoMaster.Connection := myConnection.ADOConnection;
  adoMaster.Close;
  adoMaster.SQL.Clear;
  adoMaster.SQL.Text := Sql;
  adoMaster.Open;
  vTotalRecord := adoMaster.RecordCount;
  vTampungan := vTotalRecord + 5;
  Result := adoMaster.RecordCount <> 0;
  ReportTitle := qrlTitle.Caption;
  qrlNetto.Caption := IfThen(adoMasteris_post.Value=TRUE_VALUE,'Netto','Sisa');
end;

procedure TqrpNotaReturSales.QRDBText9Print(sender: TObject; var Value: String);
begin
  Value := Value + ' Hari';
end;


procedure TqrpNotaReturSales.SetFooterBand;
begin
  qrlSUmDp.Caption   := FloatToStrFmt2(adoMasterdown_payment.Value);
  qrSumTotal.Caption := FloatToStrFmt2(adoMastersubtotal.Value);// vGrantTotal);//adoMastertotal.Value);
  qrlSumDisc.Caption := FloatToStrFmt2(adoMastermaster_discount.Value); //vGrandDisc);
  qrlSumNett.Caption := FloatToStrFmt2(adoMastertotal.Value); //vGrantNett);
end;

procedure TqrpNotaReturSales.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  SetFooterBand;
end;

procedure TqrpNotaReturSales.Executes(AServiceSeq:integer);
var vCompany : TCompanyProfile;
begin
  //qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  vCompany := TCompanyProfile.Create;
  vCompany.SelectInDB;
  qrlCompany.Caption := vCompany.CompanyName;
  qrlMoto.Caption    := vCompany.Branch;
  qrlAddress.Caption := vCompany.Address +' '+vCompany.City+' Telp. '+ vCompany.Telp1+
                        ' Fax. '+vCompany.Fax;
  qrMemoInfo.Lines.Text := 'Info : '+vCompany.Info;//
  if NeoLoadData(AServiceSeq) then
    PreviewModal
  else
    Inform(MSG_NO_DATA_FOUND);
  vCompany.Free;  
end;

procedure TqrpNotaReturSales.SetColumHeader(AType: String);
begin
  qrlNomor.Font.Style    := [fsBold];
  qrlQty.Font.Style      := [fsBold];
  qrlDisc.Font.Style     := [fsBold];
  qrlPrice.Font.Style    := [fsBold];
  qrlAMount.Font.Style   := [fsBold];
  qrlNama.Font.Style     := [fsBold];
  qrlCode.Font.Style     := [fsBold];
  qrlNett.Font.Style     := [fsBold];

  qrlNomor.Alignment  := taCenter;
  qrlNama.Alignment   := taCenter;
  qrlQty.Alignment    := taCenter;
  qrlPrice.Alignment  := taCenter;
  qrlAMount.Alignment := taCenter;
  qrlNett.Alignment   := taCenter;
  qrlCode.Alignment   := taCenter;
  qrlDisc.Alignment   := taCenter;

  {qrShapeKiriNomor.Enabled    := True;
  qrShapeKiriNama.Enabled     := True;
  qrShapeKiriQty.Enabled      := True;
  qrShapeKiriPrice.Enabled    := True;
  qrShapeKiriAMount.Enabled   := True;
  qrShapeKananAmount.Enabled  := True;
  qrShapeTopBottom.Enabled    := True;
  qrShapeKiriCode.Enabled     := True;
  qrShapeKiriNett.Enabled     := True;
  qrShapeKiriDisc.Enabled     := True;}


  qrlNomor.Caption    := 'No.';
  qrlQty.Caption      := 'QTY';
  qrlDisc.Caption     := 'Diskon';
  qrlPrice.Caption    := 'Harga Satuan';
  qrlAMount.Caption   := 'Subtotal';
  qrlNett.Caption     := 'Netto';


  if AType = 'B' then begin// bahan
    qrlNama.Caption := 'Nama Part';
    qrlCode.Caption := 'Kode Part';
  end
  else begin
    qrlNama.Caption := 'Jenis Service';
    qrlCode.Caption := 'Kode Service';
  end;
end;

procedure TqrpNotaReturSales.SetDetail(ANomor: integer; ANama: string;
  AKonversi, AQty, APrice, AAMount: real;AType:string);
begin
qrlNomor.Font.Style    := [];
  qrlQty.Font.Style      := [];
  qrlPrice.Font.Style    := [];
  qrlAMount.Font.Style   := [];
  qrlNama.Font.Style     := [];
  qrlCode.Font.Style     := [];
  qrlNett.Font.Style     := [];
  qrlDisc.Font.Style     := [];

  {qrShapeKiriNomor.Enabled    := True;
  qrShapeKiriNama.Enabled     := True;
  qrShapeKiriQty.Enabled      := True;
  qrShapeKiriPrice.Enabled    := True;
  qrShapeKiriAMount.Enabled   := True;
  qrShapeKananAmount.Enabled  := True;}
  qrShapeTopBottom.Enabled    := False;

  qrlNomor.Alignment  := taCenter;
  qrlNama.Alignment   := taLeftJustify;
  qrlQty.Alignment    := taCenter;
  qrlPrice.Alignment  := taCenter;
  qrlAMount.Alignment := taRightJustify;
  qrlCode.Alignment   := taCenter;
  qrlDisc.Alignment   := taRightJustify;
  qrlNett.Alignment   := taRightJustify;

  qrlNomor.Caption  := IfThen(ANomor=0,'',IntToStr(ANomor));
  qrlNama.Caption   := ANama;
  qrlQty.Caption      := IfThen(ANomor=0,'',FloatToStrFmt2(AQty));
  qrlPrice.Caption    := IfThen(ANomor=0,'',FloatToStrFmt2(APrice));
  qrlAMount.Caption   := FloatToStrFmt2(AAMount);
end;

procedure TqrpNotaReturSales.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
var vAkhirPage,vAwalPage:integer;
begin
  MoreData := vPosisiRecord < vTampungan;
  if MoreData then begin
    qrlRow.Caption := IntToStr(vRow+1);
    qrlRealRow.Caption := IntToStr(vRealRow+1);
    if vTipe <> adoMastertipe.Value then begin
      if vTotal > 0 then begin
        SetFooter(adoMastertipe.Value,vTotal,vDisc,vNett);
      end
     { else  if vCounterKosong < BATAS_EMPTY then begin
        SetEmpty('');
        Inc(vCounterKosong);
      end}
      else begin
        vCounterKosong := 0;
        SetColumHeaderAll(adoMastertipe.Value);
        vTipe := adoMastertipe.Value;
        gNoUrut := 0;
      END;
    end
    else begin //jika tipeAktif = posisi tipe pada dsMaster
      //jika posisi record = jumlah data  atau posisi row = jumlah row ketentuan per page
      //maka akhiri saja pagenya dengan footer,
      vAkhirPage := (TOTAL_ROW * Self.Printer.PageNumber + (3 * (Self.Printer.PageNumber-1)));
      if (vPosisiRecord = adoMaster.RecordCount) OR (vRow = TOTAL_ROW) or
        (vRealRow = vAkhirPage ) then begin
        SetFooter(vTipe,vTotal,vDisc,vNett);
        if (vRow = TOTAL_ROW) or (vRealRow = vAkhirPage) then begin
          vRow := -1; //reset posisi row ke -1
        end
        else //agar menghentikan posisi record biar tdk ngeprint detail lagi coz datasetnya dah abis
           vPosisiRecord := vPosisiRecord + (vTampungan- vPosisiRecord);
      end
      else if vPosisiRecord > adoMaster.RecordCount then begin //jika posisi record melebihi record data master
        SetEmpty(adoMastertipe.Value);
        Inc(vPosisiRecord);
      end
      else if vRow <= 0 then begin
        SetEmpty(adoMastertipe.Value);
        if vCounterKosong < BATAS_EMPTY then begin
          SetEmpty('');
          Inc(vCounterKosong);
        end
        else begin  //jika counter sudah >=4
          vAwalPage := (TOTAL_ROW * (Self.Printer.PageNumber-1) + (4 * (Self.Printer.PageNumber)) -
                (Self.Printer.PageNumber-1));
          if (vRealRow = vAwalPage) THEN begin //(ROW_BARU * (Printer.PageNumber-1)))   then begin
            SetColumHeaderAll(adoMastertipe.Value);
//          if (vRealRow = (ROW_BARU * (Printer.PageNumber-1))) then
            if vTotalTransisi <= 0 then begin
              vRow := 1;
              vCounterKosong := 0;
            end;
          end
          else if (vRealRow = vAwalPage+1) then begin // ((ROW_BARU * (Printer.PageNumber-1))+1))  then begin
            if vTotalTransisi <= 0 then begin
              vRow := 1;
              vCounterKosong := 0;
            end
            else begin
               SetDetailAll(0,'Total Sebelumnya ','',0,0,vTotalTransisi,0,adoMastertipe.Value);

               vRow := 1;
               vCounterKosong := 0;
            end;
          end;
        end;//jika counter sudah >= 5
      end
      else begin
        Inc(gNoUrut);
        SetDetailAll(gNoUrut, adoMasteritem_name.Value,adoMasteritem_code.Value,adoMasterquantity.Value,
                adoMasterprice_tampil.Value,adoMasterAmount.Value,adoMasterdiscount.Value,adoMastertipe.Value);
        vTotal := vTotal + {adoMasterAmount.Value}(adoMasterquantity.Value*
                adoMasterprice_tampil.Value) + vTotalTransisi;
        vDisc  := vDisc + adoMasterdiscount.Value + vDiscTransisi;
        vNett  := vNett + (adoMasterAmount.Value{ - adoMasterdiscount.Value}) + vNettTransisi;
        vTotalTransisi := 0;
        vDiscTransisi := 0;
        vNettTransisi := 0;
//        vGrantTotal := vGrantTotal + vTotal;
        Inc(vPosisiRecord);
        adoMaster.Next;
      end;
    end;
    if vRow >= 0 then
      Inc(vRow);
    Inc(vRealRow);
  end;

end;

procedure TqrpNotaReturSales.SetEmpty(AType:string);
begin
  {qrShapeKiriNomor.Enabled    := False;
  qrShapeKiriNama.Enabled     := False;
  qrShapeKiriQty.Enabled      := False;
  qrShapeKiriPrice.Enabled    := False;
  qrShapeKiriAMount.Enabled   := False;
  qrShapeKananAmount.Enabled  := False;
  qrShapeKiriCode.Enabled     := False;
  qrShapeKiriNett.Enabled     := False;
  qrShapeKiriDisc.Enabled     := False;}
  qrShapeTopBottom.Enabled    := False;

  qrlNomor.Caption  := '';
  qrlNama.Caption   := '';
  qrlQty.Caption      := '';
  qrlPrice.Caption    := '';
  qrlAMount.Caption   := '';
  qrlCode.Caption     := '';
  qrlDisc.Caption     := '';
  qrlNett.Caption     := '';
  vTotal := 0;
  vDisc  := 0;
  vNett  := 0;
end;

procedure TqrpNotaReturSales.SetFooter(AType:string;ATotal,ADisc,ANett:Double);
begin
  qrlNomor.Font.Style    := [];
  qrlQty.Font.Style      := [];
  qrlPrice.Font.Style    := [];
  qrlAMount.Font.Style   := [];
  qrlNama.Font.Style     := [];
  qrlNett.Font.Style     := [];
  qrlDisc.Font.Style     := [];
  qrlCode.Font.Style     := [];

  {qrShapeKiriNomor.Enabled    := True;
  qrShapeKiriNama.Enabled     := False;
  qrShapeKiriQty.Enabled      := False;
  qrShapeKiriPrice.Enabled    := False;
  qrShapeKiriAMount.Enabled   := True;
  qrShapeKananAmount.Enabled  := True;
  qrShapeKiriCode.Enabled     := True;
  qrShapeKiriNett.Enabled     := True;
  qrShapeKiriDisc.Enabled     := True;}
  qrShapeTopBottom.Enabled    := True;


  qrlNomor.Alignment  := taCenter;
  qrlNama.Alignment   := taLeftJustify;
  qrlQty.Alignment    := taCenter;
  qrlPrice.Alignment  := taCenter;
  qrlAMount.Alignment := taRightJustify;
  qrlDisc.Alignment := taRightJustify;
  qrlNett.Alignment := taRightJustify;

  qrlCode.Caption   := '';
  qrlNomor.Caption  := '';
  qrlNama.Caption   := '';
  qrlQty.Caption      := '';
  qrlPrice.caption  := '';
  qrlQty.Caption    := 'Total';
  qrlAMount.Caption   := FloatToStrFmt2(ATotal);
  qrlDisc.Caption   := FloatToStrFmt2(ADisc);
  qrlNett.Caption   := FloatToStrFmt2(ANett);

  if (adoMastertipe.Value = AType) and (vRow = TOTAL_ROW) or
   (vRealRow =(TOTAL_ROW * Self.Printer.PageNumber + (3 * (Self.Printer.PageNumber-1)))) then begin
    vTotalTransisi := ATotal;
    vNettTransisi  := ANett;
    vDiscTransisi  := ADisc;
  end
  else begin
    vGrantTotal := vGrantTotal + ATotal;
    vGrandDisc  := vGrandDisc + ADisc;
    vGrantNett  := vGrantNett + ANett;
    vTotalTransisi := 0;
    vDiscTransisi  := 0;
    vNettTransisi  := 0;

    vTotal := 0;
    vDisc  := 0;
    vNett  := 0;
  end;
end;

procedure TqrpNotaReturSales.SetColumHeaderAll(AType: string);
begin
  qrlNomor.Font.Style    := [fsBold];
  qrlQty.Font.Style      := [fsBold];
  qrlPrice.Font.Style    := [fsBold];
  qrlAMount.Font.Style   := [fsBold];
  qrlNama.Font.Style     := [fsBold];
  qrlDisc.Font.Style  := [fsBold];
  qrlNett.Font.Style  := [fsBold];
  qrlCode.Font.Style  := [fsBold];

  qrlNomor.Alignment  := taCenter;
  qrlNama.Alignment   := taCenter;
  qrlQty.Alignment    := taCenter;
  qrlPrice.Alignment  := taCenter;
  qrlAMount.Alignment := taCenter;
  qrlCode.Alignment    := taCenter;
  qrlNett.Alignment  := taCenter;
  qrlDisc.Alignment := taCenter;

  qrlNomor.Enabled  := True;
  qrlNama.Enabled   := True;
  qrlQty.Enabled    := True;
  qrlPrice.Enabled  := True;
  qrlAMount.Enabled := True;
  qrlNett.Enabled    := True;
  qrlCode.Enabled  := True;
  qrlDisc.Enabled := True;

  {qrShapeKiriNomor.Enabled    := True;
  qrShapeKiriNama.Enabled     := True;
  qrShapeKiriQty.Enabled      := True;
  qrShapeKiriPrice.Enabled    := True;
  qrShapeKiriAMount.Enabled   := True;
  qrShapeKananAmount.Enabled  := True;
  qrShapeKiriCode.Enabled     := True;
  qrShapeKiriNett.Enabled     := True;
  qrShapeKiriDisc.Enabled     := True;}
  qrShapeTopBottom.Enabled    := True;

  qrlQty.Enabled   := AType <> 'Z';
  qrlPrice.Enabled := AType <> 'Z';

  {qrShapeKiriQty.Enabled   := AType <> 'Z';
  qrShapeKiriPrice.Enabled := AType <> 'Z';}

  qrlNomor.Caption    := 'No.';
  qrlQty.Caption      := 'QTY';
  qrlPrice.Caption    := 'Harga Satuan';
  qrlAMount.Caption   := 'Subtotal';

  qrlDisc.Caption    := 'Diskon';
  qrlNett.Caption    := 'Netto';

  if AType = 'B' then begin// bahan
    qrlNama.Caption := 'Nama Part';
    qrlCode.Caption    := 'Kode Part';
  end
  else if AType = 'S' then begin //JASA
    qrlNama.Caption := 'Jenis Service';
    qrlCode.Caption    := 'Kode Service';
  end
  else begin //BIAYA
    qrlNama.Caption := 'Nama Biaya';
    qrlQty.Caption  := 'Tgl.Awal';
    qrlPrice.Caption:= 'Tgl.Akhir';
  end;
end;

procedure TqrpNotaReturSales.SetDetailAll(ANomor:integer;ANama,ACode:string;AQty,APrice,AAMount,ADisc:real;AType:string);
begin
  qrlNomor.Font.Style  := [];
  qrlQty.Font.Style    := [];
  qrlPrice.Font.Style  := [];
  qrlAMount.Font.Style := [];
  qrlNama.Font.Style   := [];
  qrlCode.Font.Style   := [];
  qrlNett.Font.Style   := [];
  qrlDisc.Font.Style   := [];

  {qrShapeKiriNomor.Enabled    := True;
  qrShapeKiriNama.Enabled     := True;
  qrShapeKiriQty.Enabled      := True;
  qrShapeKiriPrice.Enabled    := True;
  qrShapeKiriAMount.Enabled   := True;
  qrShapeKananAmount.Enabled  := True;
  qrShapeKiriCode.Enabled     := True;
  qrShapeKiriNett.Enabled     := True;
  qrShapeKiriDisc.Enabled     := True;}
  qrShapeTopBottom.Enabled    := False;

  qrlNomor.Alignment := taCenter;
  qrlNama.Alignment  := taLeftJustify;
  qrlCode.Alignment  := taCenter;
  qrlQty.Alignment   := taRightJustify;
  qrlPrice.Alignment := taRightJustify;
  qrlDisc.Alignment  := taRightJustify;
  qrlNett.Alignment  := taRightJustify;
  qrlAMount.Alignment:= taRightJustify;

  qrlNomor.Enabled  := True;
  qrlNama.Enabled   := True;
  qrlQty.Enabled    := True;
  qrlPrice.Enabled  := True;
  qrlAMount.Enabled := True;
  qrlCode.Enabled   := True;
  qrlDisc.Enabled   := True;
  qrlNett.Enabled   := True;

  qrlQty.Enabled   := AType <> 'Z';
  qrlPrice.Enabled := AType <> 'Z';

  qrlNomor.Caption  := IfThen(ANomor=0,'',IntToStr(ANomor));
  qrlCode.Caption   := ACode;
  qrlNama.Caption   := ANama;
  qrlQty.Caption    := IfThen(ANomor=0,'',FloatToStrFmt2(AQty));
  qrlPrice.Caption  := IfThen(ANomor=0,'',FloatToStrFmt2(APrice));
  qrlAMount.Caption := FloatToStrFmt2(AQty * APrice);//AAMount);
  qrlDisc.Caption   := IfThen(ANomor=0,'',FloatToStrFmt2(ADisc));
  qrlNett.Caption   := IfThen(ANomor=0,'',FloatToStrFmt2(AAMount));
end;

end.
