function schema
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
    pkg = findpackage('spcwidgets');
    this = schema.class(pkg, 'uimenutoggle');
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    p = schema.prop(this, 'parent', 'MATLAB array');
    % 28 32
    % 29 32
    % 30 32
    p = schema.prop(this, 'Accelerators', 'MATLAB array');
    p.FactoryValue = {};
    p.SetFunction = @sf_accels;
    % 34 38
    % 35 38
    % 36 38
    p = schema.prop(this, 'Callback', 'MATLAB array');
    % 38 42
    % 39 42
    % 40 42
    p = schema.prop(this, 'Checked', 'on/off');
    p.FactoryValue = 'off';
    % 43 47
    % 44 47
    % 45 47
    p = schema.prop(this, 'Enable', 'on/off');
    p.FactoryValue = 'on';
    % 48 52
    % 49 52
    % 50 52
    p = schema.prop(this, 'Labels', 'MATLAB array');
    p.FactoryValue = {};
    p.SetFunction = @sf_labels;
    % 54 58
    % 55 58
    % 56 58
    p = schema.prop(this, 'Separator', 'on/off');
    p.FactoryValue = 'off';
    % 59 61
    schema.prop(this, 'Tag', 'string');
    % 61 64
    % 62 64
    p = schema.prop(this, 'Type', 'string');
    p.FactoryValue = 'spcwidgets.uimenutoggle';
    p.SetFunction = @sf_type;
    % 66 70
    % 67 70
    % 68 70
    p = schema.prop(this, 'Visible', 'on/off');
    p.FactoryValue = 'off';
    % 71 78
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    p = schema.prop(this, 'hmenu', 'MATLAB array');
    p.Visible = 'off';
    % 79 87
    % 80 87
    % 81 87
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    p = schema.prop(this, 'listeners', 'handle.listener vector');
    p.Visible = 'off';
end % function
function val = sf_labels(obj, val)
    % 90 97
    % 91 97
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    if ischar(val)
        val = cellhorzcat(val);
    end % if
    % 99 101
    msg = {'spcwidgets:MustBeString','Labels must be either a string or a cell-array of strings'};
    if not(iscell(val))
        error(msg{:});
    end % if
    numLabels = numel(val);
    for i=1.0:numLabels
        if not(ischar(val{i}))
            error(msg{:});
        end % if
    end % for
    % 110 115
    % 111 115
    % 112 115
    % 113 115
    numAccel = numel(obj.Accel);
    if ne(numLabels, numAccel) && gt(numLabels, 1.0) && gt(numAccel, 1.0)
        error('spcwidgets:NumLabelsAndAccel', 'Number of Labels(%d) and number of Accelerators (%d) are not compatible.\nThere must be the same number of Lables as Accelerators, or one of these\nmust be a single instance for scalar-expansion.', numLabels, numAccel);
        % 117 122
        % 118 122
        % 119 122
        % 120 122
    end % if
end % function
function val = sf_accels(obj, val)
    % 124 131
    % 125 131
    % 126 131
    % 127 131
    % 128 131
    % 129 131
    if ischar(val)
        val = cellhorzcat(val);
    end % if
    % 133 135
    msg = {'spcwidgets:MustBeStringVector','Accelerators must be either a string or a cell-array of strings'};
    % 135 137
    if not(iscell(val))
        error(msg{:});
    end % if
    numAccel = numel(val);
    for i=1.0:numAccel
        if not(ischar(val{i}))
            error(msg{:});
        end % if
    end % for
    % 145 150
    % 146 150
    % 147 150
    % 148 150
    numLabels = numel(obj.Labels);
    if ne(numLabels, numAccel) && gt(numLabels, 1.0) && gt(numAccel, 1.0)
        error('spcwidgets:NumLabelsAndAccel', 'Number of Labels(%d) and number of Accelerators (%d) are not compatible.\nThere must be the same number of Lables as Accelerators, or one of these\nmust be a single instance for scalar-expansion.', numLabels, numAccel);
        % 152 157
        % 153 157
        % 154 157
        % 155 157
    end % if
end % function
function val = sf_type(obj, val)
    % 159 161
    if not(isempty(obj.Type))
        error('Property is read-only.');
    end % if
end % function
