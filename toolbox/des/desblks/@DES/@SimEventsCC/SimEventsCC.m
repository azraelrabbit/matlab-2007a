function secc = SimEventsCC
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    secc = DES.SimEventsCC;
    secc.Name = 'SimEvents';
    % 9 11
    % 10 11
    lprops = [];
    pkg = findpackage('DES');
    cls = findclass(pkg, 'SimEvents');
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    myFields = secc.fields;
    for i=1.0:length(myFields)
        prop = findprop(secc, myFields{i});
        if isempty(lprops)
            lprops = prop;
        else
            lprops(plus(end, 1.0)) = prop;
        end % if
    end % for
    % 32 33
    secc.SEListener = handle.listener(secc, lprops, 'PropertyPostSet', @propertyChanged);
    secc.SEListener.CallbackTarget = secc;
end % function
function val = l_to_onoff(val)
    % 37 52
    % 38 52
    % 39 52
    % 40 52
    % 41 52
    % 42 52
    % 43 52
    % 44 52
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    if val
        val = 'on';
    else
        val = 'off';
    end % if
end % function
