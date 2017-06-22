function wFormat = dlgFormatWidget(this, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    formatID = set(this, 'Format');
    formatID = ctranspose(formatID(:));
    visibleIndex = [];
    for i=1.0:length(formatID)
        if getVisible(com.mathworks.toolbox.rptgencore.output.OutputFormat.getFormat(formatID(i))) || strcmp(formatID{i}, this.Format)
            visibleIndex(plus(end, 1.0)) = i;
        end % if
    end % for
    % 17 19
    theProp = struct(findprop(this, 'Format'));
    theEnum = findtype(theProp.DataType);
    allValues = horzcat(theEnum.Strings(:), theEnum.DisplayNames(:));
    allValues = allValues(visibleIndex, :);
    theProp.DataType = allValues;
    % 23 25
    wFormat = this.dlgWidget(theProp, 'DialogRefresh', true, varargin{:});
    % 25 27
