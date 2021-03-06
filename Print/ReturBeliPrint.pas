unit ReturBeliPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid,UTransaction, DB,
  ADODB;

type
  TqrpReturBeliRekap = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    qrl4: TQRLabel;
    shapeHeader: TQRShape;
    qrlTitle: TQRLabel;
    QRSysData1: TQRSysData;
    adoqMaster: TADOQuery;
    QRDBText3: TQRDBText;
    dsMaster: TDataSource;
    adoqDetail: TADOQuery;
    adoqMastership_date: TDateTimeField;
    adoqMastership_num: TStringField;
    adoqMasterperson_id: TLargeintField;
    adoqMasterperson_name: TStringField;
    adoqMastership_id: TLargeintField;
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    adoqMasterref: TStringField;
    qrlCust: TQRLabel;
    qrmCompany: TQRMemo;
    qrlPeriod: TQRLabel;
    qrNoSUbDetail: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     MasterGrid : TAdvStringGrid;
     i,j:integer;
     vDetail : TItemDetail_Arr;
     needDetail, needHeader : boolean;
     procedure setDetailHeader;
     procedure setDetailItem(ARow:integer);
     procedure setDetailTrans(AIndex:integer);

  public
     procedure Executes(AGrid:TAdvStringGrid);
     //purpose_retur_beli, purpose_retur_service, & retur_sales
     procedure ExecutQuery(APurpose:string);

  end;

var
  qrpReturBeliRekap: TqrpReturBeliRekap;

implementation

uses AutoBengkel, un_ryu, SQLServerConnections, UConst, Subroutines,
  UMaster;
const
  colNo =0;
  colNum = 1;
  colDate = 2;
  colSupplier = 3;
  colNotes = 4;
  colOperator = 5;
  colSeq = 6;

 colCode = 1;
 colName = 2;
 colQty = 3;
 colPrice = 4;
 colAmount = 5;


{$R *.DFM}

{ TqrpKartuStok }

procedure TqrpReturBeliRekap.Executes(AGrid: TAdvStringGrid);
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  vDetail := TItemDetail_Arr.Create;
  MasterGrid := AGrid;
  MasterGrid.ExpandAll;
  PreviewModal;
  vDetail.Free;
end;

procedure TqrpReturBeliRekap.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 1; needDetail := False;
   needHeader := False;
end;

procedure TqrpReturBeliRekap.setDetailHeader;
begin
  shapeHeader.Enabled := True;
  qrl1.Caption := 'Kode Part';
  qrl2.Caption := 'Nama Part';
  qrl3.Caption := 'Qty';
  qrl4.Caption := 'Harga';

  qrl1.Alignment := taCenter;
  qrl2.Alignment := taCenter;
  qrl3.Alignment := taCenter;
  qrl4.Alignment := taCenter;

  qrl1.Font.Style := [fsBold];
  qrl2.Font.Style := [fsBold];
  qrl3.Font.Style := [fsBold];
  qrl4.Font.Style := [fsBold];
end;

procedure TqrpReturBeliRekap.setDetailItem(ARow: integer);
begin
  shapeHeader.Enabled := True;
//  qrl0.Caption := MasterGrid.Cells[colNo,aRow];
  qrl1.Caption := MasterGrid.Cells[colDate,aRow];
  qrl2.Caption := MasterGrid.Cells[colNum,aRow];
  qrl3.Caption := MasterGrid.Cells[colSupplier,aRow];
  qrl4.Caption := '';//MasterGrid.Cells[colPrice,aRow];

  qrl1.Alignment := taLeftJustify;
  qrl2.Alignment := taLeftJustify;
  qrl3.Alignment := taLeftJustify;
  qrl4.Alignment := taRightJustify;

  qrl1.Font.Style := [];
  qrl2.Font.Style := [];
  qrl3.Font.Style := [];
  qrl4.Font.Style := [];
end;

