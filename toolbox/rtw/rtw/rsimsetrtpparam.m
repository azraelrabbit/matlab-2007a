function out_rtp = rsimsetrtpparam(in_rtp, varargin)
    % 1 41
    % 2 41
    % 3 41
    % 4 41
    % 5 41
    % 6 41
    % 7 41
    % 8 41
    % 9 41
    % 10 41
    % 11 41
    % 12 41
    % 13 41
    % 14 41
    % 15 41
    % 16 41
    % 17 41
    % 18 41
    % 19 41
    % 20 41
    % 21 41
    % 22 41
    % 23 41
    % 24 41
    % 25 41
    % 26 41
    % 27 41
    % 28 41
    % 29 41
    % 30 41
    % 31 41
    % 32 41
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    if lt(nargin, 2.0)
        % 42 43
        help('rsimsetrtpparam');
        out_rtp = in_rtp;
        return;
    end % if
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    if isnumeric(varargin{1.0})
        idx = varargin{1.0};
        if gt(length(idx), 1.0) || lt(idx, 1.0) || not(isreal(idx))
            DAStudio.error('RTW:rsim:SetRTPParamBadIdx');
        end % if
        argidx = 2.0;
        expandFlag = true;
    else
        idx = 1.0;
        argidx = 1.0;
        expandFlag = false;
    end % if
    % 64 68
    % 65 68
    % 66 68
    % 67 68
    if not(isstruct(in_rtp)) || not(isfield(in_rtp, 'parameters'))
        DAStudio.error('RTW:rsim:SetRTPParamBadRTP');
    end % if
    % 71 72
    if not(iscell(in_rtp.parameters))
        p = in_rtp.parameters;
    else
        if gt(idx, length(in_rtp.parameters))
            p = in_rtp.parameters{1.0};
        else
            p = in_rtp.parameters{idx};
        end % if
    end % if
    % 81 82
    if not(isstruct(p)) || not(isfield(p, 'map'))
        DAStudio.error('RTW:rsim:SetRTPParamBadMap');
    end % if
    % 85 86
    nvarargin = length(varargin);
    % 87 89
    % 88 89
    if not(mod(minus(nvarargin, argidx), 2.0))
        DAStudio.error('RTW:rsim:SetRTPParamBadParamCount');
    end % if
    % 92 93
        while lt(argidx, nvarargin)
        paramname = varargin{argidx};
        val = varargin{plus(argidx, 1.0)};
        argidx = plus(argidx, 2.0);
        % 97 99
        % 98 99
        p = setOneRTPParam(p, paramname, val);
    end % while
    % 101 103
    % 102 103
    out_rtp = in_rtp;
    % 104 105
    if not(iscell(out_rtp.parameters))
        if expandFlag
            p1 = out_rtp.parameters;
            out_rtp.parameters = [];
            out_rtp.parameters{1.0} = p1;
        else
            out_rtp.parameters = p;
            return;
        end % if
    end % if
    % 115 117
    % 116 117
    numsets = length(out_rtp.parameters);
    if gt(idx, numsets)
        for i=plus(numsets, 1.0):idx
            out_rtp.parameters{i} = out_rtp.parameters{1.0};
        end % for
    end % if
    % 123 124
    out_rtp.parameters{idx} = p;
end % function
function p = setOneRTPParam(p, parameterName, val)
    % 127 132
    % 128 132
    % 129 132
    % 130 132
    % 131 132
    numtypes = length(p);
    mapIdx = [];
    typeIdx = [];
    for i=1.0:numtypes
        prmNames = cellhorzcat(p(i).map.Identifier);
        mapIdx = strmatch(parameterName, prmNames, 'exact');
        if not(isempty(mapIdx))
            typeIdx = i;
            break
        end % if
    end % for
    % 143 144
    if isempty(mapIdx)
        DAStudio.error('RTW:rsim:SetRTPParamBadIdentifier', parameterName);
    end % if
    map = p(typeIdx).map(mapIdx);
    % 148 151
    % 149 151
    % 150 151
    numind = plus(minus(map.ValueIndices(2.0), map.ValueIndices(1.0)), 1.0);
    if ne(numel(val), numind)
        DAStudio.error('RTW:rsim:SetRTPParamBadValueSize', inputname(3.0), parameterName);
    end % if
    % 155 156
    if not(isequal(size(val), map.Dimensions))
        DAStudio.error('RTW:rsim:SetRTPParamBadValueDimensions', inputname(3.0), size(val, 1.0), size(val, 2.0));
    end % if
    % 159 160
    if not(eq(p(typeIdx).complex, not(isreal(val))))
        DAStudio.error('RTW:rsim:SetRTPParamBadValueComplexity', inputname(3.0), parameterName);
    end % if
    % 163 166
    % 164 166
    % 165 166
    fullInd = linspace(map.ValueIndices(1.0), map.ValueIndices(2.0), numind);
    p(typeIdx).values(fullInd) = val(:);
    % 168 169
end % function
