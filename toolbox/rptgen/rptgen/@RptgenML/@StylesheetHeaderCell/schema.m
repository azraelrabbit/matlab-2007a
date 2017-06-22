function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('RptgenML');
    % 10 11
    clsH = schema.class(pkg, 'StylesheetHeaderCell', pkg.findclass('StylesheetElement'));
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = rptgen.prop(clsH, 'Test', 'string');
    p.Description = xlate('Condition');
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @getTest;
    p.setFunction = @setTest;
    % 23 24
    m = schema.method(clsH, 'listTestSpecial', 'static');
    m = schema.method(clsH, 'dlgValueSpecial', 'static');
    m = schema.method(clsH, 'setValueSpecial', 'static');
    % 27 28
    m = schema.method(clsH, 'acceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 33 34
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 39 40
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
function returnedValue = getTest(this, storedValue)
    % 47 54
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    % 53 54
    try
        returnedValue = char(getAttribute(this.JavaHandle, 'test'));
    catch
        warning(lasterr);
        returnedValue = '';
    end % try
end % function
function storedValue = setTest(this, proposedValue)
    % 62 66
    % 63 66
    % 64 66
    % 65 66
    try
        setAttribute(this.JavaHandle, 'test', proposedValue);
    catch
        warning(lasterr);
    end % try
    % 71 72
    storedValue = '';
end % function
