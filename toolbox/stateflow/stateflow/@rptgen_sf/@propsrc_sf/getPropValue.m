function [pValue, propName] = getPropValue(psSF, objList, propName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if isempty(objList)
        pValue = {};
    else
        switch lower(propName)
        case 'name'
            for i=length(objList):-1.0:1.0
                try
                    pValue{i} = psSF.getObjectName(objList(i));
                catch
                    pValue{i} = 'N/A';
                end % try
            end % for
        case 'fullpath+name'
            d = get(rptgen.appdata_rg, 'CurrentDocument');
            for i=length(objList):-1.0:1.0
                try
                    pValue{i} = psSF.getSLSFPath(objList(i), d);
                catch
                    pValue{i} = 'N/A';
                end % try
            end % for
            propName = 'Name';
        case 'sfpath+name'
            d = get(rptgen.appdata_rg, 'CurrentDocument');
            for i=length(objList):-1.0:1.0
                try
                    pValue{i} = psSF.getSFPath(objList(i), d);
                catch
                    pValue{i} = 'N/A';
                end % try
            end % for
            propName = 'Name';
        case {'machine','chart','subviewer','source','destination'}
            % 42 44
            pValue = safe_get_linked(psSF, propName, objList);
        case {'defaulttransitions';'innertransitions';'outertransitions';'sourcedtransitions'}
            % 45 52
            % 46 52
            % 47 52
            % 48 52
            % 49 52
            % 50 52
            pValue = safe_method_linked(psSF, propName, objList);
            propName = rptgen.prettifyName(propName);
        case {'events','transitions','states','junctions'}
            objType = rptgen.capitalizeFirst(propName(1.0:minus(end, 1.0)));
            pValue = safe_method_linked(psSF, 'find', objList, '-depth', 1.0, '-isa', horzcat('Stateflow.', objType));
        case 'charts'
            pValue = safe_method_linked(psSF, 'find', objList, '-isa', 'Stateflow.Chart');
            % 59 62
            % 60 62
        case 'data'
            % 61 63
            objType = rptgen.capitalizeFirst(propName);
            pValue = safe_method_linked(psSF, 'find', objList, '-depth', 1.0, '-isa', horzcat('Stateflow.', objType));
            % 65 67
        case 'parent'
            % 66 68
            pValue = safe_method_linked(psSF, 'up', objList);
        case {'data type';'datatype'}
            % 69 73
            % 70 73
            % 71 73
            pValue = rptgen.safeGet(objList, 'dataType');
            % 73 75
            fixptIdx = find(strcmp(pValue, 'fixpt'));
            for i=1.0:length(fixptIdx)
                fixptInfo = get(objList(fixptIdx(i)), 'FixptType');
                if eq(fixptInfo.FractionalSlope, 1.0)
                    slopeString = '';
                else
                    slopeString = sprintf('%g*', fixptInfo.FractionalSlope);
                end % if
                % 82 84
                if eq(fixptInfo.Bias, 0.0)
                    biasString = '';
                else
                    biasString = sprintf('+%g', fixptInfo.Bias);
                end % if
                % 88 90
                pValue{fixptIdx(i)} = sprintf('%s, %s2^(%i)%s', fixptInfo.BaseType, slopeString, fixptInfo.RadixPoint, biasString);
                % 90 95
                % 91 95
                % 92 95
                % 93 95
            end % for
            propName = 'Data Type';
        case 'document'
            pValue = rptgen.safeGet(objList, propName);
            for i=1.0:length(pValue)
                if not(isempty(pValue{i}))
                    delimLoc = min(union(find(eq(pValue{i}, '(')), find(eq(pValue{i}, ' '))));
                    if not(isempty(delimLoc))
                        firstToken = pValue{i}(1.0:minus(delimLoc(1.0), 1.0));
                    end % if
                end % if
            end % for
            % 107 109
        case 'label'
            % 108 110
            pValue = rptgen.safeGet(objList, 'LabelString');
        case 'sf id'
            pValue = rptgen.safeGet(objList, 'id');
        case {'creation date','created'}
            pValue = rptgen.safeGet(objList, 'created');
            propName = 'Creation Date';
        case {'created by','creator'}
            pValue = rptgen.safeGet(objList, 'creator');
            propName = 'Created By';
        case 'user include directories'
            pValue = rptgen.safeGet(objList, 'UserIncludeDirs');
            % 121 127
            % 122 127
            % 123 127
            % 124 127
            % 125 127
        case {'init value','initvalue'}
            % 126 128
            pValue = getCommonPropValue(psSF, objList, 'props.initialValue');
        case 'range'
            for i=1.0:length(objList)
                minVal = objList(i).props.range.minimum;
                maxVal = objList(i).props.range.maximum;
                % 132 134
                if isempty(minVal)
                    if isempty(maxVal)
                        pValue{i, 1.0} = '';
                    else
                        pValue{i, 1.0} = horzcat('[-inf ', maxVal, ']');
                    end % if
                else
                    if isempty(maxVal)
                        pValue{i, 1.0} = horzcat('[', minVal, ' inf]');
                    else
                        pValue{i, 1.0} = horzcat('[', minVal, ' ', maxVal, ']');
                    end % if
                end % if
            end % for
        case {'scope';'type';'trigger'}
            % 148 153
            % 149 153
            % 150 153
            % 151 153
            pValue = get_strip_underscore(objList, propName);
        case 'script'
            pValue = rptgen.safeGet(objList, propName);
            d = get(rptgen.appdata_rg, 'CurrentDocument');
            for i=1.0:length(pValue)
                % 157 159
                pValue{i} = createElement(d, 'programlisting', pValue{i});
                setAttribute(pValue{i}, 'xml:space', 'preserve');
            end % for
        case 'requirementinfo'
            propName = xlate('Requirements');
            d = get(rptgen.appdata_rg, 'CurrentDocument');
            % 164 167
            % 165 167
            for i=length(objList):-1.0:1.0
                try
                    % 168 172
                    % 169 172
                    % 170 172
                    pValue{i} = RptgenRMI.getRequirementNode(objList(i), d);
                catch
                    try
                        pValue{i} = rmi('get', objList(i));
                    catch
                        pValue{i} = xlate('Simulink Verification and Validation unavailable');
                    end % try
                end % try
            end % for
        case 'substates'
            % 181 183
            pValue = safe_method_linked(psSF, 'allSubstatesOf', objList);
        otherwise
            % 184 186
            [pValue, propName] = getCommonPropValue(psSF, objList, strrep(propName, ' ', ''));
        end % switch
    end % if
function out = safe_method_linked(psSF, methodName, objList, varargin)
    % 189 194
    % 190 194
    % 191 194
    % 192 194
    d = get(rptgen.appdata_rg, 'CurrentDocument');
    % 194 196
    for i=length(objList):-1.0:1.0
        try
            out{i} = feval(methodName, objList(i), varargin{:});
            ok = true;
        catch
            out{i} = 'N/A';
            ok = false;
        end % try
        % 203 205
        if ok
            if isa(out{i}, 'Simulink.Object')
                % 206 208
                out{i} = makeLink(rptgen_sl.propsrc_sl, out{i}, '', 'link', d);
            else
                % 209 211
                out{i} = makeLink(psSF, out{i}, '', 'link', d);
            end % if
        end % if
    end % for
function out = safe_get_linked(psSF, propName, objList)
    % 215 219
    % 216 219
    % 217 219
    out = rptgen.safeGet(objList, propName);
    d = get(rptgen.appdata_rg, 'CurrentDocument');
    for i=1.0:length(out)
        if ishandle(out{i})
            out{i} = makeLink(psSF, out{i}, '', 'link', d);
        end % if
    end % for
function out = get_strip_underscore(objList, propName)
    % 226 234
    % 227 234
    % 228 234
    % 229 234
    % 230 234
    % 231 234
    % 232 234
    out = rptgen.safeGet(objList, propName);
    for i=1.0:length(out)
        uscoreLoc = findstr(out{i}, '_');
        if not(isempty(uscoreLoc))
            out{i} = strrep(out{i}(1.0:minus(uscoreLoc(end), 1.0)), '_', ' ');
        end % if
    end % for
