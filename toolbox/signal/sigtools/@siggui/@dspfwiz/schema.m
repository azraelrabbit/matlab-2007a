function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('siggui');
    % 8 10
    % 9 10
    if isempty(findtype('dspfwizDestination'))
        schema.EnumType('dspfwizDestination', {'Current','New'});
    end % if
    % 13 14
    c = schema.class(pk, 'dspfwiz', findclass(pk, 'siggui'));
    % 15 16
    p = schema.prop(c, 'Filter', 'MATLAB array');
    set(p, 'SetFunction', @setfilter);
    % 18 19
    p = schema.prop(c, 'UseBasicElements', 'on/off');
    set(p, 'FactoryValue', 'Off', 'Description', 'Build model using basic elements');
    % 21 22
    p = schema.prop(c, 'Destination', 'dspfwizDestination');
    % 23 24
    p = schema.prop(c, 'BlockName', 'string');
    set(p, 'FactoryValue', 'Filter', 'Description', 'Block name');
    % 26 27
    p = schema.prop(c, 'OverwriteBlock', 'on/off');
    set(p, 'GetFunction', @get_overwrite, 'Description', 'Overwrite generated ''%s'' block');
    % 29 31
    % 30 31
    p = vertcat(schema.prop(c, 'OptimizeZeros', 'on/off'), schema.prop(c, 'OptimizeOnes', 'on/off'), schema.prop(c, 'OptimizeNegOnes', 'on/off'), schema.prop(c, 'OptimizeDelayChains', 'on/off'));
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    set(p(1.0), 'Description', 'Optimize for zero gains');
    set(p(2.0), 'Description', 'Optimize for unity gains');
    set(p(3.0), 'Description', 'Optimize for negative gains');
    set(p(4.0), 'Description', 'Optimize delay chains');
    set(p, 'FactoryValue', 'On', 'GetFunction', @get_optimize);
end % function
function Hd = setfilter(this, Hd)
    % 44 47
    % 45 47
    % 46 47
    if not(isempty(Hd)) && not(isa(Hd, 'dfilt.basefilter'))
        error('You must set a valid filter object in the Filter property.');
    end % if
end % function
function ow = get_overwrite(this, ow)
    % 52 54
    % 53 54
    if strcmpi(this.Destination, 'new')
        ow = 'off';
    end % if
end % function
function opt = get_optimize(this, opt)
    % 59 61
    % 60 61
    if strcmpi(this.UseBasicElements, 'off')
        opt = 'off';
    end % if
end % function
