function h = StylesheetEditor(varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    h = feval(mfilename('class'));
    % 14 16
    if not(isempty(varargin))
        registryLoad(h, varargin{:});
    end
end
function e = getStylesheetEditor(this, id)
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    if lt(nargin, 2.0)
        id = '';
    else
        if isa(id, 'rptgen.coutline')
            id = id.Stylesheet;
        else
            if isa(id, 'rpt_xml.db_output')
                id = id.getStylesheetID;
            end
        end
    end
    e = find(this, '-depth', 1.0, '-isa', 'RptgenML.StylesheetEditor', 'ID', id);
    if isempty(e)
        e = RptgenML.StylesheetEditor(id);
        connect(e, this, 'up');
    end
    view(getEditor(this), e);
end
