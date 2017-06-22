function sNew = dlgAddPanel(sOrig, varargin)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    addCount = length(varargin);
    % 15 17
    sNew = struct('LayoutGrid', horzcat(plus(addCount, 1.0), 1.0), 'ColStretch', 1.0, 'RowStretch', 1.0, 'Items', []);
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    if isfield(sOrig, 'DialogTitle')
        % 22 25
        % 23 25
        sOrig.Type = 'panel';
        % 25 30
        % 26 30
        % 27 30
        % 28 30
        promoteProps = {'StandaloneButtonSet';'EmbeddedButtonSet';'DialogTitle';'DialogTag';'ExplicitShow';'SmartApply';'HelpMethod';'HelpArgs';'CloseCallback';'CloseArgs';'CloseMethod';'CloseMethodArgs';'CloseMethodArgsDT';'PreApplyCallback';'PreApplyMethod';'PreApplyArgs';'PreApplyArgsDT'};
        % 30 58
        % 31 58
        % 32 58
        % 33 58
        % 34 58
        % 35 58
        % 36 58
        % 37 58
        % 38 58
        % 39 58
        % 40 58
        % 41 58
        % 42 58
        % 43 58
        % 44 58
        % 45 58
        % 46 58
        % 47 58
        % 48 58
        % 49 58
        % 50 58
        % 51 58
        % 52 58
        % 53 58
        % 54 58
        % 55 58
        % 56 58
        for i=1.0:length(promoteProps)
            if isfield(sOrig, promoteProps{i})
                sNew.(promoteProps{i}) = sOrig.(promoteProps{i});
                sOrig = rmfield(sOrig, promoteProps{i});
            end
        end % for
    else
        sNew.Type = 'panel';
    end
    % 66 73
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    rowStretch = [];
    for i=1.0:addCount
        varargin{i}.ColSpan = [1.0 1.0];
        varargin{i}.RowSpan = horzcat(i, i);
        rowStretch(1.0, i) = 0.0;
    end % for
    rowStretch(1.0, plus(addCount, 1.0)) = 1.0;
    sNew.RowStretch = rowStretch;
    % 80 82
    sOrig.ColSpan = [1.0 1.0];
    sOrig.RowSpan = horzcat(plus(addCount, 1.0), plus(addCount, 1.0));
    % 83 85
    varargin{plus(end, 1.0)} = sOrig;
    sNew.Items = varargin;
end
