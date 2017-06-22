function this = ContrastAdjust(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.ContrastAdjust(block);
    this.init(block);
    % 12 14
    % 13 14
    blkbutton = dspGetContainerWidgetBase('pushbutton', 'Open Data Type Diagram', 'DataTypeDiagram');
    % 15 16
    blkbutton.MatlabMethod = 'helpview';
    blkbutton.MatlabArgs = cellhorzcat(horzcat(docroot, '/toolbox/vipblks/vipblks.map'), 'contrastadjust', 'CSHelpWindow');
    % 18 19
    blkbutton.RowSpan = [1.0 1.0];
    blkbutton.ColSpan = [1.0 2.0];
    blkbutton.Alignment = 4.0;
    blockInfo.block = block;
    blockInfo.propNames = {};
    blockInfo.propTypes = {};
    DTypeButton = dspfixptddg.DSPWidgetWrapper(blkbutton, blockInfo, 'FixptDType');
    % 26 27
    baseDTs = {};
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    otherDTs{1.0}.Name = 'Product 1';
    otherDTs{1.0}.Prefix = 'prod1';
    otherDTs{1.0}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 38 40
    % 39 40
    otherDTs{2.0}.Name = 'Product 2';
    otherDTs{2.0}.Prefix = 'prod2';
    otherDTs{2.0}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 43 45
    % 44 45
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs, DTypeButton);
    % 46 47
    this.loadFromBlock;
end % function
