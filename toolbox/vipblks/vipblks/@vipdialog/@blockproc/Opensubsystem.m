function Opensubsystem(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    bname = horzcat(get(this.Block, 'Parent'), '/', get(this.Block, 'Name'), '/Block iterator/sub-block process');
    try
        open_system(bname);
        % 13 15
        % 14 15
    end % try
end % function
