function n = makeNode(d, v, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if isa(v, 'org.w3c.dom.Node')
        n = v;
        return;
    else
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        if isempty(v)
            n = createDocumentFragment(d);
        else
            % 24 26
            if isCellVector(v)
                n = d.createElement('simplelist');
                n.setAttribute('type', 'vert');
                n.setAttribute('columns', '1');
                for cellIdx=1.0:length(v)
                    % 30 34
                    % 31 34
                    % 32 34
                    n.appendChild(d.createElement('member', d.createTextNode(v{cellIdx}, varargin{:})));
                    % 34 36
                end % for
            else
                s = rptgen.toString(v, varargin{:});
                % 38 40
                n = com.mathworks.toolbox.rptgencore.docbook.StringImporter.importHonorLineBreaks(java(d), s);
            end % if
        end % if
    end % if
function tf = isCellVector(v)
    % 44 46
    if iscell(v)
        siz = size(v);
        if lt(length(siz), 3.0)
            if eq(min(siz), 1.0)
                tf = true;
                return;
            end % if
        end % if
    end % if
    tf = false;
