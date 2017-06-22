function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_fp');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'cfp_options', pkgRG.findclass('rptcomponent'));
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    p = rptgen.prop(h, 'FixLogPref', vertcat(cellhorzcat('1', xlate('All Fixed Point blocks')), cellhorzcat('2', xlate('No logging')), cellhorzcat('0', xlate('Use block "dolog" parameter')), {'obsolete',''}), 'obsolete', xlate('Log Min and Max'));
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    p.setFunction = @setFixLogPref;
    % 27 30
    % 28 30
    p = rptgen.prop(h, 'FixUseDbl', vertcat(cellhorzcat('1', xlate('All Fixed Point blocks')), cellhorzcat('2', xlate('No doubles')), cellhorzcat('0', xlate('Use block "DblOver" parameter')), {'obsolete',''}), 'obsolete', xlate('Doubles Override'));
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    p.setFunction = @setFixUseDbl;
    % 38 41
    % 39 41
    p = rptgen.prop(h, 'FixLogMerge', vertcat(cellhorzcat('0', xlate('Override log')), cellhorzcat('1', xlate('Merge log')), {'obsolete',''}), 'obsolete', xlate('Log Mode'));
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    p.setFunction = @setFixLogMerge;
    % 48 51
    % 49 51
    rptgen.prop(h, 'DataTypeOverride', vertcat(cellhorzcat('UseLocalSettings', xlate('Use local settings')), cellhorzcat('ScaledDoubles', xlate('Scaled doubles')), cellhorzcat('TrueDoubles', xlate('True doubles')), cellhorzcat('TrueSingles', xlate('True singles')), cellhorzcat('ForceOff', xlate('Force off'))), 'UseLocalSettings', xlate('Data Type Override'));
    % 51 60
    % 52 60
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    rptgen.prop(h, 'MinMaxOverflowLogging', vertcat(cellhorzcat('UseLocalSettings', xlate('Use local settings')), cellhorzcat('MinMaxAndOverflow', xlate('Min, max, and overflow')), cellhorzcat('OverflowOnly', xlate('Overflow only')), cellhorzcat('ForceOff', xlate('Force off'))), 'UseLocalSettings', xlate('Logging Mode'));
    % 60 68
    % 61 68
    % 62 68
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    rptgen.prop(h, 'MinMaxOverflowArchiveMode', vertcat(cellhorzcat('Overwrite', xlate('Overwrite log')), cellhorzcat('Merge', xlate('Merge log'))), 'Overwrite', xlate('Logging Type'));
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    rptgen.makeStaticMethods(h, {}, {});
    % 74 76
function valueStored = setFixLogMerge(this, valueProposed)
    % 76 84
    % 77 84
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    switch valueProposed
    case '0'
        this.MinMaxOverflowArchiveMode = 'Overwrite';
    case '1'
        this.MinMaxOverflowArchiveMode = 'Merge';
        % 88 90
    end % switch
    valueStored = 'obsolete';
function valueStored = setFixUseDbl(this, valueProposed)
    % 92 99
    % 93 99
    % 94 99
    % 95 99
    % 96 99
    % 97 99
    switch valueProposed
    case '1'
        this.DataTypeOverride = 'TrueDoubles';
    case '2'
        this.DataTypeOverride = 'ForceOff';
    case '0'
        this.DataTypeOverride = 'UseLocalSettings';
        % 105 107
    end % switch
    valueStored = 'obsolete';
function valueStored = setFixLogPref(this, valueProposed)
    % 109 117
    % 110 117
    % 111 117
    % 112 117
    % 113 117
    % 114 117
    % 115 117
    switch valueProposed
    case '1'
        this.MinMaxOverflowLogging = 'MinMaxAndOverflow';
    case '2'
        this.MinMaxOverflowLogging = 'ForceOff';
    case '0'
        this.MinMaxOverflowLogging = 'UseLocalSettings';
        % 123 125
    end % switch
    valueStored = 'obsolete';
