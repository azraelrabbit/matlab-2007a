function out = applyTitle(c, d, dValue, dName, displayType, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if not(isa(dValue, 'org.w3c.dom.Node'))
        % 9 11
        dValue = rptgen.toString(dValue, varargin{:});
    end % if
    % 12 14
    if strcmp(c.TitleMode, 'none')
        if not(strcmp(displayType, 'text'))
            out = d.createElement('para', dValue);
        else
            out = dValue;
        end % if
    else
        if not(strcmp(displayType, 'text'))
            out = d.createElement('formalpara', d.createElement('title', dName), d.createElement('para', dValue));
        else
            % 23 25
            % 24 26
            out = createDocumentFragment(d, createElement(d, 'emphasis', dName), horzcat(' ', dValue));
            % 26 29
            % 27 29
        end % if
    end % if
