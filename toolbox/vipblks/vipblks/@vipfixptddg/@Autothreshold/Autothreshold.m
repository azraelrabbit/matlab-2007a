function this = Autothreshold(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.Autothreshold(block);
    this.init(block);
    % 12 14
    % 13 14
    blkbutton = dspGetContainerWidgetBase('pushbutton', 'Open Data Type Diagram', 'DataTypeDiagram');
    % 15 16
    blkbutton.MatlabMethod = 'helpview';
    blkbutton.MatlabArgs = cellhorzcat(horzcat(docroot, '/toolbox/vipblks/vipblks.map'), 'autothreshold', 'CSHelpWindow');
    % 18 19
    blkbutton.RowSpan = [1.0 1.0];
    blkbutton.ColSpan = [1.0 2.0];
    blkbutton.Alignment = 4.0;
    blockInfo.block = block;
    blockInfo.propNames = {};
    blockInfo.propTypes = {};
    DTypeButton = dspfixptddg.DSPWidgetWrapper(blkbutton, blockInfo, 'FixptDType');
    % 26 28
    % 27 28
    baseDTs = {};
    % 29 31
    % 30 31
    [P1, A1, P2, A2, P3, A3, P4, A4, Q1, EM] = deal(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
    % 32 35
    % 33 35
    % 34 35
    P1_str = 'Product 1';
    P2_str = 'Product 2';
    P3_str = 'Product 3';
    P4_str = 'Product 4';
    % 39 40
    A1_str = 'Accumulator 1';
    A2_str = 'Accumulator 2';
    A3_str = 'Accumulator 3';
    A4_str = 'Accumulator 4';
    % 44 45
    EM_str = 'Eff Metric';
    Q1_str = 'Quotient';
    % 47 50
    % 48 50
    % 49 50
    otherDTs{P1}.Name = P1_str;
    otherDTs{P1}.Prefix = 'P1';
    otherDTs{P1}.Entries = {'Specify word length','Binary point scaling','Slope and bias scaling'};
    % 53 55
    % 54 55
    otherDTs{P1}.Type = 'DataTypeRowBestPrec';
    otherDTs{P1}.WordLengthOffset = 2.0;
    % 57 59
    % 58 59
    otherDTs{A1}.Name = A1_str;
    otherDTs{A1}.Prefix = 'A1';
    otherDTs{A1}.Entries = cellhorzcat(horzcat('Same as ', P1_str), 'Specify word length', 'Binary point scaling', 'Slope and bias scaling');
    % 62 65
    % 63 65
    % 64 65
    otherDTs{A1}.Type = 'DataTypeRowBestPrec';
    otherDTs{A1}.WordLengthOffset = 2.0;
    % 67 69
    % 68 69
    otherDTs{P2}.Name = P2_str;
    otherDTs{P2}.Prefix = 'P2';
    otherDTs{P2}.Entries = {'Specify word length','Binary point scaling','Slope and bias scaling'};
    % 72 74
    % 73 74
    otherDTs{P2}.Type = 'DataTypeRowBestPrec';
    otherDTs{P2}.WordLengthOffset = 10.0;
    % 76 78
    % 77 78
    otherDTs{A2}.Name = A2_str;
    otherDTs{A2}.Prefix = 'A2';
    otherDTs{A2}.Entries = cellhorzcat(horzcat('Same as ', P2_str), 'Specify word length', 'Binary point scaling', 'Slope and bias scaling');
    % 81 84
    % 82 84
    % 83 84
    otherDTs{A2}.Type = 'DataTypeRowBestPrec';
    otherDTs{A2}.WordLengthOffset = 10.0;
    % 86 88
    % 87 88
    otherDTs{P3}.Name = P3_str;
    otherDTs{P3}.Prefix = 'P3';
    otherDTs{P3}.Entries = {'Specify word length','Binary point scaling','Slope and bias scaling'};
    % 91 93
    % 92 93
    otherDTs{P3}.Type = 'DataTypeRowBestPrec';
    otherDTs{P3}.WordLengthOffset = 18.0;
    % 95 97
    % 96 97
    otherDTs{A3}.Name = A3_str;
    otherDTs{A3}.Prefix = 'A3';
    otherDTs{A3}.Entries = cellhorzcat(horzcat('Same as ', P3_str), 'Specify word length', 'Binary point scaling', 'Slope and bias scaling');
    % 100 103
    % 101 103
    % 102 103
    otherDTs{A3}.Type = 'DataTypeRowBestPrec';
    otherDTs{A3}.WordLengthOffset = 18.0;
    % 105 107
    % 106 107
    otherDTs{P4}.Name = P4_str;
    otherDTs{P4}.Prefix = 'P4';
    otherDTs{P4}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 110 113
    % 111 113
    % 112 113
    otherDTs{A4}.Name = A4_str;
    otherDTs{A4}.Prefix = 'A4';
    otherDTs{A4}.Entries = cellhorzcat(horzcat('Same as ', P4_str), 'Binary point scaling', 'Slope and bias scaling');
    % 116 122
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    % 121 122
    otherDTs{Q1}.Name = Q1_str;
    otherDTs{Q1}.Prefix = 'Q1';
    otherDTs{Q1}.Entries = {'Specify word length','Binary point scaling','Slope and bias scaling'};
    % 125 127
    % 126 127
    otherDTs{Q1}.Type = 'DataTypeRowBestPrec';
    otherDTs{Q1}.WordLengthOffset = 16.0;
    % 129 132
    % 130 132
    % 131 132
    otherDTs{EM}.Name = EM_str;
    otherDTs{EM}.Prefix = 'EM';
    otherDTs{EM}.Entries = {'Specify word length','Binary point scaling','Slope and bias scaling'};
    % 135 137
    % 136 137
    otherDTs{EM}.Type = 'DataTypeRowBestPrec';
    otherDTs{EM}.WordLengthOffset = 2.0;
    % 139 140
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs, DTypeButton);
    % 141 142
    this.loadFromBlock;
end % function
