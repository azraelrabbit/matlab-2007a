function cv2 = v1convert(cv1)
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
    mlock;
    % 13 15
    if isa(cv1, 'rptcomponent') || isa(cv1, 'rptcp') || isstruct(cv1)
        % 15 18
        % 16 18
        cv2 = convertComponent(cv1);
    else
        if ischar(cv1)
            % 20 24
            % 21 24
            % 22 24
            oldWarn = warning('off', 'MATLAB:unknownElementsNowStruc');
            % 24 30
            % 25 30
            % 26 30
            % 27 30
            % 28 30
            cv1 = hgload(cv1);
            warning(oldWarn);
            % 31 33
            cv2 = RptgenML.v1convert(cv1);
        else
            if ishandle(cv1) && isa(handle(cv1), 'hg.figure')
                % 35 37
                cv2 = convertUimenu(get(cv1, 'children'));
            else
                error('rptgen:ConversionError', 'First argument must be a version 1.x component, version 1.x figure handle, or the filename of a version 1.x setup file');
                % 39 41
            end % if
        end % if
    end % if
function cv2 = convertComponent(cv1)
    % 44 52
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    v1name = cv1.comp.Class;
    v2name = get_v2_name(v1name);
    % 53 55
    cv2 = [];
    if not(isempty(v2name))
        try
            cv2 = feval(v2name);
            cv2.v1convert(cv1);
        catch
            warning('rptgen:ConversionError', 'Conversion error: %s', lasterr);
        end % try
    end % if
    % 63 65
    if isempty(cv2)
        warnStr = sprintf('Could not convert component "%s" from previous version', v1name);
        % 66 68
        warning('rptgen:ConversionError', warnStr);
        cv2 = RptgenML.cv1_adapter(cv1);
    end % if
function cv2 = convertUimenu(h)
    % 71 75
    % 72 75
    % 73 75
    cv2 = convertComponent(get(h, 'UserData'));
    % 75 77
    hChildren = get(h, 'Children');
    for i=1.0:length(hChildren)
        childComp = convertUimenu(hChildren(i));
        if not(isempty(childComp)) && isa(childComp, 'rptgen.rptcomponent')
            connect(cv2, childComp, 'down');
        end % if
    end % for
function v2name = get_v2_name(v1name)
    % 84 88
    % 85 88
    % 86 88
    if not(com.mathworks.toolbox.rptgencore.tools.LegacyConversion.isInitialized)
        showLibrary(RptgenML.Root);
    end % if
    % 90 92
    v2name = char(com.mathworks.toolbox.rptgencore.tools.LegacyConversion.get(v1name));
