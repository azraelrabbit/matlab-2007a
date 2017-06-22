function wStyle = dlgStylesheetWidget(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    propName = this.getStylesheetProperty;
    if isempty(propName)
        % 9 10
        wStyle = this.dlgText('temp', varargin{:});
        wStyle.Name = xlate('DocBook output');
        return;
    else
        % 14 15
        sList = getStylesheetList(RptgenML.StylesheetRoot, propName(11.0:end), '-asynchronous');
        % 16 19
        % 17 19
        % 18 19
        tag = propName;
        propName = struct(findprop(classhandle(this), propName));
        if not(isempty(sList))
            propName.DataType = sList;
        else
            propName.DataType = 'string';
            tag = horzcat(tag, '-editfield');
        end % if
        wStyle = this.dlgWidget(propName, 'Tag', tag, varargin{:});
        % 28 31
        % 29 31
        % 30 31
    end % if
end % function
