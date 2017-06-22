function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pkg = findpackage('RptgenML');
    pkgRG = findpackage('rptgen');
    % 9 11
    clsH = schema.class(pkg, 'StylesheetEditor', pkgRG.findclass('DAObject'));
    % 11 15
    % 12 15
    % 13 15
    p = rptgen.prop(clsH, 'JavaHandle', 'com.mathworks.toolbox.rptgencore.tools.StylesheetMaker');
    % 15 17
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    p.Visible = 'off';
    % 23 25
    p = rptgen.prop(clsH, 'Registry', 'String', '', xlate('Parent registry file'));
    % 25 27
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = cellhorzcat(@getFileProp, p.Name);
    p.setFunction = cellhorzcat(@setFileProp, p.Name);
    % 31 33
    p = redirectProp(rptgen.prop(clsH, 'ID', 'String', '', xlate('Unique identifier')));
    % 33 36
    % 34 36
    p = redirectProp(rptgen.prop(clsH, 'DisplayName', 'String', '', xlate('Display name')));
    % 36 40
    % 37 40
    % 38 40
    p = redirectProp(rptgen.prop(clsH, 'TransformType', 'String', '', xlate('Transform type')));
    % 40 43
    % 41 43
    p = redirectProp(rptgen.prop(clsH, 'Filename', 'String', '', xlate('Stylesheet file')));
    % 43 46
    % 44 46
    p = redirectProp(rptgen.prop(clsH, 'Description', 'String', '', xlate('Description')));
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    m = schema.method(clsH, 'clearStylesheet');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 56 58
    m = schema.method(clsH, 'createLibrary', 'static');
    % 58 61
    % 59 61
    m = schema.method(clsH, 'exploreAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 65 67
    m = schema.method(clsH, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 71 73
    m = schema.method(clsH, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 77 79
    m = schema.method(clsH, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 83 85
    m = schema.method(clsH, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 89 91
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 95 97
    m = schema.method(clsH, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 101 103
    m = schema.method(clsH, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 107 109
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 113 116
    % 114 116
    m = schema.method(clsH, 'canAcceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 120 122
    m = schema.method(clsH, 'acceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 126 128
    m = schema.method(clsH, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
function returnedValue = getStringProp(this, storedValue, propName)
    % 133 159
    % 134 159
    % 135 159
    % 136 159
    % 137 159
    % 138 159
    % 139 159
    % 140 159
    % 141 159
    % 142 159
    % 143 159
    % 144 159
    % 145 159
    % 146 159
    % 147 159
    % 148 159
    % 149 159
    % 150 159
    % 151 159
    % 152 159
    % 153 159
    % 154 159
    % 155 159
    % 156 159
    % 157 159
    j = this.JavaHandle;
    % 159 161
    if isempty(j)
        returnedValue = storedValue;
    else
        returnedValue = javaMethod(horzcat('get', propName), j);
        if not(isempty(returnedValue))
            returnedValue = char(returnedValue);
        else
            returnedValue = '';
        end % if
    end % if
function valueStored = setStringProp(this, proposedValue, propName)
    % 171 176
    % 172 176
    % 173 176
    % 174 176
    j = this.JavaHandle;
    % 176 178
    if isempty(j)
        valueStored = proposedValue;
    else
        javaMethod(horzcat('set', propName), j, proposedValue);
        valueStored = '';
    end % if
function returnedValue = getFileProp(this, storedValue, propName)
    % 184 189
    % 185 189
    % 186 189
    % 187 189
    j = this.JavaHandle;
    % 189 191
    if isempty(j)
        returnedValue = storedValue;
    else
        returnedValue = javaMethod(horzcat('get', propName), j);
        if not(isempty(returnedValue))
            returnedValue = char(getAbsolutePath(returnedValue));
        else
            returnedValue = '';
        end % if
    end % if
function valueStored = setFileProp(this, proposedValue, propName)
    % 201 206
    % 202 206
    % 203 206
    % 204 206
    j = this.JavaHandle;
    if isempty(j)
        valueStored = proposedValue;
    else
        valueStored = '';
        if not(isempty(proposedValue))
            proposedValue = java.io.File(proposedValue);
        else
            proposedValue = [];
        end % if
        % 215 217
        javaMethod(horzcat('set', propName), j, proposedValue);
    end % if
function p = redirectProp(p)
    % 219 224
    % 220 224
    % 221 224
    % 222 224
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = cellhorzcat(@getStringProp, p.Name);
    p.setFunction = cellhorzcat(@setStringProp, p.Name);
