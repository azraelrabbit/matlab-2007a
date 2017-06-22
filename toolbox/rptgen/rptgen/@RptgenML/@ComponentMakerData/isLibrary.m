function tf = isLibrary(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    tf = not(isa(this.up, 'RptgenML.ComponentMaker'));
end % function
