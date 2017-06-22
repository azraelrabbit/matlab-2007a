function b = nesl_addmaskparam(pstruct, param, varargin)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if lt(nargin, 2.0)
        error('A Structure and a Mask Param name are the minimum required inputs');
    end % if
    % 23 25
    % 24 25
    cTempMaskParam = [];
    MaskStruct = [];
    % 27 29
    % 28 29
    if not(isempty(regexp(param, '^[ML]_')))
        pm_error('network_engine:nesl_mask:MaskVariablesNotSupported', pstruct.classProps.ClassName);
    end % if
    % 32 34
    % 33 34
    if isfield(pstruct, 'maskedProps')
        MaskStruct = pstruct.maskedProps;
        if isfield(MaskStruct, param)
            cTempMaskParam = getfield(MaskStruct, param);
        end % if
    end % if
    % 40 42
    % 41 42
    if isempty(cTempMaskParam)
        % 43 44
        pm = getappdata(0.0, 'pmGlobals');
        cTempMaskParam = pm.MASK_PARAM;
        cTempMaskParam{pm.VAR_NAME} = param;
        cTempMaskParam{pm.VAR_LABEL} = param;
    end % if
    % 49 52
    % 50 52
    % 51 52
    for idx=1.0:2.0:length(varargin)
        cTempMaskParam{varargin{idx}} = varargin{plus(idx, 1.0)};
    end % for
    % 55 56
    if isempty(MaskStruct)
        % 57 59
        % 58 59
        pstruct.maskedProps = struct(param, cellhorzcat(cTempMaskParam));
    else
        % 61 62
        pstruct.maskedProps = setfield(MaskStruct, param, cTempMaskParam);
    end % if
    % 64 65
    b = pstruct;
end % function
