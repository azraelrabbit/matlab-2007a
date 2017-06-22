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
    clsH = schema.class(pkg, 'StylesheetAttributeSet', pkg.findclass('StylesheetElementID'));
    % 11 15
    % 12 15
    % 13 15
    p = rptgen.prop(clsH, 'UseAttributeSets', 'string vector');
    p.Description = xlate('Inherit attribute sets');
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @getUseAttributeSets;
    p.setFunction = @setUseAttributeSets;
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    m = schema.method(clsH, 'canAcceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 30 32
    m = schema.method(clsH, 'acceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
function returnedValue = getUseAttributeSets(this, storedValue)
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    try
        returnedValue = com.mathworks.toolbox.rptgen.xml.StylesheetEditor.getUseAttributeSets(this.JavaHandle);
        if isempty(returnedValue)
            returnedValue = {};
        else
            returnedValue = cellstr(char(returnedValue));
        end % if
    catch
        warning(lasterror);
        returnedValue = {};
    end % try
function storedValue = setUseAttributeSets(this, proposedValue)
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    try
        com.mathworks.toolbox.rptgen.xml.StylesheetEditor.setUseAttributeSets(this.JavaHandle, proposedValue);
    catch
        warning(lasterror);
    end % try
    % 65 67
    storedValue = {};
