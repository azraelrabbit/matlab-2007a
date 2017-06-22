function [sourcebloc, sourceport, sourcetype] = BlockSearch(blocstruct, blockname, blockport)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    sourcetype = [];
    % 12 14
    bloc = blocstruct.SrcBlock;
    pine = plus(blocstruct.SrcPort, 1.0);
    % 15 17
    if eq(bloc, -1.0)
        % 17 20
        % 18 20
        sourcebloc = raccordement(blockname, blockport);
        if eq(sourcebloc, -1.0)
            % 21 23
            if strcmp(get_param(blockname, 'BlockType'), 'SubSystem')
                % 23 25
                Inportbloc = find_system(blockname, 'LookUnderMasks', 'on', 'Followlinks', 'on', 'SearchDepth', 1.0, 'BlockType', 'Inport', 'Port', num2str(blockport));
                if isempty(Inportbloc)
                    % 26 28
                    Inportbloc = find_system(blockname, 'LookUnderMasks', 'on', 'Followlinks', 'on', 'SearchDepth', 1.0, 'BlockType', 'EnablePort');
                end % if
                sourcebloc = get_param(Inportbloc, 'Handle');
            else
                % 31 33
                sourcebloc = get_param(blockname, 'Handle');
            end % if
            if iscell(sourcebloc)
                sourcebloc = sourcebloc{1.0};
            end % if
        end % if
        sourceport = 1.0;
        return;
    end % if
    t = get_param(bloc, 'BlockType');
    if isempty(t)
        sourcebloc = bloc;
        sourceport = pine;
        return;
    end % if
    switch t
    case 'Inport'
        % 49 54
        % 50 54
        % 51 54
        % 52 54
        parent = get_param(bloc, 'Parent');
        if strcmp(parent, bdroot(parent))
            % 55 57
            sourcebloc = get_param(bloc, 'Handle');
            sourceport = 1.0;
            sourcetype = [];
            return;
        end % if
        ports = get_param(parent, 'PortConnectivity');
        n = str2double(get_param(bloc, 'Port'));
        % 63 65
        [sourcebloc, sourceport, sourcetype] = BlockSearch(ports(n), parent, n);
    case 'SubSystem'
        % 66 71
        % 67 71
        % 68 71
        % 69 71
        MaskType = get_param(bloc, 'MaskType');
        switch MaskType
        case 'Excitation System'
            % 73 75
            sourcetype = 'Excitation System';
            sourcebloc = uminus(bloc);
            sourceport = 'v0';
        case 'Hydraulic Turbine and Governor'
            % 78 81
            % 79 81
            sourcetype = 'Hydraulic Turbine and Governor';
            sourcebloc = uminus(bloc);
            sourceport = 'po';
        case 'Steam Turbine and Governor'
            % 84 87
            % 85 87
            sourcetype = 'Steam Turbine and Governor';
            gentype = get_param(bloc, 'gentype');
            if eq(gentype, 1.0)
                varb = 'ini1';
            else
                varb = 'ini2';
            end % if
            sourcebloc = uminus(bloc);
            sourceport = varb;
        case 'Diesel Engine & Governor'
            % 96 99
            % 97 99
            sourcebloc = uminus(bloc);
            sourceport = 'Pm0';
        otherwise
            % 101 103
            portbloc = find_system(bloc, 'LookUnderMasks', 'on', 'Followlinks', 'on', 'SearchDepth', 1.0, 'BlockType', 'Outport', 'Port', num2str(pine));
            ports = get_param(portbloc, 'PortConnectivity');
            % 104 106
            [sourcebloc, sourceport, sourcetype] = BlockSearch(ports, portbloc, 1.0);
        end % switch
    otherwise
        % 108 111
        % 109 111
        sourcebloc = bloc;
        sourceport = pine;
    end % switch
function handleline = raccordement(blockname, portname)
    % 114 123
    % 115 123
    % 116 123
    % 117 123
    % 118 123
    % 119 123
    % 120 123
    % 121 123
    handleline = -1.0;
    pa = get_param(blockname, 'parent');
    % 124 126
    li = get_param(pa, 'lines');
    if isempty(li)
        return;
    end % if
    % 129 131
    qi = find(eq(horzcat(li.SrcBlock), -1.0));
    hand = horzcat(li(qi).Handle);
    hg = get_param(blockname, 'Handle');
    % 133 135
    for i=1.0:length(hand)
        pr = get_param(hand(i), 'DstBlockHandle');
        tela = find(eq(pr, hg));
        % 137 139
        if tela
            trc = get_param(hand(i), 'DstPortHandle');
            trcbad = find(eq(trc, -1.0));
            trc(trcbad) = [];
            tr = get_param(trc, 'PortNumber');
            if iscell(tr)
                tr = horzcat(tr{:});
            end % if
            % 146 148
            if find(eq(tr, portname))
                % 148 150
                handleline = hand(i);
                return;
            end % if
        end % if
    end % for
