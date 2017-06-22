function this = Projective(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.Projective(block);
    this.init(block);
    baseDTs = {};
    baseDTs{1.0}.name = 'output';
    baseDTs{1.0}.firstInput = 1.0;
    baseDTs{1.0}.blockSupportsUnsigned = 1.0;
    % 16 18
    % 17 18
    blkbutton = dspGetContainerWidgetBase('pushbutton', 'Open Data Type Diagram', 'DataTypeDiagram');
    % 19 20
    blkbutton.MatlabMethod = 'helpview';
    blkbutton.MatlabArgs = cellhorzcat(horzcat(docroot, '/toolbox/vipblks/vipblks.map'), 'projective', 'CSHelpWindow');
    % 22 23
    blkbutton.RowSpan = [1.0 1.0];
    blkbutton.ColSpan = [1.0 2.0];
    blkbutton.Alignment = 4.0;
    blockInfo.block = block;
    blockInfo.propNames = {};
    blockInfo.propTypes = {};
    DTypeButton = dspfixptddg.DSPWidgetWrapper(blkbutton, blockInfo, 'FixptDType');
    % 30 33
    % 31 33
    % 32 33
    [P1, A1, P2, A2, P3, A3, Matrix] = deal(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0);
    % 34 36
    % 35 36
    P1_str = 'Product 1';
    P2_str = 'Product 2';
    P3_str = 'Product 3';
    % 39 40
    A1_str = 'Accumulator 1';
    A2_str = 'Accumulator 2';
    A3_str = 'Accumulator 3';
    % 43 44
    Matrix_str = 'Matrix';
    % 45 48
    % 46 48
    % 47 48
    otherDTs{P1}.Name = P1_str;
    otherDTs{P1}.Prefix = 'P1';
    otherDTs{P1}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 51 54
    % 52 54
    % 53 54
    otherDTs{A1}.Name = A1_str;
    otherDTs{A1}.Prefix = 'A1';
    otherDTs{A1}.Entries = cellhorzcat(horzcat('Same as ', P1_str), 'Binary point scaling', 'Slope and bias scaling');
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    % 61 62
    otherDTs{P2}.Name = P2_str;
    otherDTs{P2}.Prefix = 'P2';
    otherDTs{P2}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 65 68
    % 66 68
    % 67 68
    otherDTs{A2}.Name = A2_str;
    otherDTs{A2}.Prefix = 'A2';
    otherDTs{A2}.Entries = cellhorzcat(horzcat('Same as ', P2_str), 'Binary point scaling', 'Slope and bias scaling');
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    % 75 76
    otherDTs{P3}.Name = P3_str;
    otherDTs{P3}.Prefix = 'P3';
    otherDTs{P3}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 79 82
    % 80 82
    % 81 82
    otherDTs{A3}.Name = A3_str;
    otherDTs{A3}.Prefix = 'A3';
    otherDTs{A3}.Entries = cellhorzcat(horzcat('Same as ', P3_str), 'Binary point scaling', 'Slope and bias scaling');
    % 85 89
    % 86 89
    % 87 89
    % 88 89
    otherDTs{Matrix}.Name = Matrix_str;
    otherDTs{Matrix}.Prefix = 'Matrix';
    otherDTs{Matrix}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 92 94
    % 93 94
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs, DTypeButton);
    % 95 96
    this.loadFromBlock;
end % function
