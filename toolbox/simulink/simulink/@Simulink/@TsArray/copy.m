function hout = copy(h, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    hout = Simulink.TsArray;
    utdeepcopy(h, hout);
    % 12 14
    if ~(isempty(hout.Members))
        for k=1.0:length(hout.Members)
            name = hout.Members{k};
            ts = h.(name).copy;
            p = schema.prop(hout, name, 'handle');
            set(hout, name, ts);
        end % for
    end
    % 21 23
    if gt(nargin, 1.0)
        hout.Name = varargin{1.0};
    end
end
