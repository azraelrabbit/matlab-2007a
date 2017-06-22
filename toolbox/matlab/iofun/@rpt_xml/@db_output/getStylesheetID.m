function s = getStylesheetID(o, varargin)
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
    propName = o.getStylesheetProperty(varargin{:});
    if isempty(propName)
        s = '';
    else
        s = get(o, propName);
        % 18 20
        if isempty(s)
            % 20 22
            s = horzcat('default-', lower(propName(11.0:end)));
        end % if
        % 23 25
        if ischar(s)
        else
            if isa(s, 'java.lang.String')
                s = char(s);
            else
                if isa(s, 'com.mathworks.toolbox.rptgencore.tools.StylesheetMaker')
                    s = char(s.getID);
                else
                    if isa(s, 'javax.xml.transform.Source')
                        s = char(s.toString);
                    else
                        s = [];
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function
