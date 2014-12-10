object Frame2: TFrame2
  Left = 0
  Top = 0
  Width = 768
  Height = 240
  TabOrder = 0
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 320
    Height = 120
    BorderStyle = bsNone
    ColCount = 15
    DefaultColWidth = 48
    DefaultRowHeight = 19
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowMoving, goColMoving, goEditing]
    ScrollBars = ssNone
    TabOrder = 0
    OnKeyPress = StringGrid1KeyPress
    OnSelectCell = StringGrid1SelectCell
  end
  object Edit1: TEdit
    Left = 376
    Top = 24
    Width = 121
    Height = 21
    TabStop = False
    Color = clYellow
    ReadOnly = True
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
    OnChange = Edit1Change
  end
end