procedure TqrpReturBeliRekap.setDetailTrans(AIndex: integer);
begin
  shapeHeader.Enabled := False;
  shapeHeader.Enabled  := True;
  //qrl0.Caption := '';
  qrl1.Caption := vDetail[j].ItemBalance.Items.ItemCode;
  qrl2.Caption := vDetail[j].ItemBalance.Items.ItemName;
  qrl3.Caption := FloatToStrFmt2(vDetail[j].Quantity);
  qrl4.Caption := FloatToStrFmt2(vDetail[j].Price);

  qrl1.Alignment := taLeftJustify;
  qrl2.Alignment := taLeftJustify;
  qrl3.Alignment := taRightJustify;
  qrl4.Alignment := taRightJustify;

  qrl1.Font.Style := [];
  qrl2.Font.Style := [];
  qrl3.Font.Style := [];
  qrl4.Font.Style := [];
end;

procedure TqrpReturBeliRekap.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  {MoreData := i < MasterGrid.RowCount;
  if not MoreData then
    MoreData :=  j < vDetail.Count;
  if MoreData and (not needDetail) then begin
      setDetailItem(i);
      needHeader := True;
      setDetailHeader;
      j:= 0;
      vDetail.Clear;
      needDetail := vDetail.FindOnDB(Mastergrid.Ints[colSeq,i]);
      Inc(i)
  END
  else if needHeader then begin
      setDetailHeader;
      needHeader := False;
  end
  else if needDetail and MoreData then begin
    setDetailTrans(j);
    inc(j);
  end;}
end;

procedure TqrpReturBeliRekap.ExecutQuery(APurpose:string);
var vSQL,vFilter : string;
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  vSQL := 'Select ship_date, ship_num, s.person_id, p.person_name, ship_id '+
           ', dbo.get_ship_num(ship_id_used) as ref '+
          ' from shipment s left join persons p on p.person_id = s.person_id '+
        ' where ship_type = '+FormatSQLString(APurpose);

  vFilter := '';
  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND s.ship_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND s.ship_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);
  if vFilter <> '' then
    vSQL := vSQL + vFilter;
  with adoqMaster do begin
    Close;
    SQL.Clear;
    SQL.Text := vSQL;
    Connection := MyConnection.ADOConnection;
    Open;
  end;
  dsMaster.DataSet := adoqMaster;
  vSQL := 'Select i.item_code, i.item_name, d.quantity, d.price, d.amount '+
        ' FROM items i, item_detail d, item_balance b '+
        ' WHERE i.item_id = b.item_id and b.item_balance_id = d.item_balance_id '+
        ' and d.ship_id = :ship_id ';
  vSQL := vSQL + ' ORDER by i.item_code ';      
  with adoqDetail do begin
    Close;
    DataSource := dsMaster;
    SQL.Clear;
    SQL.Text := vSQL;
    Connection := MyConnection.ADOConnection;
    Parameters.AddParameter.Name := 'ship_id';
    Parameters.ParamByName('ship_id').Value := adoqMastership_id.Value;
    Prepared;
    Open;
  end;

  case APurpose[1] of
    SHIP_TYPE_RETUR_BELI : begin
      qrlTitle.Caption := 'Rekap Retur Beli';
      qrlCust.Caption  := 'Supplier';
    end;
    SHIP_TYPE_RETUR_SALES : begin
      qrlTitle.Caption := 'Rekap Retur Sales';
      qrlCust.Caption  := 'Pembeli';
    end;
    SHIP_TYPE_RETUR_SERVICE : begin
      qrlTitle.Caption := 'Rekap Retur Service';
      qrlCust.Caption  := 'Pelanggan';
    end;

    SHIP_TYPE_CLAIM : begin
      qrlTitle.Caption := 'Rekap Klaim';
      qrlCust.Caption  := 'Pelanggan';
    end;
  end;
  ReportTitle := qrlTitle.Caption;

  PreviewModal;
end;

procedure TqrpReturBeliRekap.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrNoSUbDetail.Reset;
end;

end.
