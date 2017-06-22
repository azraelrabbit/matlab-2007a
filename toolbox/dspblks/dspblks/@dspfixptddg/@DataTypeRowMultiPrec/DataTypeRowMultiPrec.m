function this = DataTypeRowMultiPrec(row, controller, customStruct)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    this = dspfixptddg.DataTypeRowMultiPrec;
    % 24 26
    this.Row = row;
    this.Controller = controller;
    this.Block = controller.Block;
    this.Name = customStruct.Name;
    this.Entries = customStruct.Entries;
    this.Prefix = customStruct.Prefix;
    this.ParamBlock = customStruct.ParamBlock;
    this.ParamFuncName = customStruct.ParamFuncName;
    this.NumPrecs = customStruct.NumPrecs;
    % 34 38
    % 35 38
    % 36 38
    maskNames = this.ParamBlock.(this.ParamFuncName)('MASK_NAMES');
    this.MaskPropNames{1.0} = maskNames{1.0};
    this.PropNames{1.0} = 'FracLength';
    this.SlopeTags{1.0} = 'Slope1';
    for ind=2.0:this.NumPrecs
        this.MaskPropNames{ind} = maskNames{ind};
        this.PropNames{ind} = horzcat('FracLength', num2str(ind));
        this.SlopeTags{ind} = horzcat('Slope', num2str(ind));
        schema.prop(this, this.PropNames{ind}, 'string');
    end % for
    % 47 49
    this.loadFromBlock;
end
