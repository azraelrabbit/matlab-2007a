function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(this.Actions) || not(isfield(this.Actions, 'New')) || not(ishandle(this.Actions.New))
        % 8 9
        actionPanel = {};
    else
        % 11 21
        % 12 21
        % 13 21
        % 14 21
        % 15 21
        % 16 21
        % 17 21
        % 18 21
        % 19 21
        % 20 21
        actionPanel = cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(dlgButton(this, this.Actions.New, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0])), cellhorzcat(dlgHyperlink(this, this.Actions.New, 'ColSpan', [2.0 2.0], 'RowSpan', [1.0 1.0])), cellhorzcat(dlgButton(this, this.Actions.Open, 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0])), cellhorzcat(dlgHyperlink(this, this.Actions.Open, 'ColSpan', [2.0 2.0], 'RowSpan', [2.0 2.0])), cellhorzcat(dlgButton(this, this.Actions.ConvertFile, 'ColSpan', [1.0 1.0], 'RowSpan', [3.0 3.0])), cellhorzcat(dlgHyperlink(this, this.Actions.ConvertFile, 'ColSpan', [2.0 2.0], 'RowSpan', [3.0 3.0])), cellhorzcat(dlgButton(this, this.Actions.CreateComponent, 'ColSpan', [1.0 1.0], 'RowSpan', [4.0 4.0])), cellhorzcat(dlgHyperlink(this, this.Actions.CreateComponent, 'ColSpan', [2.0 2.0], 'RowSpan', [4.0 4.0])), cellhorzcat(dlgButton(this, this.Actions.EditStylesheet, 'ColSpan', [1.0 1.0], 'RowSpan', [5.0 5.0])), cellhorzcat(dlgHyperlink(this, this.Actions.EditStylesheet, 'ColSpan', [2.0 2.0], 'RowSpan', [5.0 5.0])), cellhorzcat(dlgButton(this, this.Actions.ExportSimulinkWebView, 'ColSpan', [1.0 1.0], 'RowSpan', [6.0 6.0])), cellhorzcat(dlgHyperlink(this, this.Actions.ExportSimulinkWebView, 'ColSpan', [2.0 2.0], 'RowSpan', [6.0 6.0]))), xlate('Actions'), 'LayoutGrid', [6.0 2.0], 'RowStretch', [0.0 0.0 0.0 0.0 0.0 0.0], 'ColStretch', [0.0 1.0]));
        % 22 60
        % 23 60
        % 24 60
        % 25 60
        % 26 60
        % 27 60
        % 28 60
        % 29 60
        % 30 60
        % 31 60
        % 32 60
        % 33 60
        % 34 60
        % 35 60
        % 36 60
        % 37 60
        % 38 60
        % 39 60
        % 40 60
        % 41 60
        % 42 60
        % 43 60
        % 44 60
        % 45 60
        % 46 60
        % 47 60
        % 48 60
        % 49 60
        % 50 60
        % 51 60
        % 52 60
        % 53 60
        % 54 60
        % 55 60
        % 56 60
        % 57 60
        % 58 60
        % 59 60
    end % if
    % 61 62
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(actionPanel{:}), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgText(horzcat(xlate('This is the main interface for the Report Generator.  Open an'), char(10.0), xlate('existing Report Generator file from the list or create a new one.'), char(10.0))))), xlate('Getting Started')))));
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    % 68 69
end % function
function w = dlgButton(this, action, varargin)
    % 71 78
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    % 77 78
    if not(ishandle(action))
        idProp = 'Name';
        idVal = '';
        tipText = '';
        cbk = '';
        vis = true;
    else
        if isempty(action.Icon)
            idProp = 'Name';
            idVal = action.Text;
            tipText = action.StatusTip;
        else
            idProp = 'FilePath';
            idVal = action.Icon;
            tipText = regexprep(action.Text, '\(&.\)', '');
            tipText = strrep(tipText, '&', '');
        end % if
        cbk = action.Callback;
        vis = strcmpi(action.Visible, 'on');
    end % if
    % 98 99
    w = struct('Type', 'pushbutton', idProp, idVal, 'MatlabMethod', cbk, 'Visible', vis, 'ToolTip', tipText, varargin{:});
    % 100 104
    % 101 104
    % 102 104
    % 103 104
end % function
function w = dlgHyperlink(this, action, varargin)
    % 106 112
    % 107 112
    % 108 112
    % 109 112
    % 110 112
    % 111 112
    if not(ishandle(action))
        w = this.dlgText('', varargin{:});
    else
        vis = strcmpi(action.Visible, 'on');
        w = struct('Type', 'hyperlink', 'Name', action.StatusTip, 'MatlabMethod', action.Callback, 'Visible', vis, varargin{:});
        % 117 121
        % 118 121
        % 119 121
        % 120 121
    end % if
end % function
