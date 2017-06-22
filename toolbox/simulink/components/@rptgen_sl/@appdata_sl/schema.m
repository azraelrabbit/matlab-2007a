function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 9 11
    h = schema.class(pkg, 'appdata_sl', pkgRG.findclass('appdata'));
    % 11 13
    p = newSchema(h, 'CurrentModel', 'string');
    p.getFunction = @gvCurrentModel;
    p.setFunction = @setCurrentModel;
    p = newSchema(h, 'CurrentSystem', 'string');
    p.getFunction = @gvCurrentSystem;
    p = newSchema(h, 'CurrentBlock', 'string');
    p.getFunction = @gvCurrentBlock;
    p = newSchema(h, 'CurrentSignal', 'double', -1.0);
    p.getFunction = @gvCurrentSignal;
    p = newSchema(h, 'CurrentAnnotation', 'double', -1.0);
    p.getFunction = @gvCurrentAnnotation;
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    p = newSchema(h, 'Context', 'string', '');
    % 28 31
    % 29 31
    p = newSchema(h, 'ReportedSystemList', 'string vector');
    p.getFunction = @gvReportedSystemList;
    p = newSchema(h, 'ReportedBlockList', 'string vector');
    p.getFunction = @gvReportedBlockList;
    p = newSchema(h, 'ReportedSignalList', 'double vector');
    p.getFunction = @gvReportedSignalList;
    % 36 38
    p = newSchema(h, 'RtwCompiledModels', 'string vector', {});
    % 38 41
    % 39 41
    p = newSchema(h, 'PreRunOpenModels', 'double vector', NaN);
    p.getFunction = @gvPreRunOpenModels;
end % function
function p = newSchema(h, name, dataType, factoryValue)
    % 44 48
    % 45 48
    % 46 48
    if strcmp(dataType, 'double vector')
        dataType = 'MATLAB array';
        % 49 51
    end % if
    % 51 53
    p = schema.prop(h, name, dataType);
    p.AccessFlags.Init = 'on';
    p.AccessFlags.Reset = 'on';
    p.AccessFlags.AbortSet = 'off';
    % 56 58
    if gt(nargin, 3.0)
        p.FactoryValue = factoryValue;
    end % if
end % function
function val = setCurrentModel(this, val)
    % 62 66
    % 63 66
    % 64 66
    this.CurrentSystem = '';
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    this.ReportedSystemList = {};
    this.ReportedBlockList = {};
    this.ReportedSignalList = [];
end % function
function val = setCurrentSystem(this, val)
    % 75 78
    % 76 78
    this.CurrentBlock = '';
    this.CurrentSignal = -1.0;
    this.CurrentAnnotation = -1.0;
end % function
function val = gvCurrentModel(this, val)
    % 82 89
    % 83 89
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    if isempty(val)
        val = bdroot(get_param(0.0, 'CurrentSystem'));
    end % if
end % function
function val = gvCurrentSystem(this, val)
    % 93 96
    % 94 96
    if isempty(val)
        val = get_param(0.0, 'CurrentSystem');
    end % if
end % function
function val = gvCurrentBlock(this, val)
    % 100 103
    % 101 103
    if isempty(val)
        currSys = this.CurrentSystem;
        if not(isempty(currSys))
            val = gcb(currSys);
        end % if
    end % if
end % function
function val = gvCurrentAnnotation(this, val)
    % 110 113
    % 111 113
    if eq(val, -1.0)
        currSys = this.CurrentSystem;
        if not(isempty(currSys))
            aList = find_system(currSys, 'findall', 'on', 'SearchDepth', 1.0, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'type', 'annotation');
            % 116 122
            % 117 122
            % 118 122
            % 119 122
            % 120 122
            if not(isempty(aList))
                val = aList(1.0);
            end % if
        end % if
    end % if
end % function
function val = gvCurrentSignal(this, val)
    % 128 131
    % 129 131
    if eq(val, -1.0)
        currSys = this.CurrentSystem;
        if not(isempty(currSys))
            sList = find_system(currSys, 'findall', 'on', 'SearchDepth', 1.0, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'Type', 'port', 'PortType', 'outport');
            % 134 141
            % 135 141
            % 136 141
            % 137 141
            % 138 141
            % 139 141
            if not(isempty(sList))
                val = sList(1.0);
            end % if
        end % if
    end % if
end % function
function val = gvReportedSystemList(this, val)
    % 147 150
    % 148 150
    if isempty(val)
        mdlName = this.CurrentModel;
        % 151 153
        if not(isempty(mdlName))
            loopObj = rptgen_sl.rpt_mdl_loop_options('MdlName', mdlName, 'MdlCurrSys', {'$top'}, 'SysLoopType', 'all');
            % 154 157
            % 155 157
            val = loopObj.getReportedSystems(mdlName);
        end % if
    end % if
end % function
function val = gvReportedBlockList(this, val)
    % 161 164
    % 162 164
    if isempty(val)
        val = unique(find_system(this.ReportedSystemList, 'SearchDepth', 1.0, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'type', 'block'));
        % 165 171
        % 166 171
        % 167 171
        % 168 171
        % 169 171
        this.ReportedBlockList = val;
    end % if
end % function
function val = gvReportedSignalList(this, val)
    % 174 178
    % 175 178
    % 176 178
    if isempty(val)
        val = unique(find_system(this.ReportedSystemList, 'findall', 'on', 'SearchDepth', 1.0, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'type', 'port', 'porttype', 'outport'));
        % 179 187
        % 180 187
        % 181 187
        % 182 187
        % 183 187
        % 184 187
        % 185 187
        this.ReportedSignalList = val;
    end % if
end % function
function val = gvPreRunOpenModels(this, val)
    % 190 194
    % 191 194
    % 192 194
    if not(isempty(val)) && all(isnan(val))
        val = find_system(0.0, 'SearchDepth', 1.0, 'type', 'block_diagram');
        % 195 199
        % 196 199
        % 197 199
        this.PreRunOpenModels = val;
    end % if
end % function
