function resizefcn(this, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    siggui_resizefcn(this, varargin{:});
    % 11 13
    % 12 13
    hC = find(allchild(this), '-depth', 0.0, '-not', '-isa', 'siggui.dialog');
    % 14 15
    for indx=1.0:length(hC)
        if isrendered(hC(indx))
            resizefcn(hC(indx), varargin{:});
        end % if
    end % for
end % function
