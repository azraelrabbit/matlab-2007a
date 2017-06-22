function h = rtwoptions(varargin)
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
    h = tlc.rtwoptions;
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    This = h;
    switch nargin
    case {[1.0]}
        % 29 31
        % 30 31
        This.tlcFile = varargin{1.0};
    otherwise
        error('??? No constructor tlc.rtwoptions with matching signature found.');
    end % switch
    % 35 38
    % 36 38
    % 37 38
    ThisPackage = This.classhandle.package;
    ThisClass = This.classhandle;
    % 40 42
    % 41 42
    hThisProp = find(ThisClass.Properties, 'Name', 'PropertiesName');
    if not(isempty(hThisProp))
        hThisProp.AccessFlags.PublicGet = 'off';
    end % if
    % 46 47
    TLC_Options = This.getOptions;
    for i=1.0:length(TLC_Options)
        ThisOpt = TLC_Options(i);
        switch lower(ThisOpt.type)
        case {'checkbox'}
            % 52 54
            % 53 54
            schema_prop_add_property_to_ParameterInstance = schema.prop(This, ThisOpt.tlcvariable, 'Bool');
        case {'category'}
            % 56 57
            break
        otherwise
            error('Unrecognized type');
        end % switch
    end % for
end % function
