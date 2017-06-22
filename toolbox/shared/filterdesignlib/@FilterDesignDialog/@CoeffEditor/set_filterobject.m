function Hd = set_filterobject(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    names = coefficientnames(Hd);
    for indx=1.0:length(names)
        p(indx) = Hd.findprop(names{indx});
    end % for
    % 11 13
    p(plus(end, 1.0)) = Hd.findprop('PersistentMemory');
    p(plus(end, 1.0)) = Hd.findprop('States');
    % 14 16
    l = handle.listener(Hd, p, 'PropertyPostSet', @(h,ed)updateCoefficients(this,Hd));
    % 16 18
    set(this, 'FilterListener', l);
    % 18 20
    updateCoefficients(this, Hd);
    % 20 22
    [pkg, cls] = strtok(class(Hd), '.');
    cls(1.0) = [];
    % 23 25
    set(this.FixedPoint, 'Structure', cls);
    updateSettings(this.FixedPoint, Hd);
end
function updateCoefficients(this, Hd)
    % 28 31
    % 29 31
    names = coefficientnames(Hd);
    values = get(Hd, names);
    % 32 34
    props = sprintf('CoefficientVector%d\n', 1.0:length(names));
    props(end) = [];
    props = cellstr(props);
    % 36 38
    for indx=1.0:length(values)
        values{indx} = mat2str(values{indx});
    end % for
    % 40 42
    set(this, props, values);
    % 42 44
    if Hd.PersistentMemory
        pMem = 'on';
    else
        pMem = 'off';
    end
    % 48 50
    set(this, 'PersistentMemory', pMem, 'States', mat2str(get(Hd, 'States')));
end
