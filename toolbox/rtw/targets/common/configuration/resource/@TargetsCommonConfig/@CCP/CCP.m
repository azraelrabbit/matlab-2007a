function h = CCP(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    h = TargetsCommonConfig.CCP;
    % 8 10
    h.help_callback = 'disp(''not implemented'');';
    % 10 13
    % 11 13
    if eq(nargin, 1.0)
        switch varargin{1.0}
        case 'new'
            % 15 17
            h.configuration_type = 'CCP Configuration';
            % 17 19
            h.hidden_configuration = logical(1);
        otherwise
            error('First argument must be ''new'' ');
        end
    end
end
