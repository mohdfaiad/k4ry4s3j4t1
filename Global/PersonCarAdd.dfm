object frmPersonCarAdd: TfrmPersonCarAdd
  Left = 371
  Top = 175
  BorderStyle = bsDialog
  Caption = 'frmPersonCarAdd'
  ClientHeight = 399
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TPanel
    Left = 0
    Top = 210
    Width = 532
    Height = 189
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      532
      189)
    object Bevel2: TBevel
      Left = 5
      Top = 6
      Width = 523
      Height = 147
      Shape = bsFrame
    end
    object btnSave: TButton
      Left = 370
      Top = 158
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Save'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TButton
      Left = 448
      Top = 158
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object asgCar: TAdvStringGrid
      Left = 8
      Top = 22
      Width = 515
      Height = 126
      Cursor = crDefault
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColCount = 5
      DefaultRowHeight = 21
      DefaultDrawing = False
      FixedCols = 1
      RowCount = 5
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLineWidth = 1
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
      ParentFont = False
      TabOrder = 2
      OnClick = asgCarClick
      OnKeyDown = asgCarKeyDown
      GridLineColor = clSilver
      ActiveCellShow = False
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'MS Sans Serif'
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = clGray
      Bands.PrimaryColor = clInfoBk
      Bands.PrimaryLength = 1
      Bands.SecondaryColor = clWindow
      Bands.SecondaryLength = 1
      Bands.Print = False
      AutoNumAlign = False
      AutoSize = False
      VAlignment = vtaTop
      EnhTextSize = False
      EnhRowColMove = False
      SizeWithForm = False
      Multilinecells = False
      OnGetAlignment = asgCarGetAlignment
      OnCanEditCell = asgCarCanEditCell
      OnCellValidate = asgCarCellValidate
      OnGetEditorType = asgCarGetEditorType
      DragDropSettings.OleAcceptFiles = True
      DragDropSettings.OleAcceptText = True
      SortSettings.AutoColumnMerge = False
      SortSettings.Column = 0
      SortSettings.Show = False
      SortSettings.IndexShow = False
      SortSettings.Full = True
      SortSettings.SingleColumn = False
      SortSettings.IgnoreBlanks = False
      SortSettings.BlankPos = blFirst
      SortSettings.AutoFormat = True
      SortSettings.Direction = sdAscending
      SortSettings.FixedCols = False
      SortSettings.NormalCellsOnly = False
      SortSettings.Row = 0
      FloatingFooter.Color = clBtnFace
      FloatingFooter.Column = 0
      FloatingFooter.FooterStyle = fsFixedLastRow
      FloatingFooter.Visible = False
      ControlLook.Color = clBlack
      ControlLook.CheckSize = 15
      ControlLook.RadioSize = 10
      ControlLook.ControlStyle = csClassic
      ControlLook.FlatButton = False
      EnableBlink = False
      EnableHTML = True
      EnableWheel = True
      Flat = False
      HintColor = clInfoBk
      SelectionColor = clHighlight
      SelectionTextColor = clHighlightText
      SelectionRectangle = False
      SelectionResizer = False
      SelectionRTFKeep = False
      HintShowCells = False
      HintShowLargeText = False
      HintShowSizing = False
      PrintSettings.FooterSize = 0
      PrintSettings.HeaderSize = 0
      PrintSettings.Time = ppNone
      PrintSettings.Date = ppNone
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.PageNr = ppNone
      PrintSettings.Title = ppNone
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.Borders = pbNoborder
      PrintSettings.BorderStyle = psSolid
      PrintSettings.Centered = False
      PrintSettings.RepeatFixedRows = False
      PrintSettings.RepeatFixedCols = False
      PrintSettings.LeftSize = 0
      PrintSettings.RightSize = 0
      PrintSettings.ColumnSpacing = 0
      PrintSettings.RowSpacing = 0
      PrintSettings.TitleSpacing = 0
      PrintSettings.Orientation = poPortrait
      PrintSettings.PageNumberOffset = 0
      PrintSettings.MaxPagesOffset = 0
      PrintSettings.FixedWidth = 0
      PrintSettings.FixedHeight = 0
      PrintSettings.UseFixedHeight = False
      PrintSettings.UseFixedWidth = False
      PrintSettings.FitToPage = fpNever
      PrintSettings.PageNumSep = '/'
      PrintSettings.NoAutoSize = False
      PrintSettings.NoAutoSizeRow = False
      PrintSettings.PrintGraphics = False
      HTMLSettings.Width = 100
      HTMLSettings.XHTML = False
      Navigation.AdvanceOnEnter = True
      Navigation.AdvanceInsert = True
      Navigation.AdvanceDirection = adLeftRight
      Navigation.AllowClipboardRowGrow = True
      Navigation.AllowClipboardColGrow = True
      Navigation.InsertPosition = pInsertBefore
      Navigation.CopyHTMLTagsToClipboard = True
      Navigation.HomeEndKey = heFirstLastColumn
      ColumnSize.Location = clRegistry
      CellNode.Color = clSilver
      CellNode.NodeColor = clBlack
      CellNode.ShowTree = False
      MaxEditLength = 0
      IntelliPan = ipVertical
      URLColor = clBlue
      URLShow = False
      URLFull = False
      URLEdit = False
      ScrollType = ssNormal
      ScrollColor = clNone
      ScrollWidth = 17
      ScrollSynch = False
      ScrollProportional = False
      ScrollHints = shNone
      OemConvert = False
      FixedFooters = 0
      FixedRightCols = 0
      FixedColWidth = 64
      FixedRowHeight = 21
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = []
      FixedAsButtons = False
      FloatFormat = '%.2f'
      IntegralHeight = False
      WordWrap = False
      Lookup = False
      LookupCaseSensitive = False
      LookupHistory = False
      BackGround.Top = 0
      BackGround.Left = 0
      BackGround.Display = bdTile
      BackGround.Cells = bcNormal
      Filter = <>
      RowHeights = (
        21
        21
        21
        21
        21)
    end
    object StaticText1: TStaticText
      Left = 16
      Top = 1
      Width = 82
      Height = 17
      Alignment = taCenter
      BorderStyle = sbsSingle
      Caption = 'Data Kendaraan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 210
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      Left = 5
      Top = 13
      Width = 521
      Height = 184
      Shape = bsFrame
    end
    object lblCode: TLabel
      Left = 15
      Top = 38
      Width = 24
      Height = 13
      Caption = 'Kode'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 15
      Top = 62
      Width = 27
      Height = 13
      Caption = 'Nama'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 15
      Top = 86
      Width = 33
      Height = 13
      Caption = 'Alamat'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 15
      Top = 110
      Width = 22
      Height = 13
      Caption = 'Kota'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 15
      Top = 136
      Width = 36
      Height = 13
      Caption = 'Phone1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 15
      Top = 160
      Width = 36
      Height = 13
      Caption = 'Phone2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 205
      Top = 138
      Width = 18
      Height = 13
      Caption = 'Fax'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object sttInfo: TStaticText
      Left = 16
      Top = 7
      Width = 33
      Height = 17
      Alignment = taCenter
      BorderStyle = sbsSingle
      Caption = 'sttInfo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object txtCode: TAdvEdit
      Left = 87
      Top = 38
      Width = 99
      Height = 21
      TabStop = False
      AutoFocus = True
      EditAlign = eaLeft
      EditType = etUppercase
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clGray
      FlatParentColor = False
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clBtnFace
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSkyBlue
      SoftBorder = True
      URLColor = clBlue
      ReturnIsTab = True
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Persistence.Enable = False
      Persistence.Location = plInifile
      Color = clWhite
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HintShowLargeText = False
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      ReadOnly = True
      Signed = False
      TabOrder = 0
      Transparent = False
      Visible = True
    end
    object txtName: TAdvEdit
      Left = 87
      Top = 62
      Width = 244
      Height = 21
      AutoFocus = False
      EditAlign = eaLeft
      EditType = etString
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clGray
      FlatParentColor = False
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clBtnFace
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSkyBlue
      SoftBorder = True
      URLColor = clBlue
      ReturnIsTab = True
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Persistence.Enable = False
      Persistence.Location = plInifile
      Color = clWhite
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HintShowLargeText = False
      MaxLength = 50
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      Signed = False
      TabOrder = 1
      Transparent = False
      Visible = True
    end
    object txtAddress: TAdvEdit
      Left = 87
      Top = 86
      Width = 430
      Height = 21
      AutoFocus = False
      EditAlign = eaLeft
      EditType = etString
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clGray
      FlatParentColor = False
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clBtnFace
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSkyBlue
      SoftBorder = True
      URLColor = clBlue
      ReturnIsTab = True
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Persistence.Enable = False
      Persistence.Location = plInifile
      Color = clWhite
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HintShowLargeText = False
      MaxLength = 200
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      Signed = False
      TabOrder = 2
      Transparent = False
      Visible = True
    end
    object txtCity: TAdvEdit
      Left = 87
      Top = 110
      Width = 116
      Height = 21
      AutoFocus = False
      EditAlign = eaLeft
      EditType = etString
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clGray
      FlatParentColor = False
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clBtnFace
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSkyBlue
      SoftBorder = True
      URLColor = clBlue
      ReturnIsTab = True
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Persistence.Enable = False
      Persistence.Location = plInifile
      Color = clWhite
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HintShowLargeText = False
      MaxLength = 20
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      Signed = False
      TabOrder = 3
      Transparent = False
      Visible = True
    end
    object txtPhone: TAdvEdit
      Left = 87
      Top = 136
      Width = 100
      Height = 21
      AutoFocus = False
      EditAlign = eaLeft
      EditType = etMixedCase
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clGray
      FlatParentColor = False
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clBtnFace
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSkyBlue
      SoftBorder = True
      URLColor = clBlue
      ReturnIsTab = True
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Persistence.Enable = False
      Persistence.Location = plInifile
      Color = clWhite
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HintShowLargeText = False
      MaxLength = 15
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      Signed = False
      TabOrder = 4
      Text = '(0265) - 33420312'
      Transparent = False
      Visible = True
    end
    object txtPhone2: TAdvEdit
      Left = 87
      Top = 160
      Width = 100
      Height = 21
      AutoFocus = False
      EditAlign = eaLeft
      EditType = etMixedCase
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clGray
      FlatParentColor = False
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clBtnFace
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSkyBlue
      SoftBorder = True
      URLColor = clBlue
      ReturnIsTab = False
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Persistence.Enable = False
      Persistence.Location = plInifile
      Color = clWhite
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HintShowLargeText = False
      MaxLength = 15
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      Signed = False
      TabOrder = 5
      Text = '(0265) - 33420312'
      Transparent = False
      Visible = True
      OnKeyDown = txtPhone2KeyDown
    end
    object txtFax: TAdvEdit
      Left = 231
      Top = 136
      Width = 100
      Height = 21
      AutoFocus = False
      EditAlign = eaLeft
      EditType = etMixedCase
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clGray
      FlatParentColor = False
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clBtnFace
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSkyBlue
      SoftBorder = True
      URLColor = clBlue
      ReturnIsTab = False
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Persistence.Enable = False
      Persistence.Location = plInifile
      Color = clWhite
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HintShowLargeText = False
      MaxLength = 15
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      Signed = False
      TabOrder = 6
      Text = '(0265) - 33420312'
      Transparent = False
      Visible = True
      OnKeyDown = txtPhone2KeyDown
    end
  end
  object WinXP1: TWinXP
    Left = 200
    Top = 16
  end
end
