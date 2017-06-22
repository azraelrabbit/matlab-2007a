function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('RptgenML');
    % 9 11
    clsH = schema.class(pkg, 'StylesheetHeader', pkg.findclass('StylesheetElementID'));
    % 11 15
    % 12 15
    % 13 15
    p = rptgen.prop(clsH, 'OtherwiseValue', 'string');
    p.Description = xlate('Use this value for all other conditions');
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @getOtherwiseValue;
    p.setFunction = @setOtherwiseValue;
    % 21 24
    % 22 24
    p = rptgen.prop(clsH, 'OtherwiseValueInvalid', 'string');
    % 24 27
    % 25 27
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    m = schema.method(clsH, 'canAcceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 37 39
    m = schema.method(clsH, 'acceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 43 45
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
function returnedValue = getOtherwiseValue(this, storedValue)
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    if not(isempty(this.OtherwiseValueInvalid))
        % 57 60
        % 58 60
        returnedValue = this.OtherwiseValueInvalid;
    else
        returnedValue = '';
        otherwiseEl = this.getOtherwiseElement;
        if isempty(otherwiseEl)
            returnedValue = '';
        else
            returnedValue = char(com.mathworks.toolbox.rptgencore.tools.StylesheetMaker.getParameterAsString(otherwiseEl));
        end % if
    end % if
function storedValue = setOtherwiseValue(this, proposedValue)
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    otherwiseEl = this.getOtherwiseElement;
    if isempty(otherwiseEl)
        error('rptgen:StylesheetHeader:NonConformingStructure', 'Header does not contain a <choose> structure to assign a default action.');
        % 77 79
    end % if
    % 79 81
    try
        com.mathworks.toolbox.rptgen.xml.StylesheetEditor.setParameterAsStringXML(otherwiseEl, proposedValue);
        this.ErrorMessage = '';
    catch
        this.OtherwiseValueInvalid = proposedValue;
        errMsg = lasterr;
        crLoc = findstr(errMsg, char(10.0));
        if gt(length(crLoc), 1.0)
            % 88 90
            errMsg = errMsg(plus(crLoc(1.0), 1.0):minus(crLoc(2.0), 1.0));
        end % if
        this.ErrorMessage = errMsg;
    end % try
    % 93 95
    storedValue = '';
