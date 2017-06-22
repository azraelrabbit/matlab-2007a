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
    clsH = schema.class(pkg, 'StylesheetVarpair', pkg.findclass('StylesheetElementID'));
    % 11 15
    % 12 15
    % 13 15
    p = rptgen.prop(clsH, 'Varname', 'string');
    p.Description = xlate('Variable');
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @getVarname;
    p.setFunction = @setVarname;
    p.Visible = 'off';
    % 22 24
    p = rptgen.prop(clsH, 'Varvalue', 'string');
    p.Description = xlate('Value');
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @getVarvalue;
    p.setFunction = @setVarvalue;
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
function returnedValue = getVarname(this, storedValue)
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    if isempty(this.JavaHandle)
        returnedValue = horzcat('[[', xlate('unnamed'), ']]');
    else
        try
            returnedValue = char(com.mathworks.toolbox.rptgen.xml.StylesheetEditor.getVarpairID(this.JavaHandle));
        catch
            returnedValue = horzcat('[[', xlate('error'), ']]');
        end % try
    end % if
function valueStored = setVarname(this, proposedValue)
    % 59 63
    % 60 63
    % 61 63
    valueStored = '';
    com.mathworks.toolbox.rptgen.xml.StylesheetEditor.setVarpairID(this.JavaHandle, proposedValue);
function returnedValue = getVarvalue(this, storedValue)
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    if isempty(this.JavaHandle)
        returnedValue = horzcat('[[', xlate('no value'), ']]');
    else
        try
            returnedValue = char(com.mathworks.toolbox.rptgen.xml.StylesheetEditor.getVarpairValue(this.JavaHandle));
        catch
            returnedValue = horzcat('[[', xlate('error'), ']]');
        end % try
    end % if
function valueStored = setVarvalue(this, proposedValue)
    % 80 84
    % 81 84
    % 82 84
    valueStored = '';
    com.mathworks.toolbox.rptgen.xml.StylesheetEditor.setVarpairValue(this.JavaHandle, proposedValue);
