function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pkgRG = findpackage('rptgen');
    h = schema.class(pkgRG, 'rptsummtable', pkgRG.findclass('rptcomponent'));
    % 8 10
    p = rptgen.prop(h, 'LoopType', 'string', '', xlate('Object type'));
    % 10 12
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @getLoopType;
    p.SetFunction = @setLoopType;
    % 15 17
    p = rptgen.prop(h, 'TitleType', vertcat(cellhorzcat('auto', xlate('Automatic')), cellhorzcat('manual', horzcat(xlate('Custom'), ':'))), 'auto', xlate('Table title'));
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.prop(h, 'TableTitle', rptgen.makeStringType, 'Summary');
    % 22 24
    pkgRG.findclass('summsrc');
    p = rptgen.prop(h, 'TypeInfo', 'rptgen.summsrc vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.SetFunction = @setTypeInfo;
    p.GetFunction = @getTypeInfo;
    p.Visible = 'off';
    % 32 35
    % 33 35
    p = rptgen.prop(h, 'LoopComp', 'handle');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.GetFunction = @getLoopComp;
    p.SetFunction = @setLoopComp;
    % 41 44
    % 42 44
    p = rptgen.prop(h, 'Properties', 'string vector');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.GetFunction = @getProperties;
    p.SetFunction = @setProperties;
    % 50 53
    % 51 53
    p = rptgen.prop(h, 'Anchor', 'bool');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.GetFunction = @getAnchor;
    p.SetFunction = @setAnchor;
    % 59 62
    % 60 62
    p = rptgen.prop(h, 'ColumnWidths', 'MATLAB array');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.GetFunction = @getColumnWidths;
    p.SetFunction = @setColumnWidths;
    % 68 71
    % 69 71
    p = rptgen.prop(h, 'ColumnHeaders', 'string vector');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.GetFunction = @getColumnHeaders;
    p.SetFunction = @setColumnHeaders;
    % 77 79
    p = rptgen.prop(h, 'FilterEmptyColumns', 'bool');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.GetFunction = @getFilterEmptyColumns;
    p.SetFunction = @setFilterEmptyColumns;
    % 85 89
    % 86 89
    % 87 89
    rptgen.makeStaticMethods(h, {'makeSummTable';'summ_getDefaultType';'summ_getDefaultTypeInfo';'summ_getSplitPropName';'summ_getTypeList'}, {'getLoopObjects';'summ_get';'summ_getPropList';'summ_getPropName';'summ_getSplitProps';'summ_getSplitPropTypes';'summ_getSplitPropList';'summ_getSplitPropProps';'summ_set';'mcodeConstructor'});
    % 89 106
    % 90 106
    % 91 106
    % 92 106
    % 93 106
    % 94 106
    % 95 106
    % 96 106
    % 97 106
    % 98 106
    % 99 106
    % 100 106
    % 101 106
    % 102 106
    % 103 106
    % 104 106
function storedValue = getLoopType(this, storedValue)
    % 106 112
    % 107 112
    % 108 112
    % 109 112
    % 110 112
    if isempty(storedValue)
        storedValue = this.summ_getDefaultType;
        this.LoopType = storedValue;
    end % if
function storedValue = setLoopType(this, proposedValue)
    % 116 120
    % 117 120
    % 118 120
    allTypes = this.summ_getTypeList;
    typeIdx = find(strcmpi(allTypes(:, 1.0), proposedValue));
    % 121 125
    % 122 125
    % 123 125
    if isempty(typeIdx)
        error('rptgen:SummtableTypeMismatch', 'Type "%s" not allowed', proposedValue);
    else
        % 127 129
        storedValue = allTypes{typeIdx(1.0), 1.0};
    end % if
function returnedValue = getTypeInfo(this, storedValue)
    % 131 135
    % 132 135
    % 133 135
    returnedValue = find(this, '-depth', 1.0, '-isa', 'rptgen.summsrc');
    % 135 138
    % 136 138
    if isempty(returnedValue)
        if not(isempty(storedValue))
            setTypeInfo(this, storedValue);
            returnedValue = storedValue;
        else
            returnedValue = this.summ_get(this.summ_getDefaultType);
        end % if
    end % if
function storedValue = setTypeInfo(this, proposedValue)
    % 146 151
    % 147 151
    % 148 151
    % 149 151
    currTypes = find(this, '-depth', 1.0, '-isa', 'rptgen.summsrc');
    % 151 155
    % 152 155
    % 153 155
    for i=1.0:length(currTypes)
        disconnect(currTypes(i));
    end % for
    % 157 161
    % 158 161
    % 159 161
    for i=1.0:length(proposedValue)
        if isa(proposedValue(i), 'rptgen.summsrc')
            connect(proposedValue(i), this, 'up');
        else
            error('rptgen:SummtableSummsrcRequired', 'TypeInfo entries must be rptgen.summsrc');
            % 165 167
        end % if
    end % for
    % 168 170
    storedValue = [];
function storedValue = setLoopComp(this, proposedValue)
    % 171 177
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    this.summ_set(this.LoopType, 'LoopComp', proposedValue);
    storedValue = [];
function returnedValue = getLoopComp(this, storedValue)
    % 179 184
    % 180 184
    % 181 184
    % 182 184
    returnedValue = this.summ_get(this.LoopType, 'LoopComp');
function storedValue = setAnchor(this, proposedValue)
    % 185 190
    % 186 190
    % 187 190
    % 188 190
    this.summ_set(this.LoopType, 'Anchor', proposedValue);
    storedValue = false;
function returnedValue = getAnchor(this, storedValue)
    % 192 197
    % 193 197
    % 194 197
    % 195 197
    returnedValue = this.summ_get(this.LoopType, 'Anchor');
function storedValue = setProperties(this, proposedValue)
    % 198 203
    % 199 203
    % 200 203
    % 201 203
    this.summ_set(this.LoopType, 'Properties', proposedValue);
    storedValue = {};
function returnedValue = getProperties(this, storedValue)
    % 205 210
    % 206 210
    % 207 210
    % 208 210
    returnedValue = this.summ_get(this.LoopType, 'Properties');
function storedValue = setColumnWidths(this, proposedValue)
    % 211 216
    % 212 216
    % 213 216
    % 214 216
    this.summ_set(this.LoopType, 'ColumnWidths', proposedValue);
    storedValue = [];
function returnedValue = getColumnWidths(this, storedValue)
    % 218 223
    % 219 223
    % 220 223
    % 221 223
    returnedValue = this.summ_get(this.LoopType, 'ColumnWidths');
function storedValue = setColumnHeaders(this, proposedValue)
    % 224 230
    % 225 230
    % 226 230
    % 227 230
    % 228 230
    this.summ_set(this.LoopType, 'ColumnHeaders', proposedValue);
    storedValue = [];
function returnedValue = getColumnHeaders(this, storedValue)
    % 232 237
    % 233 237
    % 234 237
    % 235 237
    returnedValue = this.summ_get(this.LoopType, 'ColumnHeaders');
function storedValue = setFilterEmptyColumns(this, proposedValue)
    % 238 243
    % 239 243
    % 240 243
    % 241 243
    this.summ_set(this.LoopType, 'FilterEmptyColumns', proposedValue);
    storedValue = false;
function returnedValue = getFilterEmptyColumns(this, storedValue)
    % 245 250
    % 246 250
    % 247 250
    % 248 250
    returnedValue = this.summ_get(this.LoopType, 'FilterEmptyColumns');
