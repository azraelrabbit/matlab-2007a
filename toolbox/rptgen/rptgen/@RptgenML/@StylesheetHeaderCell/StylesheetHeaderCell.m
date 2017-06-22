function this = StylesheetHeaderCell(parentObj, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = feval(mfilename('class'));
    if eq(length(varargin), 0.0) || isempty(varargin{1.0})
        javaHandle = parentObj.JavaHandle.getOwnerDocument.createElement('xsl:when');
        javaHandle.setAttribute('test', '');
        varargin{1.0} = javaHandle;
    end % if
    % 15 17
    % 16 17
    this.init(parentObj, varargin{:});
end % function
